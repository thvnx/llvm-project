//===-- KVXHardwareLoops.cpp - Hardware loops optimization step -*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains a pass that attempts to optimize a loop using the
// LOOPDO Kalray instruction
//
//===----------------------------------------------------------------------===//

#include "llvm/ADT/StringRef.h"
#include "llvm/CodeGen/MachineDominators.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineLoopInfo.h"
#include "llvm/InitializePasses.h"

#include "KVX.h"
#include "KVXHardwareLoops.h"
#include "KVXInstrInfo.h"
#include "KVXSubtarget.h"
using namespace llvm;

#define DEBUG_TYPE "hwloops"

#define KVXHARDWARELOOPS_NAME "kvx-hardware-loops"
#define KVXHARDWARELOOPS_DESC "Hardware loops"

using instr_iterator = MachineBasicBlock::instr_iterator;

char KVXHardwareLoops::ID = 0;

INITIALIZE_PASS_BEGIN(KVXHardwareLoops, KVXHARDWARELOOPS_NAME,
                      KVXHARDWARELOOPS_DESC, false, false)
INITIALIZE_PASS_DEPENDENCY(MachineDominatorTree)
INITIALIZE_PASS_DEPENDENCY(MachineLoopInfo)
INITIALIZE_PASS_END(KVXHardwareLoops, KVXHARDWARELOOPS_NAME,
                    KVXHARDWARELOOPS_DESC, false, false)

static bool isMakeOperator(unsigned opcode) {
  switch (opcode) {
  case KVX::MAKEi16:
  case KVX::MAKEi43:
  case KVX::MAKEi64:
    return true;
  default:
    return false;
  }
  return false;
}

static bool isExtensionOperator(unsigned opcode) {
  switch (opcode) {
  case KVX::ZXWD:
  case KVX::ZXBD:
  case KVX::ZXHD:
  case KVX::SXBD:
  case KVX::SXHD:
  case KVX::SXWD:
    return true;
  default:
    return false;
  }
  return false;
}

static bool isCompOperator(unsigned opcode) {
  switch (opcode) {
  case KVX::COMPWri:
  case KVX::COMPWrr:
  case KVX::COMPDri10:
  case KVX::COMPDri37:
  case KVX::COMPDri64:
  case KVX::COMPDrr:
  case KVX::FCOMPWri:
  case KVX::FCOMPWrr:
  case KVX::FCOMPD:
    return true;
  default:
    return false;
  }

  return false;
}

static unsigned GetOppositeCondition(unsigned Cond) {
  switch (Cond) {
  case KVXMOD::COMPARISON_EQ:
    return KVXMOD::COMPARISON_NE;
  case KVXMOD::COMPARISON_NE:
    return KVXMOD::COMPARISON_EQ;
  case KVXMOD::COMPARISON_GE:
    return KVXMOD::COMPARISON_LT;
  case KVXMOD::COMPARISON_LE:
    return KVXMOD::COMPARISON_GT;
  case KVXMOD::COMPARISON_GEU:
    return KVXMOD::COMPARISON_LTU;
  case KVXMOD::COMPARISON_LEU:
    return KVXMOD::COMPARISON_GTU;
  case KVXMOD::COMPARISON_LT:
    return KVXMOD::COMPARISON_GE;
  case KVXMOD::COMPARISON_GT:
    return KVXMOD::COMPARISON_LE;
  case KVXMOD::COMPARISON_LTU:
    return KVXMOD::COMPARISON_GEU;
  case KVXMOD::COMPARISON_GTU:
    return KVXMOD::COMPARISON_LEU;
  }
  llvm_unreachable("Comparison mode not recognized");
}

static bool IsZero(MachineOperand &Op) {
  if (Op.isImm() && Op.getImm() == 0)
    return true;
  if (Op.isFPImm() && Op.getFPImm()->isZero())
    return true;

  return false;
}

bool KVXHardwareLoops::GetRoundValue(MachineOperand Op, unsigned &Val) {
  if (Op.isReg()) {
    MachineInstr *DefInstr = MRI->getVRegDef(Op.getReg());
    if (isMakeOperator(DefInstr->getOpcode()) ||
        isExtensionOperator(DefInstr->getOpcode())) {
      Op = DefInstr->getOperand(1);
    } else {
      return false;
    }
  }

  if (Op.isImm()) {
    Val = Op.getImm();
    return true;
  }

  if (Op.getFPImm()->getType()->isFloatTy()) {
    Val = (int64_t)Op.getFPImm()->getValueAPF().convertToFloat();
    return true;
  }

  if (Op.getFPImm()->getType()->isDoubleTy()) {
    Val = (int64_t)Op.getFPImm()->getValueAPF().convertToDouble();
    return true;
  }

  return false;
}

