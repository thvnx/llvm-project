; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -O3 | FileCheck %s
target triple = "kvx-kalray-cos"

define  <4 x i16> @minhq_rr(<4 x i16> %a, <4 x i16> %b) {
; CHECK-LABEL: minhq_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    minhq $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = icmp sgt <4 x i16> %a, %b
  %1 = select <4 x i1> %0, <4 x i16> %b, <4 x i16> %a
  ret <4 x i16> %1
}

define  <4 x i16> @minuhq_rr(<4 x i16> %a, <4 x i16> %b) {
; CHECK-LABEL: minuhq_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    minuhq $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = icmp ugt <4 x i16> %a, %b
  %1 = select <4 x i1> %0, <4 x i16> %b, <4 x i16> %a
  ret <4 x i16> %1
}

define  <4 x i16> @minhq_splat(<4 x i16> %a) {
; CHECK-LABEL: minhq_splat:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    minhq.@ $r0 = $r0, 0x140014
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = icmp slt <4 x i16> %a, <i16 20, i16 20, i16 20, i16 20>
  %1 = select <4 x i1> %0, <4 x i16> %a, <4 x i16> <i16 20, i16 20, i16 20, i16 20>
  ret <4 x i16> %1
}

define  <4 x i16> @minhq_splat2(<4 x i16> %a) {
; CHECK-LABEL: minhq_splat2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    minhq.@ $r0 = $r0, 0x16000b
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = icmp slt <4 x i16> %a, <i16 11, i16 22, i16 11, i16 22>
  %1 = select <4 x i1> %0, <4 x i16> %a, <4 x i16> <i16 11, i16 22, i16 11, i16 22>
  ret <4 x i16> %1
}

define  <4 x i16> @minhq_nosplat(<4 x i16> %a) {
; CHECK-LABEL: minhq_nosplat:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    minhq $r0 = $r0, 0x140014
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = icmp slt <4 x i16> %a, <i16 20, i16 20, i16 0, i16 0>
  %1 = select <4 x i1> %0, <4 x i16> %a, <4 x i16> <i16 20, i16 20, i16 0, i16 0>
  ret <4 x i16> %1
}

define  <4 x i16> @minhq_nosplat2(<4 x i16> %a) {
; CHECK-LABEL: minhq_nosplat2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    minhq $r0 = $r0, 0x14000b
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = icmp slt <4 x i16> %a, <i16 11, i16 20, i16 0, i16 0>
  %1 = select <4 x i1> %0, <4 x i16> %a, <4 x i16> <i16 11, i16 20, i16 0, i16 0>
  ret <4 x i16> %1
}

define  <4 x i16> @minuhq_splat(<4 x i16> %a) {
; CHECK-LABEL: minuhq_splat:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    minuhq.@ $r0 = $r0, 0x140014
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = icmp ult <4 x i16> %a, <i16 20, i16 20, i16 20, i16 20>
  %1 = select <4 x i1> %0, <4 x i16> %a, <4 x i16> <i16 20, i16 20, i16 20, i16 20>
  ret <4 x i16> %1
}

define  <4 x i16> @minuhq_splat2(<4 x i16> %a) {
; CHECK-LABEL: minuhq_splat2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    minuhq.@ $r0 = $r0, 0x16000b
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = icmp ult <4 x i16> %a, <i16 11, i16 22, i16 11, i16 22>
  %1 = select <4 x i1> %0, <4 x i16> %a, <4 x i16> <i16 11, i16 22, i16 11, i16 22>
  ret <4 x i16> %1
}

define  <4 x i16> @minuhq_nosplat(<4 x i16> %a) {
; CHECK-LABEL: minuhq_nosplat:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    minuhq $r0 = $r0, 0x140014
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = icmp ult <4 x i16> %a, <i16 20, i16 20, i16 0, i16 0>
  %1 = select <4 x i1> %0, <4 x i16> %a, <4 x i16> <i16 20, i16 20, i16 0, i16 0>
  ret <4 x i16> %1
}

define  <4 x i16> @minuhq_nosplat2(<4 x i16> %a) {
; CHECK-LABEL: minuhq_nosplat2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    minuhq $r0 = $r0, 0x14000b
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = icmp ult <4 x i16> %a, <i16 11, i16 20, i16 0, i16 0>
  %1 = select <4 x i1> %0, <4 x i16> %a, <4 x i16> <i16 11, i16 20, i16 0, i16 0>
  ret <4 x i16> %1
}

define  <2 x i16> @v2_minhq_rr(<2 x i16> %a, <2 x i16> %b) {
; CHECK-LABEL: v2_minhq_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    minhq $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = icmp sgt <2 x i16> %a, %b
  %1 = select <2 x i1> %0, <2 x i16> %b, <2 x i16> %a
  ret <2 x i16> %1
}

define  <2 x i16> @v2_minuhq_rr(<2 x i16> %a, <2 x i16> %b) {
; CHECK-LABEL: v2_minuhq_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    minuhq $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = icmp ugt <2 x i16> %a, %b
  %1 = select <2 x i1> %0, <2 x i16> %b, <2 x i16> %a
  ret <2 x i16> %1
}

define  <2 x i16> @v2_minhq_ri(<2 x i16> %a, <2 x i16> %b) {
; CHECK-LABEL: v2_minhq_ri:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    minhq $r0 = $r0, 0xfffeffff
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = icmp slt <2 x i16> %a, <i16 -1, i16 -2>
  %1 = select <2 x i1> %0, <2 x i16> %a, <2 x i16> <i16 -1, i16 -2>
  ret <2 x i16> %1
}

