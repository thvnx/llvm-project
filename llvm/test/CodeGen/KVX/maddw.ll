; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -O2 | FileCheck %s
target triple = "kvx-kalray-cos"

define i32 @f_maddwrr(i32 %a, i32 %b, i32 %c){
; CHECK-LABEL: f_maddwrr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    maddw $r0 = $r2, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = mul nsw i32 %c, %b
  %add = add nsw i32 %mul, %a
  ret i32 %add
}

define i32 @f_maddwri(i32 %a, i32 %b){
; CHECK-LABEL: f_maddwri:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    maddw $r0 = $r1, 11
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = mul nsw i32 %b, 11
  %add = add nsw i32 %mul, %a
  ret i32 %add
}

define i32 @f_maddw(i32 %a, i32 %b){
; CHECK-LABEL: f_maddw:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    addw $r2 = $r1, $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    maddw $r2 = $r1, $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r2
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = mul nsw i32 %b, %a
  %add = add nsw i32 %b, %a
  %add1 = add nsw i32 %add, %mul
  ret i32 %add1
}

define i64 @not_madduwrr(i64 %a, i32 %b, i32 %c) {
; CHECK-LABEL: not_madduwrr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    mulw $r1 = $r2, $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addd $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = mul i32 %c, %b
  %conv = zext i32 %mul to i64
  %add = add i64 %conv, %a
  ret i64 %add
}

define i64 @not_madduwri(i64 %a, i32 %b) {
; CHECK-LABEL: not_madduwri:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    mulw $r1 = $r1, 0x4d2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addd $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = mul i32 %b, 1234
  %conv = zext i32 %mul to i64
  %add = add i64 %conv, %a
  ret i64 %add
}

