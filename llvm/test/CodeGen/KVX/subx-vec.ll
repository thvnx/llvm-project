; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -O2 -o - %s | FileCheck %s
target triple = "kvx-kalray-cos"


define <2 x i16> @sub_i16x2_rr(<2 x i16> %a, <2 x i16> %b) {
; CHECK-LABEL: sub_i16x2_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfhq $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %sub = sub <2 x i16> %a, %b
  ret <2 x i16> %sub
}

define <2 x i16> @sub_i16x2_ri(<2 x i16> %a) {
; CHECK-LABEL: sub_i16x2_ri:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfhq $r0 = $r0, 0xffff
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %sub = sub <2 x i16> <i16 -1, i16 0>, %a
  ret <2 x i16> %sub
}

define <4 x i16> @sub_i16x4_rr(<4 x i16> %a, <4 x i16> %b) {
; CHECK-LABEL: sub_i16x4_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfhq $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %sub = sub <4 x i16> %a, %b
  ret <4 x i16> %sub
}

define <4 x i16> @sub_i16x4_ri_(<4 x i16> %a) {
; CHECK-LABEL: sub_i16x4_ri_:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfhq $r0 = $r0, 0xffff0005
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %sub = sub <4 x i16> <i16 5, i16 -1, i16 0, i16 0>, %a
  ret <4 x i16> %sub
}

define <4 x i16> @sub_i16x4_ri_at(<4 x i16> %a) {
; CHECK-LABEL: sub_i16x4_ri_at:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfhq.@ $r0 = $r0, 0xffff0005
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %sub = sub <4 x i16> <i16 5, i16 -1, i16 5, i16 -1>, %a
  ret <4 x i16> %sub
}

define <4 x i16> @sub_i16x4_ri_rr2(<4 x i16> %a) {
; CHECK-LABEL: sub_i16x4_ri_rr2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 0x10005ffff0005
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sbfhq $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %sub = sub <4 x i16> %a, <i16 5, i16 -1, i16 5, i16 1>
  ret <4 x i16> %sub
}

define <2 x i32> @sub_i32x2_rr(<2 x i32> %a, <2 x i32> %b) {
; CHECK-LABEL: sub_i32x2_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfwp $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %sub = sub <2 x i32> %a, %b
  ret <2 x i32> %sub
}

define <2 x i32> @sub_i32x2_ri_(<2 x i32> %a) {
; CHECK-LABEL: sub_i32x2_ri_:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfwp $r0 = $r0, -1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %sub = sub <2 x i32> <i32 -1, i32 0>, %a
  ret <2 x i32> %sub
}

define <2 x i32> @sub_i32x2_ri_at(<2 x i32> %a) {
; CHECK-LABEL: sub_i32x2_ri_at:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfwp.@ $r0 = $r0, -2
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %sub = sub <2 x i32> <i32 -2, i32 -2>, %a
  ret <2 x i32> %sub
}

define <2 x i32> @sub_i32x2_rr_2(<2 x i32> %a) {
; CHECK-LABEL: sub_i32x2_rr_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 0xffffffff00000001
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sbfwp $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %sub = sub <2 x i32> %a, <i32 1, i32 -1>
  ret <2 x i32> %sub
}

define <2 x i16> @subx2_i16x2_rr(<2 x i16> %a, <2 x i16> %b) {
; CHECK-LABEL: subx2_i16x2_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx2hq $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i16> %b, <i16 1, i16 1>
  %sub = sub <2 x i16> %a, %mul
  ret <2 x i16> %sub
}

define <2 x i16> @subx2_u16x2_rr(<2 x i16> %a, <2 x i16> %b) {
; CHECK-LABEL: subx2_u16x2_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx2hq $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i16> %b, <i16 1, i16 1>
  %sub = sub <2 x i16> %a, %mul
  ret <2 x i16> %sub
}

define <4 x i16> @subx2_i16x4_rr(<4 x i16> %a, <4 x i16> %b) {
; CHECK-LABEL: subx2_i16x4_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx2hq $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %b, <i16 1, i16 1, i16 1, i16 1>
  %sub = sub <4 x i16> %a, %mul
  ret <4 x i16> %sub
}

