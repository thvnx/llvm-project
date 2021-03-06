; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -O2 | FileCheck %s
target triple = "kvx-kalray-cos"

define i32 @f_andnwrr(i32 %a, i32 %b){
; CHECK-LABEL: f_andnwrr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    andnw $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %not_a = xor i32 %a, -1
  %and = and i32 %not_a, %b
  ret i32 %and
}

define i32 @f_andnwri(i32 %a){
; CHECK-LABEL: f_andnwri:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    andnw $r0 = $r0, 10
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %not_a = xor i32 %a, -1
  %and = and i32 %not_a, 10
  ret i32 %and
}