static double GetFPValue(MachineOperand &Op) {
  if (Op.getFPImm()->getType()->isFloatTy()) {
    return Op.getFPImm()->getValueAPF().convertToFloat();
  }

  if (Op.getFPImm()->getType()->isDoubleTy()) {
    return Op.getFPImm()->getValueAPF().convertToDouble();
  }

  llvm_unreachable("FP Data type not recognizeable");
}

/**
 * Returns true if the Bump value is manageable when
 * the start or end value of the iteration loop is/are
 * registers.
 **/
static bool IsBumpAllowed(MachineOperand &Op) {
  if (Op.isImm() && std::abs(Op.getImm()) != 1)
    return false;

  if (Op.isFPImm() && Op.getFPImm()->isNaN())
    return false;

  if (Op.isFPImm() && !Op.getFPImm()->getValueAPF().isExactlyValue(1.0))
    return false;

  return true;
}

bool KVXHardwareLoops::IsEligibleForHardwareLoop(MachineLoop *L) {

  // Eligibility check: A loop can be optimized if:
  // - The preheader and the header are not empty
  // - There is no function call under the loop
  // - There is no indirect branching (multiple exit points loop) in the loop
  if (!PreheaderMBB)
    LLVM_DEBUG(llvm::dbgs()
               << "HW Loop - The loop does not have a PreheaderMBB\n");
  if (!HeaderMBB)
    LLVM_DEBUG(llvm::dbgs()
               << "HW Loop - The loop does not have a HeaderMBB\n");
  if (!ExitMBB)
    LLVM_DEBUG(llvm::dbgs() << "HW Loop - The loop does not have a ExitMBB\n");

  if (!HeaderMBB || !PreheaderMBB || !ExitMBB) {
    LLVM_DEBUG(llvm::dbgs() << "HW Loop - The loop does not have a "
                               "header/preheader/exit basic block.\n");
    return false;
  }

  if (ExitMBB->empty()) {
    LLVM_DEBUG(llvm::dbgs() << "HW Loop - The exit basic block is empty\n");
    return false;
  }

  if (PreheaderMBB->instr_begin() == PreheaderMBB->instr_end()) {
    LLVM_DEBUG(llvm::dbgs() << "HW Loop - The loop preheader is empty.\n");
    return false;
  }

  if (HeaderMBB->instr_begin() == HeaderMBB->instr_end()) {
    LLVM_DEBUG(llvm::dbgs() << "HW Loop - The loop header is empty.\n");
    return false;
  }

  for (instr_iterator I = HeaderMBB->instr_begin(), E = HeaderMBB->instr_end();
       I != E; ++I) {

    // Hardware loops should not contain internal calls
    if (I->getOpcode() == KVX::CALL) {
      LLVM_DEBUG(
          llvm::dbgs() << "HW Loop - The loop contains internal calls.\n");
      return false;
    }

    // The HW loop should not contain branches (other than the single loop
    // stopping condition)
    if (I->isIndirectBranch()) {
      LLVM_DEBUG(
          llvm::dbgs() << "HW Loop - The loop contains an indirect branch.\n");
      return false;
    }
  }

  return true;
}

/**
 * The BackTraceRegValue traces the register @regToSearchFor starting from the
 * @headerIt machine instruction. If the register is found to be initialized
 * (using MAKE), the value is assigned to CmpVal. During this search, also the
 * @Bump value is searched for by checking what operations are applied on the
 * traced register.
 * @return Returns true if the value was traced, false otherwise.
 */
