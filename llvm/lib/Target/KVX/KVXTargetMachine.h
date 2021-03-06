//==-- KVXTargetMachine.h - Define TargetMachine for KVX ---------*- C++ -*-==//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file declares the KVX specific subclass of TargetMachine.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_KVX_KVXTARGETMACHINE_H
#define LLVM_LIB_TARGET_KVX_KVXTARGETMACHINE_H

#include "KVXSubtarget.h"
#include "MCTargetDesc/KVXMCTargetDesc.h"
#include "llvm/CodeGen/SelectionDAGTargetInfo.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/Target/TargetMachine.h"

namespace llvm {

class KVXTargetMachine : public LLVMTargetMachine {
  std::unique_ptr<TargetLoweringObjectFile> TLOF;
  mutable StringMap<std::unique_ptr<KVXSubtarget> > SubtargetMap;

public:
  KVXTargetMachine(const Target &T, const Triple &TT, StringRef CPU,
                   StringRef FS, const TargetOptions &Options,
                   Optional<Reloc::Model> RM, Optional<CodeModel::Model> CM,
                   CodeGenOpt::Level OL, bool JIT);

  const KVXSubtarget *getSubtargetImpl(const Function &F) const override;

  TargetPassConfig *createPassConfig(PassManagerBase &PM) override;

  TargetTransformInfo getTargetTransformInfo(const Function &F) override;

  TargetLoweringObjectFile *getObjFileLowering() const override {
    return TLOF.get();
  }
};

} // end namespace llvm

#endif // LLVM_LIB_TARGET_KVX_KVXTARGETMACHINE_H