define  <2 x i16> @v2_minuhq_ri(<2 x i16> %a, <2 x i16> %b) {
; CHECK-LABEL: v2_minuhq_ri:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    minuhq $r0 = $r0, 0x140014
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = icmp ult <2 x i16> %a, <i16 20, i16 20>
  %1 = select <2 x i1> %0, <2 x i16> %a, <2 x i16> <i16 20, i16 20>
  ret <2 x i16> %1
}

define  <3 x i16> @v3_minhq_rr(<3 x i16> %a, <3 x i16> %b) {
; CHECK-LABEL: v3_minhq_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    minhq $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = icmp sgt <3 x i16> %a, %b
  %1 = select <3 x i1> %0, <3 x i16> %b, <3 x i16> %a
  ret <3 x i16> %1
}

define  <3 x i16> @v3_minuhq_rr(<3 x i16> %a, <3 x i16> %b) {
; CHECK-LABEL: v3_minuhq_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    minuhq $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = icmp ugt <3 x i16> %a, %b
  %1 = select <3 x i1> %0, <3 x i16> %b, <3 x i16> %a
  ret <3 x i16> %1
}

define  <3 x i16> @v3_minhq_splat(<3 x i16> %a) {
; CHECK-LABEL: v3_minhq_splat:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    minhq.@ $r0 = $r0, 0x140014
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = icmp slt <3 x i16> %a, <i16 20, i16 20, i16 20>
  %1 = select <3 x i1> %0, <3 x i16> %a, <3 x i16> <i16 20, i16 20, i16 20>
  ret <3 x i16> %1
}

define  <3 x i16> @v3_minhq_splat2(<3 x i16> %a) {
; CHECK-LABEL: v3_minhq_splat2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    minhq.@ $r0 = $r0, 0x16000b
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = icmp slt <3 x i16> %a, <i16 11, i16 22, i16 11>
  %1 = select <3 x i1> %0, <3 x i16> %a, <3 x i16> <i16 11, i16 22, i16 11>
  ret <3 x i16> %1
}

define  <3 x i16> @v3_minhq_nosplat(<3 x i16> %a) {
; CHECK-LABEL: v3_minhq_nosplat:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    minhq $r0 = $r0, 0x140014
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = icmp slt <3 x i16> %a, <i16 20, i16 20, i16 0>
  %1 = select <3 x i1> %0, <3 x i16> %a, <3 x i16> <i16 20, i16 20, i16 0>
  ret <3 x i16> %1
}

define  <3 x i16> @v3_minhq_nosplat2(<3 x i16> %a) {
; CHECK-LABEL: v3_minhq_nosplat2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    minhq $r0 = $r0, 0x14000b
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = icmp slt <3 x i16> %a, <i16 11, i16 20, i16 0>
  %1 = select <3 x i1> %0, <3 x i16> %a, <3 x i16> <i16 11, i16 20, i16 0>
  ret <3 x i16> %1
}

define  <3 x i16> @v3_minuhq_splat(<3 x i16> %a, <3 x i16> %b) {
; CHECK-LABEL: v3_minuhq_splat:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    minuhq.@ $r0 = $r0, 0x140014
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = icmp ult <3 x i16> %a, <i16 20, i16 20, i16 20>
  %1 = select <3 x i1> %0, <3 x i16> %a, <3 x i16> <i16 20, i16 20, i16 20>
  ret <3 x i16> %1
}

define  <3 x i16> @v3_minuhq_splat2(<3 x i16> %a) {
; CHECK-LABEL: v3_minuhq_splat2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    minuhq.@ $r0 = $r0, 0x16000b
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = icmp ult <3 x i16> %a, <i16 11, i16 22, i16 11>
  %1 = select <3 x i1> %0, <3 x i16> %a, <3 x i16> <i16 11, i16 22, i16 11>
  ret <3 x i16> %1
}

define  <3 x i16> @v3_minuhq_nosplat(<3 x i16> %a) {
; CHECK-LABEL: v3_minuhq_nosplat:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    minuhq $r0 = $r0, 0x140014
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = icmp ult <3 x i16> %a, <i16 20, i16 20, i16 0>
  %1 = select <3 x i1> %0, <3 x i16> %a, <3 x i16> <i16 20, i16 20, i16 0>
  ret <3 x i16> %1
}

define  <3 x i16> @v3_minuhq_nosplat2(<3 x i16> %a) {
; CHECK-LABEL: v3_minuhq_nosplat2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    minuhq $r0 = $r0, 0x14000b
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = icmp ult <3 x i16> %a, <i16 11, i16 20, i16 0>
  %1 = select <3 x i1> %0, <3 x i16> %a, <3 x i16> <i16 11, i16 20, i16 0>
  ret <3 x i16> %1
}

define  <3 x i16> @v3_minuhq_rr1(<3 x i16> %a) {
; CHECK-LABEL: v3_minuhq_rr1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 0x10014000b
; CHECK-NEXT:    ;;
; CHECK-NEXT:    minuhq $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = icmp ult <3 x i16> %a, <i16 11, i16 20, i16 1>
  %1 = select <3 x i1> %0, <3 x i16> %a, <3 x i16> <i16 11, i16 20, i16 1>
  ret <3 x i16> %1
}