bool KVXHardwareLoops::BackTraceRegValue(MachineLoop *L,
                                         unsigned regToSearchFor,
                                         MachineOperand &IVar,
                                         MachineOperand &IVBump,
                                         bool &IsModified) {

  MachineInstr *AddInstr = MRI->getVRegDef(regToSearchFor);

  if (!AddInstr) {
    LLVM_DEBUG(
        llvm::dbgs()
        << "HW Loop - The traced register definition could not be found.\n");
    return false;
  }

  if (!AddInstr->getDesc().isAdd()) {
    LLVM_DEBUG(llvm::dbgs()
               << "HW Loop - The traced register is not an addition.\n");
    return false;
  }

  // The traced register is modified
  IsModified = true;

  if (AddInstr->getOperand(2).isReg()) {
    MachineInstr *DefInstr = MRI->getVRegDef(AddInstr->getOperand(2).getReg());
    if (isMakeOperator(DefInstr->getOpcode())) {
      IVBump = DefInstr->getOperand(1);
    } else {
      LLVM_DEBUG(llvm::dbgs() << "HW Loop - The traced register is incremented "
                                 "by a register, not by an IMM I.\n");
      return false;
    }
  } else if (AddInstr->getOperand(2).isImm() ||
             AddInstr->getOperand(2).isFPImm()) {
    IVBump = AddInstr->getOperand(2);
  } else {
    LLVM_DEBUG(llvm::dbgs() << "HW Loop - The traced register is incremented "
                               "by a register, not by an IMM II.\n");
    return false;
  }

  if (!AddInstr->getOperand(1).isReg()) {
    LLVM_DEBUG(llvm::dbgs() << "HW Loop - The ADD operand is not a register\n");
    return false;
  }
  MachineInstr *PhiInstr = MRI->getVRegDef(AddInstr->getOperand(1).getReg());

  if (!PhiInstr) {
    LLVM_DEBUG(
        llvm::dbgs()
        << "HW Loop - The traced register definition could not be found.\n");
    return false;
  }

  if (!PhiInstr->isPHI()) {
    LLVM_DEBUG(llvm::dbgs() << "HW Loop - The traced register is modified with "
                               "an additional operation.\n");
    return false;
  }

  assert(PhiInstr->getOperand(1).isReg() &&
         "The PHI operand is not a register.");

  MachineInstr *DefReg = MRI->getVRegDef(PhiInstr->getOperand(1).getReg());

  if (!DefReg) {
    LLVM_DEBUG(
        llvm::dbgs()
        << "HW Loop - The traced register definition could not be found.\n");
    return false;
  }

  if (DefReg->getParent() == HeaderMBB) {
    LLVM_DEBUG(
        llvm::dbgs()
        << "HW Loop - The traced register is initialized in the header\n");
    return false;
  }

  if (isMakeOperator(DefReg->getOpcode()) ||
      isExtensionOperator(DefReg->getOpcode())) {

    IVar = DefReg->getOperand(1);
    return true;
  }

  IVar = PhiInstr->getOperand(1);
  return true;
}

bool KVXHardwareLoops::ParseLoop(MachineLoop *L, MachineOperand &EndVal,
                                 unsigned &Cond, MachineOperand &StartVal,
                                 MachineOperand &Bump) {

  bool CBToHeader = false;

  for (instr_iterator I = HeaderMBB->instr_begin(), E = HeaderMBB->instr_end();
       I != E; ++I) {
    if (I->getOpcode() != KVX::CB)
      continue;
    if (I->getOperand(1).getMBB() != HeaderMBB &&
        I->getOperand(1).getMBB() != ExitMBB)
      continue;
    if (I->getOperand(1).getMBB() == HeaderMBB)
      CBToHeader = true;

    assert(I->getOperand(0).isReg() &&
           "The COMPD/FCOMPD previous insruction first\
      operand is not a register.");

    MachineInstr *PrevInstr = MRI->getVRegDef(I->getOperand(0).getReg());

    if (isCompOperator(PrevInstr->getOpcode())) {
      Cond = PrevInstr->getOperand(3).getImm();

      bool Op1RegIsModified = false;
      MachineOperand IVar = MachineOperand::CreateImm(0);
      MachineOperand BumpOp1 = MachineOperand::CreateImm(0);
      MachineOperand BumpOp2 = MachineOperand::CreateImm(0);

      assert(PrevInstr->getOperand(1).isReg() && "COMPD previous instruction \
        second operand is not a register.");

      bool BTResultOp1 = BackTraceRegValue(L, PrevInstr->getOperand(1).getReg(),
                                           IVar, BumpOp1, Op1RegIsModified);
      bool Op2RegIsModified = false;
      bool BTResultOp2 = false;
      if (PrevInstr->getOperand(2).isReg()) {
        BTResultOp2 = BackTraceRegValue(L, PrevInstr->getOperand(2).getReg(),
                                        IVar, BumpOp2, Op2RegIsModified);
      }

      if (BTResultOp1 && !Op2RegIsModified) {
        StartVal = IVar;
        EndVal = PrevInstr->getOperand(2);
        Bump = BumpOp1;
      } else if (BTResultOp2 && !Op1RegIsModified) {
        StartVal = IVar;
        EndVal = PrevInstr->getOperand(1);
        Bump = BumpOp2;
      } else {
        LLVM_DEBUG(llvm::dbgs()
                   << "HW Loop - Could not find the induction variable\n");
        return false;
      }
      if (EndVal.isReg() &&
          MRI->getVRegDef(EndVal.getReg())->getParent() == HeaderMBB) {
        LLVM_DEBUG(
            llvm::dbgs()
            << "HW Loop - Target comaprison value could not be traced. \n");
        return false;
      }

      if (IsZero(Bump)) {
        LLVM_DEBUG(llvm::dbgs() << "HW Loop - The bump value is 0\n");
        return false;
      }

      return true;
    } else {
      if (I->getOperand(2).getImm() > KVXMOD::COMPARISON_GTU) {
        LLVM_DEBUG(llvm::dbgs()
                   << "HW Loop - Condition number is not valid.\n");
        return false;
      }
      Cond = GetOppositeCondition(I->getOperand(2).getImm());
      MachineOperand IVar = MachineOperand::CreateImm(0);
      bool RegIsModified;
      assert(I->getOperand(0).isReg() &&
             "The CB first operand is not a register.");
      bool BTResult = BackTraceRegValue(L, I->getOperand(0).getReg(), IVar,
                                        Bump, RegIsModified);
      if (BTResult) {
        StartVal = IVar;
        EndVal = MachineOperand::CreateImm(0);
      } else {
        LLVM_DEBUG(llvm::dbgs()
                   << "HW Loop - Could not find the induction variable\n");
      }

      if (IsZero(Bump)) {
        LLVM_DEBUG(llvm::dbgs() << "HW Loop - The bump value is 0\n");
        return false;
      }

      return true;
    }

    break;
  }

  LLVM_DEBUG(llvm::dbgs() << "HW Loop - No CB or COMP instruction found.\n");
  return false;
}