define <4 x i16> @subx2_u16x4_rr(<4 x i16> %a, <4 x i16> %b) {
; CHECK-LABEL: subx2_u16x4_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx2hq $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %b, <i16 1, i16 1, i16 1, i16 1>
  %sub = sub <4 x i16> %a, %mul
  ret <4 x i16> %sub
}

define <2 x i32> @subx2_i32x2_rr(<2 x i32> %a, <2 x i32> %b) {
; CHECK-LABEL: subx2_i32x2_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx2wp $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %b, <i32 1, i32 1>
  %sub = sub <2 x i32> %a, %mul
  ret <2 x i32> %sub
}

define <2 x i32> @subx2_u32x2_rr(<2 x i32> %a, <2 x i32> %b) {
; CHECK-LABEL: subx2_u32x2_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx2wp $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %b, <i32 1, i32 1>
  %sub = sub <2 x i32> %a, %mul
  ret <2 x i32> %sub
}

define <2 x i16> @subx4_i16x2_rr(<2 x i16> %a, <2 x i16> %b) {
; CHECK-LABEL: subx4_i16x2_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx4hq $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i16> %b, <i16 2, i16 2>
  %sub = sub <2 x i16> %a, %mul
  ret <2 x i16> %sub
}

define <2 x i16> @subx4_u16x2_rr(<2 x i16> %a, <2 x i16> %b) {
; CHECK-LABEL: subx4_u16x2_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx4hq $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i16> %b, <i16 2, i16 2>
  %sub = sub <2 x i16> %a, %mul
  ret <2 x i16> %sub
}

define <4 x i16> @subx4_i16x4_rr(<4 x i16> %a, <4 x i16> %b) {
; CHECK-LABEL: subx4_i16x4_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx4hq $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %b, <i16 2, i16 2, i16 2, i16 2>
  %sub = sub <4 x i16> %a, %mul
  ret <4 x i16> %sub
}

define <4 x i16> @subx4_u16x4_rr(<4 x i16> %a, <4 x i16> %b) {
; CHECK-LABEL: subx4_u16x4_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx4hq $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %b, <i16 2, i16 2, i16 2, i16 2>
  %sub = sub <4 x i16> %a, %mul
  ret <4 x i16> %sub
}

define <2 x i32> @subx4_i32x2_rr(<2 x i32> %a, <2 x i32> %b) {
; CHECK-LABEL: subx4_i32x2_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx4wp $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %b, <i32 2, i32 2>
  %sub = sub <2 x i32> %a, %mul
  ret <2 x i32> %sub
}

define <2 x i32> @subx4_u32x2_rr(<2 x i32> %a, <2 x i32> %b) {
; CHECK-LABEL: subx4_u32x2_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx4wp $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %b, <i32 2, i32 2>
  %sub = sub <2 x i32> %a, %mul
  ret <2 x i32> %sub
}

define <2 x i16> @subx8_i16x2_rr(<2 x i16> %a, <2 x i16> %b) {
; CHECK-LABEL: subx8_i16x2_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx8hq $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i16> %b, <i16 3, i16 3>
  %sub = sub <2 x i16> %a, %mul
  ret <2 x i16> %sub
}

define <2 x i16> @subx8_u16x2_rr(<2 x i16> %a, <2 x i16> %b) {
; CHECK-LABEL: subx8_u16x2_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx8hq $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i16> %b, <i16 3, i16 3>
  %sub = sub <2 x i16> %a, %mul
  ret <2 x i16> %sub
}

define <4 x i16> @subx8_i16x4_rr(<4 x i16> %a, <4 x i16> %b) {
; CHECK-LABEL: subx8_i16x4_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx8hq $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %b, <i16 3, i16 3, i16 3, i16 3>
  %sub = sub <4 x i16> %a, %mul
  ret <4 x i16> %sub
}

define <4 x i16> @subx8_u16x4_rr(<4 x i16> %a, <4 x i16> %b) {
; CHECK-LABEL: subx8_u16x4_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx8hq $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %b, <i16 3, i16 3, i16 3, i16 3>
  %sub = sub <4 x i16> %a, %mul
  ret <4 x i16> %sub
}

