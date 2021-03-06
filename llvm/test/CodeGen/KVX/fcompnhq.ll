; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -O2 | FileCheck %s
target triple = "kvx-kalray-cos"

define <4 x half> @eq(<4 x half> %a, <4 x half> %b){
; CHECK-LABEL: eq:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    fcompnhq.oeq $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp = fcmp oeq <4 x half> %a, %b
  %sext = sext <4 x i1> %cmp to <4 x i16>
  %0 = bitcast <4 x i16> %sext to <4 x half>
  ret <4 x half> %0
}

define <4 x half> @neq(<4 x half> %a, <4 x half> %b){
; CHECK-LABEL: neq:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    fcompnhq.une $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp = fcmp une <4 x half> %a, %b
  %sext = sext <4 x i1> %cmp to <4 x i16>
  %0 = bitcast <4 x i16> %sext to <4 x half>
  ret <4 x half> %0
}

define <4 x half> @gt(<4 x half> %a, <4 x half> %b){
; CHECK-LABEL: gt:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    fcompnhq.olt $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp = fcmp ogt <4 x half> %a, %b
  %sext = sext <4 x i1> %cmp to <4 x i16>
  %0 = bitcast <4 x i16> %sext to <4 x half>
  ret <4 x half> %0
}

define <4 x half> @lt(<4 x half> %a, <4 x half> %b){
; CHECK-LABEL: lt:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    fcompnhq.olt $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp = fcmp olt <4 x half> %a, %b
  %sext = sext <4 x i1> %cmp to <4 x i16>
  %0 = bitcast <4 x i16> %sext to <4 x half>
  ret <4 x half> %0
}

define <4 x half> @gte(<4 x half> %a, <4 x half> %b){
; CHECK-LABEL: gte:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    fcompnhq.oge $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp = fcmp oge <4 x half> %a, %b
  %sext = sext <4 x i1> %cmp to <4 x i16>
  %0 = bitcast <4 x i16> %sext to <4 x half>
  ret <4 x half> %0
}

define <4 x half> @lte(<4 x half> %a, <4 x half> %b){
; CHECK-LABEL: lte:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    fcompnhq.oge $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp = fcmp ole <4 x half> %a, %b
  %sext = sext <4 x i1> %cmp to <4 x i16>
  %0 = bitcast <4 x i16> %sext to <4 x half>
  ret <4 x half> %0
}