int64_t KVXHardwareLoops::ComputeStepsInteger(unsigned Cond,
                                              MachineOperand &StartVal,
                                              MachineOperand &EndVal,
                                              MachineOperand &Bump) {
  unsigned Steps = 0;

  int64_t BumpIntValue = Bump.getImm();

  switch (Cond) {
  case KVXMOD::COMPARISON_EQ:
  case KVXMOD::COMPARISON_NE:
  case KVXMOD::COMPARISON_GE:
  case KVXMOD::COMPARISON_LE:
  case KVXMOD::COMPARISON_GEU:
  case KVXMOD::COMPARISON_LEU: {
    if (StartVal.getImm() == EndVal.getImm())
      return false;
    Steps = ((EndVal.getImm() - StartVal.getImm()) / BumpIntValue);
    break;
  }
  case KVXMOD::COMPARISON_LT:
  case KVXMOD::COMPARISON_GT:
  case KVXMOD::COMPARISON_LTU:
  case KVXMOD::COMPARISON_GTU: {
    Steps = ((EndVal.getImm() - StartVal.getImm() + BumpIntValue +
              (BumpIntValue < 0) - (BumpIntValue > 0)) /
             BumpIntValue);
    break;
  }
  default:
    return false;
  }
  return Steps;
}

int64_t KVXHardwareLoops::ComputeStepsFP(unsigned Cond,
                                         MachineOperand &StartVal,
                                         MachineOperand &EndVal,
                                         MachineOperand &Bump) {
  unsigned Steps = 0;
  double BumpValue = GetFPValue(Bump);
  double StartFPVal = GetFPValue(StartVal);
  double EndFPVal = GetFPValue(EndVal);

  switch (Cond) {
  case KVXMOD::FLOATCOMP::FLOATCOMP_ONE:
  case KVXMOD::FLOATCOMP::FLOATCOMP_UEQ:
  case KVXMOD::FLOATCOMP::FLOATCOMP_OEQ:
  case KVXMOD::FLOATCOMP::FLOATCOMP_UNE:
  case KVXMOD::FLOATCOMP::FLOATCOMP_OLT:
    Steps = (int)((EndFPVal - StartFPVal + BumpValue + (BumpValue < 0) -
                   (BumpValue > 0)) /
                  BumpValue);
    break;
  case KVXMOD::FLOATCOMP::FLOATCOMP_UGE:
  case KVXMOD::FLOATCOMP::FLOATCOMP_OGE:
  case KVXMOD::FLOATCOMP::FLOATCOMP_ULT:
    Steps = (int)((EndVal.getImm() - StartVal.getImm()) / BumpValue);
    break;
  default:
    llvm_unreachable("Unrecognized comparison mode");
  }

  return Steps;
}

bool KVXHardwareLoops::GetLOOPDOArgs(MachineLoop *L, MachineOperand &StartVal,
                                     MachineOperand &EndVal,
                                     MachineOperand &Bump) {

  StartVal = MachineOperand::CreateImm(0);
  EndVal = MachineOperand::CreateImm(0);
  unsigned Cond = KVXMOD::COMPARISON_NONE;

  bool CanRetrieveEndingCond = ParseLoop(L, EndVal, Cond, StartVal, Bump);

  if (!CanRetrieveEndingCond) {
    LLVM_DEBUG(llvm::dbgs() << "HW Loop - Could not retrieve the end "
                               "value/start value/bump/condition type.\n");
    return false;
  }

  if (EndVal.isReg()) {
    if (!IsBumpAllowed(Bump)) {
      LLVM_DEBUG(llvm::dbgs()
                 << "HW Loop - The bump must be incremented or "
                    "decremented by one for the EndValue-reg case.\n");
      return false;
    }

    return true;
  }
  if (StartVal.isReg()) {
    if (!IsBumpAllowed(Bump)) {
      LLVM_DEBUG(llvm::dbgs()
                 << "HW Loop - The bump must be incremented or "
                    "decremented by one for the StartValue-reg case.\n");
      return false;
    }
    return true;
  }

  if (Bump.isImm()) {
    EndVal = MachineOperand::CreateImm(
        ComputeStepsInteger(Cond, StartVal, EndVal, Bump));
  } else if (Bump.isFPImm()) {
    if (Bump.getFPImm()->getType()->isFloatTy() ||
        Bump.getFPImm()->getType()->isDoubleTy()) {
      EndVal = MachineOperand::CreateImm(
          ComputeStepsFP(Cond, StartVal, EndVal, Bump));
    } else {
      LLVM_DEBUG(llvm::dbgs() << "HW Loop - Unrecognized float type\n");
      return false;
    }
  } else {
    LLVM_DEBUG(llvm::dbgs()
               << "HW Loop - The bump is neither a float or integer type\n");
    return false;
  }

  return true;
}

