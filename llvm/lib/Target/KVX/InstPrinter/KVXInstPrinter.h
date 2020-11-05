//===-- KVXInstPrinter.h - Convert KVX MCInst to assembly syntax ----------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This class prints a KVX MCInst to a .s file.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_KVX_INSTPRINTER_KVXINSTPRINTER_H
#define LLVM_LIB_TARGET_KVX_INSTPRINTER_KVXINSTPRINTER_H

#include "MCTargetDesc/KVXMCTargetDesc.h"
#include "llvm/MC/MCInstPrinter.h"

namespace llvm {
class MCOperand;

class KVXInstPrinter : public MCInstPrinter {
public:
  KVXInstPrinter(const MCAsmInfo &MAI, const MCInstrInfo &MII,
                 const MCRegisterInfo &MRI)
      : MCInstPrinter(MAI, MII, MRI) {}

  void printInst(const MCInst *MI, uint64_t Address, StringRef Annot,
                 const MCSubtargetInfo &STI, raw_ostream &O) override;

  void printRegName(raw_ostream &O, unsigned RegNo) const override;

  void printOperand(const MCInst *MI,
                    unsigned OpNo, /*const MCSubtargetInfo &STI,*/
                    raw_ostream &O, const char *Modifier = nullptr);

  // Autogenerated by tblgen.
  void printInstruction(const MCInst *MI, uint64_t Address, raw_ostream &O);
  bool printAliasInstr(const MCInst *MI, raw_ostream &O);

  static const char *getRegisterName(unsigned RegNo);

  void printVariantMod(const MCInst *MI, unsigned OpNo,
                       /*const MCSubtargetInfo &STI,*/ raw_ostream &O);

  void printDoscaleMod(const MCInst *MI, unsigned OpNo,
                       /*const MCSubtargetInfo &STI,*/ raw_ostream &O);

  void printRoundintMod(const MCInst *MI, unsigned OpNo, raw_ostream &O);
  void printSaturateMod(const MCInst *MI, unsigned OpNo, raw_ostream &O);
  void printRectifyMod(const MCInst *MI, unsigned OpNo, raw_ostream &O);

  void printScalarcondMod(const MCInst *MI, unsigned OpNo,
                          /*const MCSubtargetInfo &STI,*/ raw_ostream &O);

  void printSimplecondMod(const MCInst *MI, unsigned OpNo,
                          /*const MCSubtargetInfo &STI,*/ raw_ostream &O);

  void printMemOperand(const MCInst *MI, unsigned OpNo,
                       /*const MCSubtargetInfo &STI,*/ raw_ostream &O);

  void printComparisonMod(const MCInst *MI, unsigned OpNo,
                          /*const MCSubtargetInfo &STI,*/ raw_ostream &O);

  void printRoundingMod(const MCInst *MI, unsigned OpNo, raw_ostream &O);
  void printSilentMod(const MCInst *MI, unsigned OpNo, raw_ostream &O);
  void printSpeculateMod(const MCInst *MI, unsigned OpNo, raw_ostream &O);
  void printColumnMod(const MCInst *MI, unsigned OpNo, raw_ostream &O);
  void printFloatcompMod(const MCInst *MI, unsigned OpNo, raw_ostream &O);

  void printBinary16ImmOperand(const MCInst *MI, unsigned OpNo, raw_ostream &O);
  void printBinary32ImmOperand(const MCInst *MI, unsigned OpNo, raw_ostream &O);
  void printBinary64ImmOperand(const MCInst *MI, unsigned OpNo, raw_ostream &O);
  void printFPImmOperand(const MCInst *MI, unsigned OpNo, unsigned Size,
                         raw_ostream &O);

  void printSplat32Mod(const MCInst *MI, unsigned OpNo, raw_ostream &O);
};
} // namespace llvm

#endif