define <2 x i32> @subx8_i32x2_rr(<2 x i32> %a, <2 x i32> %b) {
; CHECK-LABEL: subx8_i32x2_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx8wp $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %b, <i32 3, i32 3>
  %sub = sub <2 x i32> %a, %mul
  ret <2 x i32> %sub
}

define <2 x i32> @subx8_u32x2_rr(<2 x i32> %a, <2 x i32> %b) {
; CHECK-LABEL: subx8_u32x2_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx8wp $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %b, <i32 3, i32 3>
  %sub = sub <2 x i32> %a, %mul
  ret <2 x i32> %sub
}

define <2 x i16> @subx16_i16x2_rr(<2 x i16> %a, <2 x i16> %b) {
; CHECK-LABEL: subx16_i16x2_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx16hq $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i16> %b, <i16 4, i16 4>
  %sub = sub <2 x i16> %a, %mul
  ret <2 x i16> %sub
}

define <2 x i16> @subx16_u16x2_rr(<2 x i16> %a, <2 x i16> %b) {
; CHECK-LABEL: subx16_u16x2_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx16hq $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i16> %b, <i16 4, i16 4>
  %sub = sub <2 x i16> %a, %mul
  ret <2 x i16> %sub
}

define <4 x i16> @subx16_i16x4_rr(<4 x i16> %a, <4 x i16> %b) {
; CHECK-LABEL: subx16_i16x4_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx16hq $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %b, <i16 4, i16 4, i16 4, i16 4>
  %sub = sub <4 x i16> %a, %mul
  ret <4 x i16> %sub
}

define <4 x i16> @subx16_u16x4_rr(<4 x i16> %a, <4 x i16> %b) {
; CHECK-LABEL: subx16_u16x4_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx16hq $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %b, <i16 4, i16 4, i16 4, i16 4>
  %sub = sub <4 x i16> %a, %mul
  ret <4 x i16> %sub
}

define <2 x i32> @subx16_i32x2_rr(<2 x i32> %a, <2 x i32> %b) {
; CHECK-LABEL: subx16_i32x2_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx16wp $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %b, <i32 4, i32 4>
  %sub = sub <2 x i32> %a, %mul
  ret <2 x i32> %sub
}

define <2 x i32> @subx16_u32x2_rr(<2 x i32> %a, <2 x i32> %b) {
; CHECK-LABEL: subx16_u32x2_rr:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx16wp $r0 = $r1, $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %b, <i32 4, i32 4>
  %sub = sub <2 x i32> %a, %mul
  ret <2 x i32> %sub
}

define <2 x i16> @subx2_i16x2_ri_(<2 x i16> %a) {
; CHECK-LABEL: subx2_i16x2_ri_:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx2hq $r0 = $r0, 0x20001
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i16> %a, <i16 1, i16 1>
  %sub = sub <2 x i16> <i16 1, i16 2>, %mul
  ret <2 x i16> %sub
}

define <2 x i16> @subx2_u16x2_ri_(<2 x i16> %a) {
; CHECK-LABEL: subx2_u16x2_ri_:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx2hq $r0 = $r0, 0x20001
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i16> %a, <i16 1, i16 1>
  %sub = sub <2 x i16> <i16 1, i16 2>, %mul
  ret <2 x i16> %sub
}

define <4 x i16> @subx2_i16x4_ri_(<4 x i16> %a) {
; CHECK-LABEL: subx2_i16x4_ri_:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx2hq $r0 = $r0, 0x20001
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %a, <i16 1, i16 1, i16 1, i16 1>
  %sub = sub <4 x i16> <i16 1, i16 2, i16 0, i16 0>, %mul
  ret <4 x i16> %sub
}

define <4 x i16> @subx2_i16x4_ri_at(<4 x i16> %a) {
; CHECK-LABEL: subx2_i16x4_ri_at:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx2hq.@ $r0 = $r0, 0x20001
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %a, <i16 1, i16 1, i16 1, i16 1>
  %sub = sub <4 x i16> <i16 1, i16 2, i16 1, i16 2>, %mul
  ret <4 x i16> %sub
}

define <4 x i16> @subx2_i16x4_rr_2(<4 x i16> %a) {
; CHECK-LABEL: subx2_i16x4_rr_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 0x3000100020001
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sbfx2hq $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %a, <i16 1, i16 1, i16 1, i16 1>
  %sub = sub <4 x i16> <i16 1, i16 2, i16 1, i16 3>, %mul
  ret <4 x i16> %sub
}