define i64 @not_madduwdri2(i64 %a, i32* nocapture readonly %b) {
; CHECK-LABEL: not_madduwdri2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    lwz $r1 = 0[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    maddd $r0 = $r1, 0x200000002
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = load i32, i32* %b, align 4
  %conv = zext i32 %0 to i64
  %mul = mul i64 %conv, 8589934594
  %add = add i64 %mul, %a
  ret i64 %add
}

define i64 @madduwdrr(i64 %a, i32 %b, i32 %c) {
; CHECK-LABEL: madduwdrr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    madduwd $r0 = $r2, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %conv = zext i32 %b to i64
  %conv1 = zext i32 %c to i64
  %mul = mul nuw i64 %conv1, %conv
  %add = add i64 %mul, %a
  ret i64 %add
}

define i64 @madduwdri(i64 %a, i32 %b) {
; CHECK-LABEL: madduwdri:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    madduwd $r0 = $r1, 0x4d2
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %conv = zext i32 %b to i64
  %mul = mul nuw nsw i64 %conv, 1234
  %add = add i64 %mul, %a
  ret i64 %add
}
define i64 @madduwdri_load(i64 %a, i32* nocapture readonly %b)  {
; CHECK-LABEL: madduwdri_load:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    lwz $r1 = 0[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    madduwd $r0 = $r1, 0x4d2
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = load i32, i32* %b, align 4
  %conv = zext i32 %0 to i64
  %mul = mul nuw nsw i64 %conv, 1234
  %add = add i64 %mul, %a
  ret i64 %add
}
define i64 @madduwdrr_load(i64 %a, i32* nocapture readonly %b, i32 %c)  {
; CHECK-LABEL: madduwdrr_load:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    lwz $r1 = 0[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    madduwd $r0 = $r1, $r2
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = load i32, i32* %b, align 4
  %conv = zext i32 %0 to i64
  %conv1 = zext i32 %c to i64
  %mul = mul nuw i64 %conv, %conv1
  %add = add i64 %mul, %a
  ret i64 %add
}

define i64 @madduwdrr_load2(i64 %a, i32* nocapture readonly %b, i32* nocapture readonly %c) {
; CHECK-LABEL: madduwdrr_load2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    lwz $r1 = 0[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lwz $r2 = 0[$r2]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    madduwd $r0 = $r2, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = load i32, i32* %b, align 4
  %conv = zext i32 %0 to i64
  %1 = load i32, i32* %c, align 4
  %conv1 = zext i32 %1 to i64
  %mul = mul nuw i64 %conv1, %conv
  %add = add i64 %mul, %a
  ret i64 %add
}

define i64 @madduwdri2(i64 %a, i32* nocapture readonly %b) {
; CHECK-LABEL: madduwdri2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    lwz $r1 = 0[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    madduwd $r0 = $r1, 0x4d2
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = load i32, i32* %b, align 4
  %conv = zext i32 %0 to i64
  %mul = mul nuw nsw i64 %conv, 1234
  %add = add i64 %mul, %a
  ret i64 %add
}

define i64 @not_madduwdri3(i64 %a, i32* nocapture readonly %b) {
; CHECK-LABEL: not_madduwdri3:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    lwz $r1 = 0[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    slld $r1 = $r1, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addd $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = load i32, i32* %b, align 4
  %conv = zext i32 %0 to i64
  %mul = mul i64 %conv, 4294967296
  %add = add i64 %mul, %a
  ret i64 %add
}

define i64 @not_madduwdri_8(i64 %a, i32 %b) {
; CHECK-LABEL: not_madduwdri_8:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    zxwd $r1 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addx8d $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %conv = zext i32 %b to i64
  %mul = mul i64 %conv, 8
  %add = add i64 %mul, %a
  ret i64 %add
}

define i64 @madduwdri3(i64 %a, i32* nocapture readonly %b) {
; CHECK-LABEL: madduwdri3:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    lwz $r1 = 0[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    madduwd $r0 = $r1, -1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = load i32, i32* %b, align 4
  %conv = zext i32 %0 to i64
  %mul = mul i64 %conv, 4294967295
  %add = add i64 %mul, %a
  ret i64 %add
}

define i64 @madduwdi16(i64 %a, i16 %b, i16 %c)  {
; CHECK-LABEL: madduwdi16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    zxhd $r1 = $r1
; CHECK-NEXT:    zxhd $r2 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    madduwd $r0 = $r2, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %conv = zext i16 %b to i64
  %conv1 = zext i16 %c to i64
  %mul = mul nuw nsw i64 %conv1, %conv
  %add = add i64 %mul, %a
  ret i64 %add
}
define i64 @madduwdi16_1(i64 %a, i16 %b, i32 %c) {
; CHECK-LABEL: madduwdi16_1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    zxhd $r1 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    madduwd $r0 = $r2, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %conv = zext i16 %b to i64
  %conv1 = zext i32 %c to i64
  %mul = mul nuw nsw i64 %conv1, %conv
  %add = add i64 %mul, %a
  ret i64 %add
}
define i64 @madduwdi16_2(i64 %a, i32 %b, i16 %c) {
; CHECK-LABEL: madduwdi16_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    zxhd $r2 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    madduwd $r0 = $r2, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %conv = zext i32 %b to i64
  %conv1 = zext i16 %c to i64
  %mul = mul nuw nsw i64 %conv1, %conv
  %add = add i64 %mul, %a
  ret i64 %add
}

define i64 @not_maddwrr(i64 %a, i32 %b, i32 %c) {
; CHECK-LABEL: not_maddwrr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    mulw $r1 = $r2, $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sxwd $r1 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addd $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = mul i32 %c, %b
  %conv = sext i32 %mul to i64
  %add = add i64 %conv, %a
  ret i64 %add
}

define i64 @not_maddwri(i64 %a, i32 %b) {
; CHECK-LABEL: not_maddwri:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    mulw $r1 = $r1, 0x4d2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sxwd $r1 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addd $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = mul i32 %b, 1234
  %conv = sext i32 %mul to i64
  %add = add i64 %conv, %a
  ret i64 %add
}

define i64 @not_maddwdri2(i64 %a, i32* nocapture readonly %b) {
; CHECK-LABEL: not_maddwdri2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    lws $r1 = 0[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    maddd $r0 = $r1, 0x200000002
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = load i32, i32* %b, align 4
  %conv = sext i32 %0 to i64
  %mul = mul i64 %conv, 8589934594
  %add = add i64 %mul, %a
  ret i64 %add
}

define i64 @maddwdrr(i64 %a, i32 %b, i32 %c) {
; CHECK-LABEL: maddwdrr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    maddwd $r0 = $r2, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %conv = sext i32 %b to i64
  %conv1 = sext i32 %c to i64
  %mul = mul nuw i64 %conv1, %conv
  %add = add i64 %mul, %a
  ret i64 %add
}

define i64 @maddwdri(i64 %a, i32 %b) {
; CHECK-LABEL: maddwdri:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    maddwd $r0 = $r1, 0x4d2
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %conv = sext i32 %b to i64
  %mul = mul nuw nsw i64 %conv, 1234
  %add = add i64 %mul, %a
  ret i64 %add
}
define i64 @maddwdri_load(i64 %a, i32* nocapture readonly %b)  {
; CHECK-LABEL: maddwdri_load:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    lwz $r1 = 0[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    maddwd $r0 = $r1, 0x4d2
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = load i32, i32* %b, align 4
  %conv = sext i32 %0 to i64
  %mul = mul nuw nsw i64 %conv, 1234
  %add = add i64 %mul, %a
  ret i64 %add
}
define i64 @maddwdrr_load(i64 %a, i32* nocapture readonly %b, i32 %c)  {
; CHECK-LABEL: maddwdrr_load:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    lwz $r1 = 0[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    maddwd $r0 = $r1, $r2
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = load i32, i32* %b, align 4
  %conv = sext i32 %0 to i64
  %conv1 = sext i32 %c to i64
  %mul = mul nuw i64 %conv, %conv1
  %add = add i64 %mul, %a
  ret i64 %add
}

define i64 @maddwdrr_load2(i64 %a, i32* nocapture readonly %b, i32* nocapture readonly %c) {
; CHECK-LABEL: maddwdrr_load2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    lwz $r1 = 0[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lwz $r2 = 0[$r2]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    maddwd $r0 = $r2, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = load i32, i32* %b, align 4
  %conv = sext i32 %0 to i64
  %1 = load i32, i32* %c, align 4
  %conv1 = sext i32 %1 to i64
  %mul = mul nuw i64 %conv1, %conv
  %add = add i64 %mul, %a
  ret i64 %add
}

define i64 @maddwdri2(i64 %a, i32* nocapture readonly %b) {
; CHECK-LABEL: maddwdri2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    lwz $r1 = 0[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    maddwd $r0 = $r1, 0x4d2
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = load i32, i32* %b, align 4
  %conv = sext i32 %0 to i64
  %mul = mul nuw nsw i64 %conv, 1234
  %add = add i64 %mul, %a
  ret i64 %add
}
define i64 @maddwdri3(i64 %a, i32* nocapture readonly %b) {
; CHECK-LABEL: maddwdri3:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    lwz $r1 = 0[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    maddwd $r0 = $r1, -1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = load i32, i32* %b, align 4
  %conv = sext i32 %0 to i64
  %mul = mul i64 %conv, 4294967295
  %add = add i64 %mul, %a
  ret i64 %add
}

define i64 @maddwdi16(i64 %a, i16 %b, i16 %c)  {
; CHECK-LABEL: maddwdi16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sxhd $r1 = $r1
; CHECK-NEXT:    sxhd $r2 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    maddwd $r0 = $r2, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %conv = sext i16 %b to i64
  %conv1 = sext i16 %c to i64
  %mul = mul nuw nsw i64 %conv1, %conv
  %add = add i64 %mul, %a
  ret i64 %add
}
define i64 @maddwdi16_1(i64 %a, i16 %b, i32 %c) {
; CHECK-LABEL: maddwdi16_1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sxhd $r1 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    maddwd $r0 = $r2, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %conv = sext i16 %b to i64
  %conv1 = sext i32 %c to i64
  %mul = mul nuw nsw i64 %conv1, %conv
  %add = add i64 %mul, %a
  ret i64 %add
}
define i64 @maddwdi16_2(i64 %a, i32 %b, i16 %c) {
; CHECK-LABEL: maddwdi16_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    zxhd $r2 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    maddwd $r0 = $r2, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %conv = sext i32 %b to i64
  %conv1 = zext i16 %c to i64
  %mul = mul nuw nsw i64 %conv1, %conv
  %add = add i64 %mul, %a
  ret i64 %add
}
