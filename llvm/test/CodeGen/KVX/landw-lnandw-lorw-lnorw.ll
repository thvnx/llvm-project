; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -O2 | FileCheck %s
target triple = "kvx-kalray-cos"

define i1 @f1(i32 %a, i32 %b){
; CHECK-LABEL: f1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    landw $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %tobool = icmp ne i32 %a, 0
  %tobool1 = icmp ne i32 %b, 0
  %0 = and i1 %tobool, %tobool1
  ret i1 %0
}

define i1 @f2(i32 %a, i32 %b){
; CHECK-LABEL: f2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    lnandw $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %tobool = icmp eq i32 %a, 0
  %tobool1 = icmp eq i32 %b, 0
  %lnot = or i1 %tobool, %tobool1
  ret i1 %lnot
}

define i1 @f3(i32 %a, i32 %b){
; CHECK-LABEL: f3:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    lnorw $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = or i32 %b, %a
  %1 = icmp eq i32 %0, 0
  ret i1 %1
}

define i1 @f4(i32 %a, i32 %b){
; CHECK-LABEL: f4:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    lorw $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = or i32 %b, %a
  %1 = icmp ne i32 %0, 0
  ret i1 %1
}

define i1 @f5(i32 %a, i32 %b){
; CHECK-LABEL: f5:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    lnandw $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %tobool = icmp eq i32 %a, 0
  %tobool1 = icmp eq i32 %b, 0
  %0 = or i1 %tobool, %tobool1
  ret i1 %0
}

define i1 @f6(i32 %a, i32 %b){
; CHECK-LABEL: f6:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    lnorw $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = or i32 %b, %a
  %1 = icmp eq i32 %0, 0
  ret i1 %1
}