define <4 x i16> @subx2_u16x4_ri_(<4 x i16> %a) {
; CHECK-LABEL: subx2_u16x4_ri_:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx2hq $r0 = $r0, 0x20001
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %a, <i16 1, i16 1, i16 1, i16 1>
  %sub = sub <4 x i16> <i16 1, i16 2, i16 0, i16 0>, %mul
  ret <4 x i16> %sub
}

define <4 x i16> @subx2_u16x4_ri_at(<4 x i16> %a) {
; CHECK-LABEL: subx2_u16x4_ri_at:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx2hq.@ $r0 = $r0, 0x20001
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %a, <i16 1, i16 1, i16 1, i16 1>
  %sub = sub <4 x i16> <i16 1, i16 2, i16 1, i16 2>, %mul
  ret <4 x i16> %sub
}

define <4 x i16> @subx2_u16x4_rr_2(<4 x i16> %a) {
; CHECK-LABEL: subx2_u16x4_rr_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 0x3000100020001
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sbfx2hq $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %a, <i16 1, i16 1, i16 1, i16 1>
  %sub = sub <4 x i16> <i16 1, i16 2, i16 1, i16 3>, %mul
  ret <4 x i16> %sub
}

define <2 x i32> @subx2_i32x2_ri_(<2 x i32> %a) {
; CHECK-LABEL: subx2_i32x2_ri_:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx2wp $r0 = $r0, 1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %a, <i32 1, i32 1>
  %sub = sub <2 x i32> <i32 1, i32 0>, %mul
  ret <2 x i32> %sub
}

define <2 x i32> @subx2_i32x2_ri_at(<2 x i32> %a) {
; CHECK-LABEL: subx2_i32x2_ri_at:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx2wp.@ $r0 = $r0, 0x3
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %a, <i32 1, i32 1>
  %sub = sub <2 x i32> <i32 3, i32 3>, %mul
  ret <2 x i32> %sub
}

define <2 x i32> @subx2_i32x2_rr_2(<2 x i32> %a) {
; CHECK-LABEL: subx2_i32x2_rr_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 0x200000003
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sbfx2wp $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %a, <i32 1, i32 1>
  %sub = sub <2 x i32> <i32 3, i32 2>, %mul
  ret <2 x i32> %sub
}

define <2 x i32> @subx2_u32x2_ri_(<2 x i32> %a) {
; CHECK-LABEL: subx2_u32x2_ri_:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx2wp $r0 = $r0, 1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %a, <i32 1, i32 1>
  %sub = sub <2 x i32> <i32 1, i32 0>, %mul
  ret <2 x i32> %sub
}

define <2 x i32> @subx2_u32x2_ri_at(<2 x i32> %a) {
; CHECK-LABEL: subx2_u32x2_ri_at:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx2wp.@ $r0 = $r0, 0x3
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %a, <i32 1, i32 1>
  %sub = sub <2 x i32> <i32 3, i32 3>, %mul
  ret <2 x i32> %sub
}

define <2 x i32> @subx2_u32x2_rr_2(<2 x i32> %a) {
; CHECK-LABEL: subx2_u32x2_rr_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 0x200000003
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sbfx2wp $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %a, <i32 1, i32 1>
  %sub = sub <2 x i32> <i32 3, i32 2>, %mul
  ret <2 x i32> %sub
}

define <2 x i16> @subx4_i16x2_ri_(<2 x i16> %a) {
; CHECK-LABEL: subx4_i16x2_ri_:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx4hq $r0 = $r0, 0x20001
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i16> %a, <i16 2, i16 2>
  %sub = sub <2 x i16> <i16 1, i16 2>, %mul
  ret <2 x i16> %sub
}

define <2 x i16> @subx4_u16x2_ri_(<2 x i16> %a) {
; CHECK-LABEL: subx4_u16x2_ri_:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx4hq $r0 = $r0, 0x20001
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i16> %a, <i16 2, i16 2>
  %sub = sub <2 x i16> <i16 1, i16 2>, %mul
  ret <2 x i16> %sub
}