bool KVXHardwareLoops::RemoveBranchingInstr(MachineLoop *L) {
  instr_iterator PreheaderGoto = PreheaderMBB->instr_end();

  for (instr_iterator I = PreheaderMBB->instr_begin(),
                      E = PreheaderMBB->instr_end();
       I != E; ++I) {
    if (I->getOpcode() == KVX::GOTO) {
      PreheaderGoto = I;
      break;
    }
  }

  instr_iterator HeaderGoto = HeaderMBB->instr_end();
  MachineInstr *HeaderComp = NULL;
  instr_iterator HeaderCB = HeaderMBB->instr_end();

  unsigned HeaderInstrCount = 0;

  for (instr_iterator I = HeaderMBB->instr_begin(); I != HeaderMBB->instr_end();
       ++I) {

    if (I->getOpcode() == KVX::CB && (I->getOperand(1).getMBB() == HeaderMBB ||
                                      I->getOperand(1).getMBB() == ExitMBB)) {
      HeaderCB = I;
      assert(I->getOperand(0).isReg() &&
             "The CB first operand is not a register.");
      MachineInstr *CompInstr = MRI->getVRegDef(I->getOperand(0).getReg());
      if (isCompOperator(CompInstr->getOpcode()))
        HeaderComp = CompInstr;
    }

    if (I->getOpcode() == KVX::GOTO) {
      if (I->getOperand(0).getMBB() == ExitMBB ||
          I->getOperand(0).getMBB() == HeaderMBB)
        HeaderGoto = I;
      else {
        LLVM_DEBUG(llvm::dbgs() << "HW Loop - unsupported goto case\n");
        return false;
      }
    }
    HeaderInstrCount++;
  }

  // The goto instruction in the preheader will be replaced with loopdo
  if (PreheaderGoto != PreheaderMBB->instr_end())
    PreheaderGoto->eraseFromParent();

  // The comparison is removed as is not necessary anymore
  if (HeaderComp)
    HeaderComp->eraseFromParent();
  if (HeaderCB != HeaderMBB->instr_end())
    HeaderCB->eraseFromParent();
  if (HeaderGoto != HeaderMBB->instr_end())
    HeaderGoto->eraseFromParent();

  return true;
}

