; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -O2 -o - %s | FileCheck %s
target triple = "kvx-kalray-cos"

; Can't produce the RI operands as it becomes a vselect,
; which could be implemented with a cmove, but they are
; expanded at the moment.

define <2 x i16> @land2h(<2 x i16> %a, <2 x i16> %b) {
; CHECK-LABEL: land2h:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    landhq $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp = icmp ne <2 x i16> %a, zeroinitializer
  %cmp1 = icmp ne <2 x i16> %b, zeroinitializer
  %and3 = and <2 x i1> %cmp1, %cmp
  %and = sext <2 x i1> %and3 to <2 x i16>
  ret <2 x i16> %and
}

define <2 x i16> @uland2h(<2 x i16> %a, <2 x i16> %b) {
; CHECK-LABEL: uland2h:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    landhq $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp = icmp ne <2 x i16> %a, zeroinitializer
  %cmp1 = icmp ne <2 x i16> %b, zeroinitializer
  %and3 = and <2 x i1> %cmp1, %cmp
  %and = sext <2 x i1> %and3 to <2 x i16>
  ret <2 x i16> %and
}

define <3 x i16> @land3h(<3 x i16> %a, <3 x i16> %b) {
; CHECK-LABEL: land3h:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    landhq $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp = icmp ne <3 x i16> %a, zeroinitializer
  %cmp7 = icmp ne <3 x i16> %b, zeroinitializer
  %and9 = and <3 x i1> %cmp7, %cmp
  %and = sext <3 x i1> %and9 to <3 x i16>
  ret <3 x i16> %and
}

define <3 x i16> @uland3h(<3 x i16> %a, <3 x i16> %b) {
; CHECK-LABEL: uland3h:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    landhq $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp = icmp ne <3 x i16> %a, zeroinitializer
  %cmp7 = icmp ne <3 x i16> %b, zeroinitializer
  %and9 = and <3 x i1> %cmp7, %cmp
  %and = sext <3 x i1> %and9 to <3 x i16>
  ret <3 x i16> %and
}

define <4 x i16> @land4h(<4 x i16> %a, <4 x i16> %b) {
; CHECK-LABEL: land4h:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    landhq $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp = icmp ne <4 x i16> %a, zeroinitializer
  %cmp1 = icmp ne <4 x i16> %b, zeroinitializer
  %and3 = and <4 x i1> %cmp1, %cmp
  %and = sext <4 x i1> %and3 to <4 x i16>
  ret <4 x i16> %and
}

define <4 x i16> @uland4h(<4 x i16> %a, <4 x i16> %b) {
; CHECK-LABEL: uland4h:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    landhq $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp = icmp ne <4 x i16> %a, zeroinitializer
  %cmp1 = icmp ne <4 x i16> %b, zeroinitializer
  %and3 = and <4 x i1> %cmp1, %cmp
  %and = sext <4 x i1> %and3 to <4 x i16>
  ret <4 x i16> %and
}

define <2 x i32> @landw2w(<2 x i32> %a, <2 x i32> %b) {
; CHECK-LABEL: landw2w:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    landwp $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp = icmp ne <2 x i32> %a, zeroinitializer
  %cmp1 = icmp ne <2 x i32> %b, zeroinitializer
  %and3 = and <2 x i1> %cmp1, %cmp
  %and = sext <2 x i1> %and3 to <2 x i32>
  ret <2 x i32> %and
}

define <2 x i32> @ulandw2w(<2 x i32> %a, <2 x i32> %b) {
; CHECK-LABEL: ulandw2w:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    landwp $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp = icmp ne <2 x i32> %a, zeroinitializer
  %cmp1 = icmp ne <2 x i32> %b, zeroinitializer
  %and3 = and <2 x i1> %cmp1, %cmp
  %and = sext <2 x i1> %and3 to <2 x i32>
  ret <2 x i32> %and
}