define <4 x i16> @subx4_i16x4_ri_(<4 x i16> %a) {
; CHECK-LABEL: subx4_i16x4_ri_:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx4hq $r0 = $r0, 0x20001
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %a, <i16 2, i16 2, i16 2, i16 2>
  %sub = sub <4 x i16> <i16 1, i16 2, i16 0, i16 0>, %mul
  ret <4 x i16> %sub
}

define <4 x i16> @subx4_i16x4_ri_at(<4 x i16> %a) {
; CHECK-LABEL: subx4_i16x4_ri_at:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx4hq.@ $r0 = $r0, 0x20001
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %a, <i16 2, i16 2, i16 2, i16 2>
  %sub = sub <4 x i16> <i16 1, i16 2, i16 1, i16 2>, %mul
  ret <4 x i16> %sub
}

define <4 x i16> @subx4_i16x4_rr_2(<4 x i16> %a) {
; CHECK-LABEL: subx4_i16x4_rr_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 0x3000100020001
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sbfx4hq $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %a, <i16 2, i16 2, i16 2, i16 2>
  %sub = sub <4 x i16> <i16 1, i16 2, i16 1, i16 3>, %mul
  ret <4 x i16> %sub
}

define <4 x i16> @subx4_i16x4_rr_NOT(<4 x i16> %a) {
; CHECK-LABEL: subx4_i16x4_rr_NOT:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx4hq.@ $r0 = $r0, 0x7d00001
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %a, <i16 2, i16 2, i16 2, i16 2>
  %sub = sub <4 x i16> <i16 1, i16 2000, i16 1, i16 2000>, %mul
  ret <4 x i16> %sub
}

define <4 x i16> @subx4_u16x4_ri_(<4 x i16> %a) {
; CHECK-LABEL: subx4_u16x4_ri_:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx4hq $r0 = $r0, 0x20001
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %a, <i16 2, i16 2, i16 2, i16 2>
  %sub = sub <4 x i16> <i16 1, i16 2, i16 0, i16 0>, %mul
  ret <4 x i16> %sub
}

define <4 x i16> @subx4_u16x4_ri_at(<4 x i16> %a) {
; CHECK-LABEL: subx4_u16x4_ri_at:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx4hq.@ $r0 = $r0, 0x20001
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %a, <i16 2, i16 2, i16 2, i16 2>
  %sub = sub <4 x i16> <i16 1, i16 2, i16 1, i16 2>, %mul
  ret <4 x i16> %sub
}

define <4 x i16> @subx4_u16x4_rr_2(<4 x i16> %a) {
; CHECK-LABEL: subx4_u16x4_rr_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 0x3000100020001
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sbfx4hq $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %a, <i16 2, i16 2, i16 2, i16 2>
  %sub = sub <4 x i16> <i16 1, i16 2, i16 1, i16 3>, %mul
  ret <4 x i16> %sub
}

define <2 x i32> @subx4_i32x2_ri_(<2 x i32> %a) {
; CHECK-LABEL: subx4_i32x2_ri_:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx4wp $r0 = $r0, 1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %a, <i32 2, i32 2>
  %sub = sub <2 x i32> <i32 1, i32 0>, %mul
  ret <2 x i32> %sub
}

define <2 x i32> @subx4_i32x2_ri_at(<2 x i32> %a) {
; CHECK-LABEL: subx4_i32x2_ri_at:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx4wp.@ $r0 = $r0, 0x3
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %a, <i32 2, i32 2>
  %sub = sub <2 x i32> <i32 3, i32 3>, %mul
  ret <2 x i32> %sub
}

define <2 x i32> @subx4_i32x2_rr_2(<2 x i32> %a) {
; CHECK-LABEL: subx4_i32x2_rr_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 0x200000003
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sbfx4wp $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %a, <i32 2, i32 2>
  %sub = sub <2 x i32> <i32 3, i32 2>, %mul
  ret <2 x i32> %sub
}

define <2 x i32> @subx4_u32x2_ri_(<2 x i32> %a) {
; CHECK-LABEL: subx4_u32x2_ri_:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx4wp $r0 = $r0, 1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %a, <i32 2, i32 2>
  %sub = sub <2 x i32> <i32 1, i32 0>, %mul
  ret <2 x i32> %sub
}