bool KVXHardwareLoops::ConvertToHardwareLoop(MachineFunction &MF,
                                             MachineLoop *L, unsigned Level) {
  // This is just for sanity.
  assert(L->getHeader() && "Loop without a header?");
  bool Changed = false;

  PreheaderMBB = L->getLoopPreheader();
  HeaderMBB = L->getHeader();
  ExitMBB = L->getExitBlock();

  // Process nested loops first.
  for (MachineLoop::iterator I = L->begin(), E = L->end(); I != E; ++I) {
    Changed |= ConvertToHardwareLoop(MF, *I, Level + 1);
  }

  // If a nested loop has been converted, then we can't convert this loop.
  if (Changed)
    return Changed;

  MachineBasicBlock *LastMBB = L->findLoopControlBlock();
  // Don't generate hw loop if the loop has more than one exit.
  if (!LastMBB) {
    return false;
  }

  MachineBasicBlock::iterator LastI = LastMBB->getFirstTerminator();
  if (LastI == LastMBB->end())
    return false;

  if (!IsEligibleForHardwareLoop(L))
    return false;

  // Are we able to determine the trip count for the loop?
  MachineOperand StartVal = MachineOperand::CreateImm(0);
  MachineOperand EndVal = MachineOperand::CreateImm(0);
  MachineOperand Bump = MachineOperand::CreateImm(0);
  bool CanRetrieveTripCount = GetLOOPDOArgs(L, StartVal, EndVal, Bump);

  if (!CanRetrieveTripCount) {
    LLVM_DEBUG(
        llvm::dbgs() << "HW Loop - Could not retrieve the loop count.\n");
    return false;
  }

  const bool StartValIsImm = StartVal.isImm() || StartVal.isFPImm();
  const bool EndValIsImm = EndVal.isImm() || StartVal.isFPImm();
  const bool StartValIsZero = IsZero(StartVal);
  const bool EndValIsZero = IsZero(EndVal);

  if (StartValIsImm && EndValIsImm) {
    if (Level > 0)
      return false;
  }

  if (!RemoveBranchingInstr(L))
    return false;

  SmallVector<MachineInstr *, 2> OldInsts;
  MachineBasicBlock::iterator It = HeaderMBB->instr_begin();
  while (It != HeaderMBB->instr_end()) {
    OldInsts.push_back(&*It);
    It = std::next(It);
  }

  for (unsigned i = 0; i < OldInsts.size(); ++i)
    removeIfDead(OldInsts[i]);

  DebugLoc DL;

  MachineBasicBlock *DoneMBB = ExitMBB;
  if (std::next(HeaderMBB)->getParent() &&
      !HeaderMBB->isLayoutSuccessor(ExitMBB)) {
    LLVM_DEBUG(llvm::dbgs()
               << "HW Loop - Exit block is not succeeding header.\n");

    DoneMBB = MF.CreateMachineBasicBlock(NULL);
    BuildMI(*DoneMBB, DoneMBB->instr_end(), DL, TII->get(KVX::GOTO))
        .addMBB(ExitMBB);
    MF.insert(++HeaderMBB->getIterator(), DoneMBB);

    DoneMBB->transferSuccessorsAndUpdatePHIs(HeaderMBB);
    HeaderMBB->addSuccessor(DoneMBB);
  }

  MachineBasicBlock *LoopdoMBB = PreheaderMBB;

  MachineBasicBlock::iterator InsertPos = LoopdoMBB->instr_end();

  MachineOperand CountTrip = MachineOperand::CreateImm(0);
  unsigned CountReg;

  if (Bump.isFPImm()) {
    if (StartValIsImm && EndValIsImm) {
      LLVM_DEBUG(llvm::dbgs() << "HW Loop - FLOAT StartVal-EndVal IMM-IMM.\n");
      CountReg = MRI->createVirtualRegister(&KVX::SingleRegRegClass);
      unsigned CountTripVal = 0;
      bool R = GetRoundValue(EndVal, CountTripVal);
      if (!R)
        llvm_unreachable("Could not handle the data yype");

      BuildMI(*LoopdoMBB, InsertPos, DL,
              TII->get(GetImmMakeOpCode(CountTripVal)), CountReg)
          .addImm(CountTripVal);
      CountTrip = MachineOperand::CreateReg(CountReg, false);
    }
  }

  if (Bump.isImm()) {
    int64_t BumpVal = Bump.getImm();
    if (StartValIsImm && EndValIsImm) {
      LLVM_DEBUG(llvm::dbgs() << "HW Loop - StartVal-EndVal IMM-IMM.\n");
      CountReg = MRI->createVirtualRegister(&KVX::SingleRegRegClass);
      BuildMI(*LoopdoMBB, InsertPos, DL,
              TII->get(GetImmMakeOpCode(EndVal.getImm())), CountReg)
          .add(EndVal);
      CountTrip = MachineOperand::CreateReg(CountReg, false);
    }

    if (StartValIsImm && !EndValIsImm && StartValIsZero) {
      LLVM_DEBUG(llvm::dbgs() << "HW Loop - StartVal-EndVal IMM-REG.\n");
      LLVM_DEBUG(llvm::dbgs() << "HW Loop - StartVal is zero.\n");

      if (BumpVal < 0) {
        LLVM_DEBUG(llvm::dbgs() << "HW Loop - Bump > 0.\n");
        CountReg = MRI->createVirtualRegister(&KVX::SingleRegRegClass);
        BuildMI(*LoopdoMBB, InsertPos, DL, TII->get(KVX::NEGD), CountReg)
            .add(EndVal);
        CountTrip = MachineOperand::CreateReg(CountReg, false);
      } else {
        LLVM_DEBUG(llvm::dbgs() << "HW Loop - Bump < 0.\n");
        CountTrip = EndVal;
      }
    }

    if (StartValIsImm && !EndValIsImm && !StartValIsZero) {
      LLVM_DEBUG(llvm::dbgs() << "HW Loop - StartVal-EndVal IMM-REG.\n");
      LLVM_DEBUG(llvm::dbgs() << "HW Loop - StartVal is not zero.\n");

      CountReg = MRI->createVirtualRegister(&KVX::SingleRegRegClass);
      if (BumpVal < 0) {
        LLVM_DEBUG(llvm::dbgs() << "HW Loop - Bump < 0.\n");
        BuildMI(*LoopdoMBB, InsertPos, DL,
                TII->get(GetImmOpCode(StartVal.getImm(), KVX::SBFDri10,
                                      KVX::SBFDri37, KVX::SBFDri64)),
                CountReg)
            .add(EndVal)
            .add(StartVal);
      } else {
        LLVM_DEBUG(llvm::dbgs() << "HW Loop - Bump > 0.\n");
        unsigned StartValReg =
            MRI->createVirtualRegister(&KVX::SingleRegRegClass);
        BuildMI(*LoopdoMBB, InsertPos, DL,
                TII->get(GetImmMakeOpCode(StartVal.getImm())), StartValReg)
            .add(StartVal);

        BuildMI(*LoopdoMBB, InsertPos, DL, TII->get(KVX::SBFDrr), CountReg)
            .addReg(StartValReg)
            .add(EndVal);
      }
      CountTrip = MachineOperand::CreateReg(CountReg, false);
    }

    if (!StartValIsImm && EndValIsImm && EndValIsZero) {
      LLVM_DEBUG(llvm::dbgs() << "HW Loop - StartVal-EndVal REG-IMM.\n");
      LLVM_DEBUG(llvm::dbgs() << "HW Loop - EndVal is zero.\n");
      if (BumpVal < 0) {
        LLVM_DEBUG(llvm::dbgs() << "HW Loop - Bump < 0.\n");
        CountTrip = StartVal;
      } else {
        LLVM_DEBUG(llvm::dbgs() << "HW Loop - Bump > 0.\n");
        CountReg = MRI->createVirtualRegister(&KVX::SingleRegRegClass);
        BuildMI(*LoopdoMBB, InsertPos, DL, TII->get(KVX::NEGD), CountReg)
            .add(StartVal);
        CountTrip = MachineOperand::CreateReg(CountReg, false);
      }
    }

    if (!StartValIsImm && EndValIsImm && !EndValIsZero) {
      LLVM_DEBUG(llvm::dbgs() << "HW Loop - StartVal-EndVal REG-IMM.\n");
      LLVM_DEBUG(llvm::dbgs() << "HW Loop - EndVal is NOT zero.\n");

      CountReg = MRI->createVirtualRegister(&KVX::SingleRegRegClass);
      if (BumpVal < 0) {
        unsigned EndValReg =
            MRI->createVirtualRegister(&KVX::SingleRegRegClass);
        BuildMI(*LoopdoMBB, InsertPos, DL,
                TII->get(GetImmMakeOpCode(EndVal.getImm())), EndValReg)
            .add(EndVal);
        LLVM_DEBUG(llvm::dbgs() << "HW Loop - Bump < 0.\n");
        BuildMI(*LoopdoMBB, InsertPos, DL, TII->get(KVX::SBFDrr), CountReg)
            .addReg(EndValReg)
            .add(StartVal);
      } else {
        LLVM_DEBUG(llvm::dbgs() << "HW Loop - Bump > 0.\n");
        BuildMI(*LoopdoMBB, InsertPos, DL,
                TII->get(GetImmOpCode(EndVal.getImm(), KVX::SBFDri10,
                                      KVX::SBFDri37, KVX::SBFDri64)),
                CountReg)
            .add(StartVal)
            .add(EndVal);
      }
      CountTrip = MachineOperand::CreateReg(CountReg, false);
    }

    if (!StartValIsImm && !EndValIsImm) {
      LLVM_DEBUG(llvm::dbgs() << "HW Loop - StartVal-EndVal REG-REG.\n");
      CountReg = MRI->createVirtualRegister(&KVX::SingleRegRegClass);
      if (BumpVal < 0) {
        LLVM_DEBUG(llvm::dbgs() << "HW Loop - Bump < 0.\n");
        BuildMI(*LoopdoMBB, InsertPos, DL, TII->get(KVX::SBFDrr), CountReg)
            .add(EndVal)
            .add(StartVal);
      } else {
        LLVM_DEBUG(llvm::dbgs() << "HW Loop - Bump > 0.\n");
        BuildMI(*LoopdoMBB, InsertPos, DL, TII->get(KVX::SBFDrr), CountReg)
            .add(StartVal)
            .add(EndVal);
      }
      CountTrip = MachineOperand::CreateReg(CountReg, false);
    }
  }
  if (!StartValIsImm || !EndValIsImm)
    BuildMI(*LoopdoMBB, InsertPos, DL, TII->get(KVX::CB))
        .add(CountTrip)
        .addMBB(HeaderMBB)
        .addImm(KVXMOD::COMPARISON_LE);

  BuildMI(*LoopdoMBB, InsertPos, DL, TII->get(KVX::LOOPDO))
      .add(CountTrip)
      .addMBB(DoneMBB);

  BuildMI(*HeaderMBB, HeaderMBB->instr_end(), DL, TII->get(KVX::ENDLOOP))
      .addMBB(ExitMBB);

  // Marker for not optimizing during BranchFolderPass
  ExitMBB->setHasAddressTaken();

  return true;
}

