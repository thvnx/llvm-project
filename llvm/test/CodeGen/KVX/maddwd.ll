; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -O2 | FileCheck %s
target triple = "kvx-kalray-cos"

define i64 @f_maddwdrr(i64 %a, i32 %b, i32 %c){
; CHECK-LABEL: f_maddwdrr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    maddwd $r0 = $r2, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %b64 = sext i32 %b to i64
  %c64 = sext i32 %c to i64
  %mul = mul nsw i64 %c64, %b64
  %add = add nsw i64 %mul, %a
  ret i64 %add
}

define i64 @f_maddwdri_1(i64 %a, i32 %b){
; CHECK-LABEL: f_maddwdri_1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    maddwd $r0 = $r1, 11
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %b64 = sext i32 %b to i64
  %mul = mul nsw i64 %b64, 11
  %add = add nsw i64 %mul, %a
  ret i64 %add
}