define <2 x i32> @subx4_u32x2_ri_at(<2 x i32> %a) {
; CHECK-LABEL: subx4_u32x2_ri_at:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx4wp.@ $r0 = $r0, 0x3
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %a, <i32 2, i32 2>
  %sub = sub <2 x i32> <i32 3, i32 3>, %mul
  ret <2 x i32> %sub
}

define <2 x i32> @subx4_u32x2_rr_2(<2 x i32> %a) {
; CHECK-LABEL: subx4_u32x2_rr_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 0x200000003
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sbfx4wp $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %a, <i32 2, i32 2>
  %sub = sub <2 x i32> <i32 3, i32 2>, %mul
  ret <2 x i32> %sub
}

define <2 x i16> @subx8_i16x2_ri_(<2 x i16> %a) {
; CHECK-LABEL: subx8_i16x2_ri_:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx8hq $r0 = $r0, 0x20001
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i16> %a, <i16 3, i16 3>
  %sub = sub <2 x i16> <i16 1, i16 2>, %mul
  ret <2 x i16> %sub
}

define <2 x i16> @subx8_u16x2_ri_(<2 x i16> %a) {
; CHECK-LABEL: subx8_u16x2_ri_:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx8hq $r0 = $r0, 0x20001
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i16> %a, <i16 3, i16 3>
  %sub = sub <2 x i16> <i16 1, i16 2>, %mul
  ret <2 x i16> %sub
}

define <4 x i16> @subx8_i16x4_ri_(<4 x i16> %a) {
; CHECK-LABEL: subx8_i16x4_ri_:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx8hq $r0 = $r0, 0x20001
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %a, <i16 3, i16 3, i16 3, i16 3>
  %sub = sub <4 x i16> <i16 1, i16 2, i16 0, i16 0>, %mul
  ret <4 x i16> %sub
}

define <4 x i16> @subx8_i16x4_ri_at(<4 x i16> %a) {
; CHECK-LABEL: subx8_i16x4_ri_at:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx8hq.@ $r0 = $r0, 0x20001
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %a, <i16 3, i16 3, i16 3, i16 3>
  %sub = sub <4 x i16> <i16 1, i16 2, i16 1, i16 2>, %mul
  ret <4 x i16> %sub
}

define <4 x i16> @subx8_i16x4_rr_2(<4 x i16> %a) {
; CHECK-LABEL: subx8_i16x4_rr_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 0x3000100020001
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sbfx8hq $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %a, <i16 3, i16 3, i16 3, i16 3>
  %sub = sub <4 x i16> <i16 1, i16 2, i16 1, i16 3>, %mul
  ret <4 x i16> %sub
}

define <4 x i16> @subx8_u16x4_ri_(<4 x i16> %a) {
; CHECK-LABEL: subx8_u16x4_ri_:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx8hq $r0 = $r0, 0x20001
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %a, <i16 3, i16 3, i16 3, i16 3>
  %sub = sub <4 x i16> <i16 1, i16 2, i16 0, i16 0>, %mul
  ret <4 x i16> %sub
}

define <4 x i16> @subx8_u16x4_ri_at(<4 x i16> %a) {
; CHECK-LABEL: subx8_u16x4_ri_at:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx8hq.@ $r0 = $r0, 0x20001
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %a, <i16 3, i16 3, i16 3, i16 3>
  %sub = sub <4 x i16> <i16 1, i16 2, i16 1, i16 2>, %mul
  ret <4 x i16> %sub
}

define <4 x i16> @subx8_u16x4_rr_2(<4 x i16> %a) {
; CHECK-LABEL: subx8_u16x4_rr_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 0x3000100020001
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sbfx8hq $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %a, <i16 3, i16 3, i16 3, i16 3>
  %sub = sub <4 x i16> <i16 1, i16 2, i16 1, i16 3>, %mul
  ret <4 x i16> %sub
}

define <2 x i32> @subx8_i32x2_ri_(<2 x i32> %a) {
; CHECK-LABEL: subx8_i32x2_ri_:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx8wp $r0 = $r0, 1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %a, <i32 3, i32 3>
  %sub = sub <2 x i32> <i32 1, i32 0>, %mul
  ret <2 x i32> %sub
}