bool KVXHardwareLoops::runOnMachineFunction(MachineFunction &MF) {
  bool Changed = false;

  MLI = &getAnalysis<MachineLoopInfo>();
  MRI = std::addressof(MF.getRegInfo());
  const KVXSubtarget &HST = MF.getSubtarget<KVXSubtarget>();
  TII = HST.getInstrInfo();

  for (auto &L : *MLI) {
    if (!L->getParentLoop()) {
      LLVM_DEBUG(
          llvm::dbgs() << "HW Loop - For function " << MF.getName()
                       << ", loop detected at "
                       << printMBBReference(**L->block_begin())
                       << ", attempt to replace it with a hardware loop.\n");

      if (ConvertToHardwareLoop(MF, L, 0)) {
        LLVM_DEBUG(
            llvm::dbgs() << "HW Loop - Hardware Loop successfully inserted.\n");
        Changed = true;
      } else {
        LLVM_DEBUG(
            llvm::dbgs() << "HW Loop - Hardware Loop was NOT inserted.\n");
      }
    }
  }

  if (!Changed) {
    LLVM_DEBUG(llvm::dbgs() << "HW Loop - For function " << MF.getName()
                            << ", no loop inserted.\n");
  }

  return Changed;
}

FunctionPass *llvm::createKVXHardwareLoopsPass() {
  return new KVXHardwareLoops();
}

