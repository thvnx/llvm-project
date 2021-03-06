; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -O2 | FileCheck %s
target triple = "kvx-kalray-cos"

define i32 @f(i32 %a){
; CHECK-LABEL: f:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    copyw $r1 = $r0
; CHECK-NEXT:    make $r0 = 5
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cmoved.wlez $r1 ? $r0 = 7
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp = icmp sgt i32 %a, 0
  %cond = select i1 %cmp, i32 5, i32 7
  ret i32 %cond
}

define i32 @f_select_cc_i32(i32 %c, i32 %c2, i32 %a, i32 %b){
; CHECK-LABEL: f_select_cc_i32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    compw.gt $r0 = $r0, $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cmoved.wnez $r0 ? $r3 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r3
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp = icmp sgt i32 %c, %c2
  %cond = select i1 %cmp, i32 %a, i32 %b
  ret i32 %cond
}

define i32 @f_select_cc_i64(i64 %c, i64 %c2, i32 %a, i32 %b){
; CHECK-LABEL: f_select_cc_i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    compd.gt $r0 = $r0, $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cmoved.wnez $r0 ? $r3 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r3
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp = icmp sgt i64 %c, %c2
  %cond = select i1 %cmp, i32 %a, i32 %b
  ret i32 %cond
}

define <4 x half> @f_Select32PAT(<4 x half> %x, <4 x half> %y){
; CHECK-LABEL: f_Select32PAT:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    extfz $r2 = $r0, 15, 0
; CHECK-NEXT:    extfz $r3 = $r1, 15, 0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    extfz $r4 = $r0, 31, 16
; CHECK-NEXT:    extfz $r5 = $r1, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    extfz $r6 = $r0, 47, 32
; CHECK-NEXT:    extfz $r7 = $r1, 47, 32
; CHECK-NEXT:    srld $r0 = $r0, 48
; CHECK-NEXT:    srld $r1 = $r1, 48
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fcompnhq.olt $r8 = $r2, $r3
; CHECK-NEXT:    fcompnhq.olt $r9 = $r4, $r5
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fcompnhq.olt $r10 = $r6, $r7
; CHECK-NEXT:    fcompnhq.olt $r11 = $r0, $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cmoved.wnez $r8 ? $r2 = $r3
; CHECK-NEXT:    cmoved.wnez $r9 ? $r4 = $r5
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cmoved.wnez $r10 ? $r6 = $r7
; CHECK-NEXT:    cmoved.wnez $r11 ? $r0 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r2 = $r4, 31, 16
; CHECK-NEXT:    insf $r6 = $r0, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r2 = $r6, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r2
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecext = extractelement <4 x half> %x, i32 0
  %vecext1 = extractelement <4 x half> %y, i32 0
  %cmp = fcmp olt half %vecext, %vecext1
  %cond = select i1 %cmp, half %vecext1, half %vecext
  %vecins = insertelement <4 x half> undef, half %cond, i32 0
  %vecext4 = extractelement <4 x half> %x, i32 1
  %vecext5 = extractelement <4 x half> %y, i32 1
  %cmp6 = fcmp olt half %vecext4, %vecext5
  %cond12 = select i1 %cmp6, half %vecext5, half %vecext4
  %vecins13 = insertelement <4 x half> %vecins, half %cond12, i32 1
  %vecext14 = extractelement <4 x half> %x, i32 2
  %vecext15 = extractelement <4 x half> %y, i32 2
  %cmp16 = fcmp olt half %vecext14, %vecext15
  %cond22 = select i1 %cmp16, half %vecext15, half %vecext14
  %vecins23 = insertelement <4 x half> %vecins13, half %cond22, i32 2
  %vecext24 = extractelement <4 x half> %x, i32 3
  %vecext25 = extractelement <4 x half> %y, i32 3
  %cmp26 = fcmp olt half %vecext24, %vecext25
  %cond32 = select i1 %cmp26, half %vecext25, half %vecext24
  %vecins33 = insertelement <4 x half> %vecins23, half %cond32, i32 3
  ret <4 x half> %vecins33
}

define half @f_Select64PAT(i64 %c, half %a, half %b){
; CHECK-LABEL: f_Select64PAT:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    cmoved.deqz $r0 ? $r2 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r2
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp = icmp eq i64 %c, 0
  %cond = select i1 %cmp, half %a, half %b
  ret half %cond
}

define <2 x float> @f_select_cc_v2f32(i32 %c, i32 %c2, <2 x float> %a, <2 x float> %b){
; CHECK-LABEL: f_select_cc_v2f32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    compw.gt $r0 = $r0, $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyw $r1 = $r0
; CHECK-NEXT:    make $r0 = -1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cmoved.weqz $r1 ? $r0 = 0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r0, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    andnd $r1 = $r0, $r3
; CHECK-NEXT:    andd $r0 = $r2, $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ord $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp = icmp sgt i32 %c, %c2
  %cond = select i1 %cmp, <2 x float> %a, <2 x float> %b
  ret <2 x float> %cond
}