define <2 x i32> @subx8_i32x2_ri_at(<2 x i32> %a) {
; CHECK-LABEL: subx8_i32x2_ri_at:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx8wp.@ $r0 = $r0, 0x3
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %a, <i32 3, i32 3>
  %sub = sub <2 x i32> <i32 3, i32 3>, %mul
  ret <2 x i32> %sub
}

define <2 x i32> @subx8_i32x2_rr_2(<2 x i32> %a) {
; CHECK-LABEL: subx8_i32x2_rr_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 0x200000003
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sbfx8wp $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %a, <i32 3, i32 3>
  %sub = sub <2 x i32> <i32 3, i32 2>, %mul
  ret <2 x i32> %sub
}

define <2 x i32> @subx8_u32x2_ri_(<2 x i32> %a) {
; CHECK-LABEL: subx8_u32x2_ri_:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx8wp $r0 = $r0, 1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %a, <i32 3, i32 3>
  %sub = sub <2 x i32> <i32 1, i32 0>, %mul
  ret <2 x i32> %sub
}

define <2 x i32> @subx8_u32x2_ri_at(<2 x i32> %a) {
; CHECK-LABEL: subx8_u32x2_ri_at:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx8wp.@ $r0 = $r0, 0x3
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %a, <i32 3, i32 3>
  %sub = sub <2 x i32> <i32 3, i32 3>, %mul
  ret <2 x i32> %sub
}

define <2 x i32> @subx8_u32x2_rr_2(<2 x i32> %a) {
; CHECK-LABEL: subx8_u32x2_rr_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 0x200000003
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sbfx8wp $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %a, <i32 3, i32 3>
  %sub = sub <2 x i32> <i32 3, i32 2>, %mul
  ret <2 x i32> %sub
}

define <2 x i16> @subx16_i16x2_ri_(<2 x i16> %a) {
; CHECK-LABEL: subx16_i16x2_ri_:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx16hq $r0 = $r0, 0x20001
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i16> %a, <i16 4, i16 4>
  %sub = sub <2 x i16> <i16 1, i16 2>, %mul
  ret <2 x i16> %sub
}

define <2 x i16> @subx16_u16x2_ri_(<2 x i16> %a) {
; CHECK-LABEL: subx16_u16x2_ri_:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx16hq $r0 = $r0, 0x20001
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i16> %a, <i16 4, i16 4>
  %sub = sub <2 x i16> <i16 1, i16 2>, %mul
  ret <2 x i16> %sub
}

define <2 x i16> @not_subx16_u16x2_ri_(<2 x i16> %a) {
; CHECK-LABEL: not_subx16_u16x2_ri_:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx16hq $r0 = $r0, 0x10010
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i16> %a, <i16 4, i16 4>
  %sub = sub <2 x i16> <i16 16, i16 1>, %mul
  ret <2 x i16> %sub
}

define <2 x i16> @not_subx16_u16x2_ri_2(<2 x i16> %a) {
; CHECK-LABEL: not_subx16_u16x2_ri_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx16hq $r0 = $r0, 0xffff0000
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i16> %a, <i16 4, i16 4>
  %sub = sub <2 x i16> <i16 0, i16 -1>, %mul
  ret <2 x i16> %sub
}
define <4 x i16> @subx16_i16x4_ri_(<4 x i16> %a) {
; CHECK-LABEL: subx16_i16x4_ri_:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx16hq $r0 = $r0, 0x20001
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %a, <i16 4, i16 4, i16 4, i16 4>
  %sub = sub <4 x i16> <i16 1, i16 2, i16 0, i16 0>, %mul
  ret <4 x i16> %sub
}

define <4 x i16> @subx16_i16x4_ri_at(<4 x i16> %a) {
; CHECK-LABEL: subx16_i16x4_ri_at:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx16hq.@ $r0 = $r0, 0x20001
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %a, <i16 4, i16 4, i16 4, i16 4>
  %sub = sub <4 x i16> <i16 1, i16 2, i16 1, i16 2>, %mul
  ret <4 x i16> %sub
}

define <4 x i16> @subx16_i16x4_rr_2(<4 x i16> %a) {
; CHECK-LABEL: subx16_i16x4_rr_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 0x3000100020001
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sbfx16hq $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %a, <i16 4, i16 4, i16 4, i16 4>
  %sub = sub <4 x i16> <i16 1, i16 2, i16 1, i16 3>, %mul
  ret <4 x i16> %sub
}