/// Returns true if the instruction is dead. This function was copied and
/// adapted from the Hexagon backend. It will only remove add instructions.
bool KVXHardwareLoops::isDead(const MachineInstr *MI,
                              SmallVectorImpl<MachineInstr *> &DeadPhis) const {
  if (!MI->getDesc().isAdd())
    return false;

  // Examine each operand.
  for (unsigned i = 0, e = MI->getNumOperands(); i != e; ++i) {
    const MachineOperand &MO = MI->getOperand(i);
    if (!MO.isReg() || !MO.isDef())
      continue;

    Register Reg = MO.getReg();
    if (MRI->use_nodbg_empty(Reg))
      continue;

    using use_nodbg_iterator = MachineRegisterInfo::use_nodbg_iterator;

    // This instruction has users, but if the only user is the phi node for the
    // parent block, and the only use of that phi node is this instruction, then
    // this instruction is dead: both it (and the phi node) can be removed.
    use_nodbg_iterator I = MRI->use_nodbg_begin(Reg);
    use_nodbg_iterator End = MRI->use_nodbg_end();
    if (std::next(I) != End || !I->getParent()->isPHI())
      return false;

    MachineInstr *OnePhi = I->getParent();
    for (unsigned j = 0, f = OnePhi->getNumOperands(); j != f; ++j) {
      const MachineOperand &OPO = OnePhi->getOperand(j);
      if (!OPO.isReg() || !OPO.isDef())
        continue;

      Register OPReg = OPO.getReg();
      use_nodbg_iterator nextJ;
      for (use_nodbg_iterator J = MRI->use_nodbg_begin(OPReg); J != End;
           J = nextJ) {
        nextJ = std::next(J);
        MachineOperand &Use = *J;
        MachineInstr *UseMI = Use.getParent();

        // If the phi node has a user that is not MI, bail.
        if (MI != UseMI)
          return false;
      }
    }
    DeadPhis.push_back(OnePhi);
  }

  // If there are no defs with uses, the instruction is dead.
  return true;
}

void KVXHardwareLoops::removeIfDead(MachineInstr *MI) {
  // This procedure was essentially copied from DeadMachineInstructionElim.

  SmallVector<MachineInstr *, 1> DeadPhis;
  if (isDead(MI, DeadPhis)) {
    LLVM_DEBUG(dbgs() << "HW looping will remove: " << *MI);

    // It is possible that some DBG_VALUE instructions refer to this
    // instruction.  Examine each def operand for such references;
    // if found, mark the DBG_VALUE as undef (but don't delete it).
    for (unsigned i = 0, e = MI->getNumOperands(); i != e; ++i) {
      const MachineOperand &MO = MI->getOperand(i);
      if (!MO.isReg() || !MO.isDef())
        continue;
      Register Reg = MO.getReg();
      MachineRegisterInfo::use_iterator nextI;
      for (MachineRegisterInfo::use_iterator I = MRI->use_begin(Reg),
                                             E = MRI->use_end();
           I != E; I = nextI) {
        nextI = std::next(I); // I is invalidated by the setReg
        MachineOperand &Use = *I;
        MachineInstr *UseMI = I->getParent();
        if (UseMI == MI)
          continue;
        if (Use.isDebug())
          UseMI->getOperand(0).setReg(0U);
      }
    }

    MI->eraseFromParent();
    for (unsigned i = 0; i < DeadPhis.size(); ++i)
      DeadPhis[i]->eraseFromParent();
  }
}