define <4 x i16> @subx16_u16x4_ri_(<4 x i16> %a) {
; CHECK-LABEL: subx16_u16x4_ri_:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx16hq $r0 = $r0, 0x20001
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %a, <i16 4, i16 4, i16 4, i16 4>
  %sub = sub <4 x i16> <i16 1, i16 2, i16 0, i16 0>, %mul
  ret <4 x i16> %sub
}

define <4 x i16> @subx16_u16x4_ri_at(<4 x i16> %a) {
; CHECK-LABEL: subx16_u16x4_ri_at:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx16hq.@ $r0 = $r0, 0x20001
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %a, <i16 4, i16 4, i16 4, i16 4>
  %sub = sub <4 x i16> <i16 1, i16 2, i16 1, i16 2>, %mul
  ret <4 x i16> %sub
}

define <4 x i16> @subx16_u16x4_rr_2(<4 x i16> %a) {
; CHECK-LABEL: subx16_u16x4_rr_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 0x3000100020001
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sbfx16hq $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <4 x i16> %a, <i16 4, i16 4, i16 4, i16 4>
  %sub = sub <4 x i16> <i16 1, i16 2, i16 1, i16 3>, %mul
  ret <4 x i16> %sub
}

define <2 x i32> @subx16_i32x2_ri_(<2 x i32> %a) {
; CHECK-LABEL: subx16_i32x2_ri_:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx16wp $r0 = $r0, 1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %a, <i32 4, i32 4>
  %sub = sub <2 x i32> <i32 1, i32 0>, %mul
  ret <2 x i32> %sub
}

define <2 x i32> @subx16_i32x2_ri_at(<2 x i32> %a) {
; CHECK-LABEL: subx16_i32x2_ri_at:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx16wp.@ $r0 = $r0, 0x3
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %a, <i32 4, i32 4>
  %sub = sub <2 x i32> <i32 3, i32 3>, %mul
  ret <2 x i32> %sub
}

define <2 x i32> @subx16_i32x2_rr_2(<2 x i32> %a) {
; CHECK-LABEL: subx16_i32x2_rr_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 0x200000003
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sbfx16wp $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %a, <i32 4, i32 4>
  %sub = sub <2 x i32> <i32 3, i32 2>, %mul
  ret <2 x i32> %sub
}

define <2 x i32> @subx16_u32x2_ri_(<2 x i32> %a) {
; CHECK-LABEL: subx16_u32x2_ri_:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx16wp $r0 = $r0, 1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %a, <i32 4, i32 4>
  %sub = sub <2 x i32> <i32 1, i32 0>, %mul
  ret <2 x i32> %sub
}

define <2 x i32> @subx16_u32x2_ri_2(<2 x i32> %a) {
; CHECK-LABEL: subx16_u32x2_ri_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx16wp $r0 = $r0, 0xbeef
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %a, <i32 4, i32 4>
  %sub = sub <2 x i32> <i32 48879, i32 0>, %mul
  ret <2 x i32> %sub
}

define <2 x i32> @subx16_u32x2_ri_at(<2 x i32> %a) {
; CHECK-LABEL: subx16_u32x2_ri_at:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx16wp.@ $r0 = $r0, 0x3
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %a, <i32 4, i32 4>
  %sub = sub <2 x i32> <i32 3, i32 3>, %mul
  ret <2 x i32> %sub
}

define <2 x i32> @subx16_u32x2_ri_at_2(<2 x i32> %a) {
; CHECK-LABEL: subx16_u32x2_ri_at_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sbfx16wp.@ $r0 = $r0, 0xbb8
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %a, <i32 4, i32 4>
  %sub = sub <2 x i32> <i32 3000, i32 3000>, %mul
  ret <2 x i32> %sub
}

define <2 x i32> @subx16_u32x2_rr_2(<2 x i32> %a) {
; CHECK-LABEL: subx16_u32x2_rr_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 0x200000003
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sbfx16wp $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %mul = shl <2 x i32> %a, <i32 4, i32 4>
  %sub = sub <2 x i32> <i32 3, i32 2>, %mul
  ret <2 x i32> %sub
}
