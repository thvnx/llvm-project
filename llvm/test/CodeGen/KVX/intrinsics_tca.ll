; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s | FileCheck %s
target triple = "kvx-kalray-cos"

declare <256 x i1> @llvm.kvx.movetohi(<256 x i1>, i64, i64)
define void @test_movetohi(i64 %a, i64 %b, <256 x i1>* %p0, <256 x i1>* %p1) {
; CHECK-LABEL: test_movetohi:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    lv $a0 = 0[$r3]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lv $a1 = 0[$r2]
; CHECK-NEXT:    movetq $a0_hi = $r0, $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    movetq $a1_hi = $r1, $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r2] = $a1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r3] = $a0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %v0 = load <256 x i1>, <256 x i1>* %p0
  %v1 = load <256 x i1>, <256 x i1>* %p1
  %v2 = tail call <256 x i1> @llvm.kvx.movetohi(<256 x i1> %v1, i64 %a, i64 %b)
  %v3 = tail call <256 x i1> @llvm.kvx.movetohi(<256 x i1> %v0, i64 %b, i64 %a)
  store <256 x i1> %v3, <256 x i1>* %p0, align 32
  store <256 x i1> %v2, <256 x i1>* %p1, align 32
  ret void
}

declare <256 x i1> @llvm.kvx.movetolo(<256 x i1>, i64, i64)
define void @test_movetolo(i64 %a, i64 %b, <256 x i1>* %p0, <256 x i1>* %p1) {
; CHECK-LABEL: test_movetolo:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    lv $a0 = 0[$r3]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lv $a1 = 0[$r2]
; CHECK-NEXT:    movetq $a0_lo = $r0, $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    movetq $a1_lo = $r1, $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r2] = $a1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r3] = $a0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %v0 = load <256 x i1>, <256 x i1>* %p0
  %v1 = load <256 x i1>, <256 x i1>* %p1
  %v2 = tail call <256 x i1> @llvm.kvx.movetolo(<256 x i1> %v1, i64 %a, i64 %b)
  %v3 = tail call <256 x i1> @llvm.kvx.movetolo(<256 x i1> %v0, i64 %b, i64 %a)
  store <256 x i1> %v3, <256 x i1>* %p0, align 32
  store <256 x i1> %v2, <256 x i1>* %p1, align 32
  ret void
}

define void @test_movetohilo(i64 %a, i64 %b, i64 %c, i64 %d, <256 x i1>* %p0) {
; CHECK-LABEL: test_movetohilo:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movetq $a0_lo = $r0, $r1
; CHECK-NEXT:    movetq $a0_hi = $r2, $r3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r4] = $a0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %v1 = tail call <256 x i1> @llvm.kvx.movetolo(<256 x i1> undef, i64 %a, i64 %b)
  %v2 = tail call <256 x i1> @llvm.kvx.movetohi(<256 x i1> %v1, i64 %c, i64 %d)
  store <256 x i1> %v2, <256 x i1>* %p0, align 32
  ret void
}

declare <256 x i1> @llvm.kvx.moveto(i64, i64, i64, i64)
define void @test_moveto(i64 %a, i64 %b, i64 %c, i64 %d, <256 x i1>* %p0, <256 x i1>* %p1){
; CHECK-LABEL: test_moveto:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movetq $a0_lo = $r2, $r3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    movetq $a1_lo = $r1, $r0
; CHECK-NEXT:    movetq $a0_hi = $r0, $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    movetq $a1_hi = $r3, $r2
; CHECK-NEXT:    sv 0[$r4] = $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r5] = $a1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %v1 = tail call <256 x i1> @llvm.kvx.moveto( i64 %a, i64 %b, i64 %c, i64 %d)
  %v2 = tail call <256 x i1> @llvm.kvx.moveto( i64 %d, i64 %c, i64 %b, i64 %a)
  store <256 x i1> %v1, <256 x i1>* %p0, align 32
  store <256 x i1> %v2, <256 x i1>* %p1, align 32
  ret void
}

declare <256 x i1> @llvm.kvx.moveoto(<4 x i64>)
define void @test_moveoto(<4 x i64> %r, <256 x i1>* %p0){
; CHECK-LABEL: test_moveoto:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movetq $a0_lo = $r0, $r1
; CHECK-NEXT:    movetq $a0_hi = $r2, $r3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r4] = $a0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %v0 = tail call <256 x i1> @llvm.kvx.moveoto(<4 x i64> %r)
  store <256 x i1> %v0, <256 x i1>* %p0, align 32
  ret void
}

declare <4 x i64> @llvm.kvx.movefo(<256 x i1>)
define <4 x i64> @test_movefo(<256 x i1>* %p0){
; CHECK-LABEL: test_movefo:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lv $a0 = 0[$r0]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    movefo $r0r1r2r3 = $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %v0 = load <256 x i1>, <256 x i1>* %p0
  %v1 = tail call <4 x i64> @llvm.kvx.movefo(<256 x i1> %v0)
  ret <4 x i64> %v1
}

declare <4 x i64> @llvm.kvx.alignov(<256 x i1>, <256 x i1>, i64)
define <4 x i64> @test_alignovi(<256 x i1>* %p0, <256 x i1>* %p1){
; CHECK-LABEL: test_alignovi:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lv $a0 = 0[$r0]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lv $a1 = 0[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    aligno $r0r1r2r3 = $a0, $a1, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %v0 = load <256 x i1>, <256 x i1>* %p0
  %v1 = load <256 x i1>, <256 x i1>* %p1
  %v2 = tail call <4 x i64> @llvm.kvx.alignov(<256 x i1> %v0, <256 x i1> %v1, i64 16)
  ret <4 x i64> %v2
}

define <4 x i64> @test_alignovr(<256 x i1>* %p0, <256 x i1>* %p1, i64 %s){
; CHECK-LABEL: test_alignovr:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lv $a0 = 0[$r0]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lv $a1 = 0[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    aligno $r0r1r2r3 = $a0, $a1, $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %v0 = load <256 x i1>, <256 x i1>* %p0
  %v1 = load <256 x i1>, <256 x i1>* %p1
  %v2 = tail call <4 x i64> @llvm.kvx.alignov(<256 x i1> %v0, <256 x i1> %v1, i64 %s)
  ret <4 x i64> %v2
}

declare <256 x i1> @llvm.kvx.alignv(<256 x i1>, <256 x i1>, i64 immarg)
define void @test_alignvi(<256 x i1>* %p0, <256 x i1>* %p1){
; CHECK-LABEL: test_alignvi:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lv $a0 = 0[$r0]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lv $a1 = 0[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    alignv $a0 = $a0, $a1, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %v0 = load <256 x i1>, <256 x i1>* %p0
  %v1 = load <256 x i1>, <256 x i1>* %p1
  %v2 = tail call <256 x i1> @llvm.kvx.alignv(<256 x i1> %v0, <256 x i1> %v1, i64 16)
  store <256 x i1> %v2, <256 x i1>* %p0, align 32
  ret void
}

define void @test_alignvr(<256 x i1>* %p0, <256 x i1>* %p1, i64 %s){
; CHECK-LABEL: test_alignvr:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lv $a0 = 0[$r0]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lv $a1 = 0[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    alignv $a0 = $a0, $a1, $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %v0 = load <256 x i1>, <256 x i1>* %p0
  %v1 = load <256 x i1>, <256 x i1>* %p1
  %v2 = tail call <256 x i1> @llvm.kvx.alignv(<256 x i1> %v0, <256 x i1> %v1, i64 %s)
  store <256 x i1> %v2, <256 x i1>* %p0, align 32
  ret void
}

declare <256 x i1> @llvm.kvx.convdhv0(<256 x i1>, <1024 x i1>, i32, i32)
define void @test_convdhv0(<256 x i1>* %p0, <1024 x i1>* %p1){
; CHECK-LABEL: test_convdhv0:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lv $a0 = 0[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lv $a1 = 32[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lv $a2 = 64[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lv $a3 = 96[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    convdhv0.rhu.satu $a0_lo = $a0a1a2a3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %m0 = load <1024 x i1>, <1024 x i1>* %p1
  %v1 = tail call <256 x i1> @llvm.kvx.convdhv0(<256 x i1> undef, <1024 x i1> %m0, i32 4, i32 1)
  store <256 x i1> %v1, <256 x i1>* %p0, align 32
  ret void
}

declare <256 x i1> @llvm.kvx.convdhv1(<256 x i1>, <1024 x i1>, i32, i32)
define void @test_convdhv1(<256 x i1>* %p0, <1024 x i1>* %p1){
; CHECK-LABEL: test_convdhv1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lv $a0 = 0[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lv $a1 = 32[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lv $a2 = 64[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lv $a3 = 96[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    convdhv1.rz.satu $a0_hi = $a0a1a2a3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %m0 = load <1024 x i1>, <1024 x i1>* %p1
  %v1 = tail call <256 x i1> @llvm.kvx.convdhv1(<256 x i1> undef, <1024 x i1> %m0, i32 3, i32 1)
  store <256 x i1> %v1, <256 x i1>* %p0, align 32
  ret void
}

declare <256 x i1> @llvm.kvx.convdhv(<1024 x i1>, i32, i32)
define void @test_convdhv(<256 x i1>* %p0, <1024 x i1>* %p1){
; CHECK-LABEL: test_convdhv:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lv $a0 = 0[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lv $a1 = 32[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lv $a2 = 64[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lv $a3 = 96[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    convdhv0.rd.sat $a4_lo = $a0a1a2a3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    convdhv1.rd.sat $a4_hi = $a0a1a2a3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a4
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %m0 = load <1024 x i1>, <1024 x i1>* %p1
  %v1 = tail call <256 x i1> @llvm.kvx.convdhv(<1024 x i1> %m0, i32 2, i32 0)
  store <256 x i1> %v1, <256 x i1>* %p0, align 32
  ret void
}

declare <256 x i1> @llvm.kvx.convwbv0(<256 x i1>, <1024 x i1>, i32, i32)
define void @test_convwbv0(<256 x i1>* %p0){
; CHECK-LABEL: test_convwbv0:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lv $a0 = 0[$r0]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    convwbv0.rn.sat $a0_x = $a0a1a2a3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %v0 = load <256 x i1>, <256 x i1>* %p0
  %v1 = tail call <256 x i1> @llvm.kvx.convwbv0(<256 x i1> %v0, <1024 x i1> undef, i32 0, i32 0)
  store <256 x i1> %v1, <256 x i1>* %p0, align 32
  ret void
}

declare <256 x i1> @llvm.kvx.convwbv1(<256 x i1>, <1024 x i1>, i32, i32)
define void @test_convwbv1(<256 x i1>* %p0){
; CHECK-LABEL: test_convwbv1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lv $a0 = 0[$r0]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    convwbv1.ru.satu $a0_y = $a0a1a2a3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %v0 = load <256 x i1>, <256 x i1>* %p0
  %v1 = tail call <256 x i1> @llvm.kvx.convwbv1(<256 x i1> %v0, <1024 x i1> undef, i32 1, i32 1)
  store <256 x i1> %v1, <256 x i1>* %p0, align 32
  ret void
}

declare <256 x i1> @llvm.kvx.convwbv2(<256 x i1>, <1024 x i1>, i32, i32)
define void @test_convwbv2(<256 x i1>* %p0){
; CHECK-LABEL: test_convwbv2:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lv $a0 = 0[$r0]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    convwbv2.rd.sat $a0_z = $a0a1a2a3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %v0 = load <256 x i1>, <256 x i1>* %p0
  %v1 = tail call <256 x i1> @llvm.kvx.convwbv2(<256 x i1> %v0, <1024 x i1> undef, i32 2, i32 0)
  store <256 x i1> %v1, <256 x i1>* %p0, align 32
  ret void
}

declare <256 x i1> @llvm.kvx.convwbv3(<256 x i1>, <1024 x i1>, i32, i32)
define void @test_convwbv3(<256 x i1>* %p0){
; CHECK-LABEL: test_convwbv3:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lv $a0 = 0[$r0]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    convwbv3.rz.sat $a0_t = $a0a1a2a3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %v0 = load <256 x i1>, <256 x i1>* %p0
  %v1 = tail call <256 x i1> @llvm.kvx.convwbv3(<256 x i1> %v0, <1024 x i1> undef, i32 3, i32 0)
  store <256 x i1> %v1, <256 x i1>* %p0, align 32
  ret void
}

declare <256 x i1> @llvm.kvx.convwbv(<1024 x i1>, i32, i32)
define void @test_convwbv(<256 x i1>* %p0){
; CHECK-LABEL: test_convwbv:
; CHECK:       # %bb.0:
; CHECK-NEXT:    convwbv0.rhu.sat $a0_x = $a0a1a2a3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    convwbv1.rhu.sat $a0_y = $a0a1a2a3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    convwbv2.rhu.sat $a0_z = $a0a1a2a3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    convwbv3.rhu.sat $a0_t = $a0a1a2a3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %v1 = tail call <256 x i1> @llvm.kvx.convwbv(<1024 x i1> undef, i32 4, i32 0)
  store <256 x i1> %v1, <256 x i1>* %p0, align 32
  ret void
}

declare <256 x i1> @llvm.kvx.fmma242hw0(<256 x i1>, <512 x i1>, <256 x i1>, <256 x i1>)
define void @test_fmma242hw0(<256 x i1>* %p0){
; CHECK-LABEL: test_fmma242hw0:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lv $a0 = 0[$r0]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fmma242hw0 $a0_lo = $a0a1, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %v0 = load <256 x i1>, <256 x i1>* %p0
  %v1 = tail call <256 x i1> @llvm.kvx.fmma242hw0(<256 x i1> %v0, <512 x i1> undef, <256 x i1> undef, <256 x i1> undef)
  store <256 x i1> %v1, <256 x i1>* %p0, align 32
  ret void
}

declare <256 x i1> @llvm.kvx.fmma242hw1(<256 x i1>, <512 x i1>, <256 x i1>, <256 x i1>)
define void @test_fmma242hw1(<256 x i1>* %p0){
; CHECK-LABEL: test_fmma242hw1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lv $a0 = 0[$r0]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fmma242hw1 $a0_hi = $a0a1, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %v0 = load <256 x i1>, <256 x i1>* %p0
  %v1 = tail call <256 x i1> @llvm.kvx.fmma242hw1(<256 x i1> %v0, <512 x i1> undef, <256 x i1> undef, <256 x i1> undef)
  store <256 x i1> %v1, <256 x i1>* %p0, align 32
  ret void
}

declare <256 x i1> @llvm.kvx.fmma242hw2(<256 x i1>, <512 x i1>, <256 x i1>, <256 x i1>)
define void @test_fmma242hw2(<256 x i1>* %p0){
; CHECK-LABEL: test_fmma242hw2:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lv $a0 = 0[$r0]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fmma242hw2 $a0_lo = $a0a1, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %v0 = load <256 x i1>, <256 x i1>* %p0
  %v1 = tail call <256 x i1> @llvm.kvx.fmma242hw2(<256 x i1> %v0, <512 x i1> undef, <256 x i1> undef, <256 x i1> undef)
  store <256 x i1> %v1, <256 x i1>* %p0, align 32
  ret void
}

declare <256 x i1> @llvm.kvx.fmma242hw3(<256 x i1>, <512 x i1>, <256 x i1>, <256 x i1>)
define void @test_fmma242hw3(<256 x i1>* %p0){
; CHECK-LABEL: test_fmma242hw3:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lv $a0 = 0[$r0]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fmma242hw3 $a0_hi = $a0a1, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %v0 = load <256 x i1>, <256 x i1>* %p0
  %v1 = tail call <256 x i1> @llvm.kvx.fmma242hw3(<256 x i1> %v0, <512 x i1> undef, <256 x i1> undef, <256 x i1> undef)
  store <256 x i1> %v1, <256 x i1>* %p0, align 32
  ret void
}

declare <512 x i1> @llvm.kvx.fmma242hw(<512 x i1>, <256 x i1>, <256 x i1>)
define void @test_fmma242hw(<512 x i1>* %p0){
; CHECK-LABEL: test_fmma242hw:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fmma242hw2 $a1_lo = $a0a1, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fmma242hw3 $a1_hi = $a0a1, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fmma242hw0 $a0_lo = $a0a1, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fmma242hw1 $a0_hi = $a0a1, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 32[$r0] = $a1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %v1 = tail call <512 x i1> @llvm.kvx.fmma242hw(<512 x i1> undef, <256 x i1> undef, <256 x i1> undef)
  store <512 x i1> %v1, <512 x i1>* %p0, align 32
  ret void
}

declare <1024 x i1> @llvm.kvx.mma444hbd0(<1024 x i1>, <256 x i1>, <256 x i1>)
define void @test_mma444hbd0(<1024 x i1>* %p0){
; CHECK-LABEL: test_mma444hbd0:
; CHECK:       # %bb.0:
; CHECK-NEXT:    mma444hbd0 $a0a1a2a3 = $a0a1a2a3, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 32[$r0] = $a1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 64[$r0] = $a2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 96[$r0] = $a3
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %m1 = tail call <1024 x i1> @llvm.kvx.mma444hbd0(<1024 x i1> undef, <256 x i1> undef, <256 x i1> undef)
  store <1024 x i1> %m1, <1024 x i1>* %p0, align 32
  ret void
}

declare <1024 x i1> @llvm.kvx.mma444hbd1(<1024 x i1>, <256 x i1>, <256 x i1>)
define void @test_mma444hbd1(<1024 x i1>* %p0){
; CHECK-LABEL: test_mma444hbd1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    mma444hbd1 $a0a1a2a3 = $a0a1a2a3, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 32[$r0] = $a1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 64[$r0] = $a2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 96[$r0] = $a3
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %m1 = tail call <1024 x i1> @llvm.kvx.mma444hbd1(<1024 x i1> undef, <256 x i1> undef, <256 x i1> undef)
  store <1024 x i1> %m1, <1024 x i1>* %p0, align 32
  ret void
}

declare <1024 x i1> @llvm.kvx.mma444hd(<1024 x i1>, <256 x i1>, <256 x i1>)
define void @test_mma444hd(<1024 x i1>* %p0){
; CHECK-LABEL: test_mma444hd:
; CHECK:       # %bb.0:
; CHECK-NEXT:    mma444hd $a0a1a2a3 = $a0a1a2a3, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 32[$r0] = $a1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 64[$r0] = $a2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 96[$r0] = $a3
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %m1 = tail call <1024 x i1> @llvm.kvx.mma444hd(<1024 x i1> undef, <256 x i1> undef, <256 x i1> undef)
  store <1024 x i1> %m1, <1024 x i1>* %p0, align 32
  ret void
}

declare <1024 x i1> @llvm.kvx.mma444suhbd0(<1024 x i1>, <256 x i1>, <256 x i1>)
define void @test_mma444suhbd0(<1024 x i1>* %p0){
; CHECK-LABEL: test_mma444suhbd0:
; CHECK:       # %bb.0:
; CHECK-NEXT:    mma444suhbd0 $a0a1a2a3 = $a0a1a2a3, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 32[$r0] = $a1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 64[$r0] = $a2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 96[$r0] = $a3
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %m1 = tail call <1024 x i1> @llvm.kvx.mma444suhbd0(<1024 x i1> undef, <256 x i1> undef, <256 x i1> undef)
  store <1024 x i1> %m1, <1024 x i1>* %p0, align 32
  ret void
}

declare <1024 x i1> @llvm.kvx.mma444suhbd1(<1024 x i1>, <256 x i1>, <256 x i1>)
define void @test_mma444suhbd1(<1024 x i1>* %p0){
; CHECK-LABEL: test_mma444suhbd1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    mma444suhbd1 $a0a1a2a3 = $a0a1a2a3, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 32[$r0] = $a1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 64[$r0] = $a2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 96[$r0] = $a3
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %m1 = tail call <1024 x i1> @llvm.kvx.mma444suhbd1(<1024 x i1> undef, <256 x i1> undef, <256 x i1> undef)
  store <1024 x i1> %m1, <1024 x i1>* %p0, align 32
  ret void
}

declare <1024 x i1> @llvm.kvx.mma444suhd(<1024 x i1>, <256 x i1>, <256 x i1>)
define void @test_mma444suhd(<1024 x i1>* %p0){
; CHECK-LABEL: test_mma444suhd:
; CHECK:       # %bb.0:
; CHECK-NEXT:    mma444suhd $a0a1a2a3 = $a0a1a2a3, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 32[$r0] = $a1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 64[$r0] = $a2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 96[$r0] = $a3
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %m1 = tail call <1024 x i1> @llvm.kvx.mma444suhd(<1024 x i1> undef, <256 x i1> undef, <256 x i1> undef)
  store <1024 x i1> %m1, <1024 x i1>* %p0, align 32
  ret void
}

declare <1024 x i1> @llvm.kvx.mma444uhbd0(<1024 x i1>, <256 x i1>, <256 x i1>)
define void @test_mma444uhbd0(<1024 x i1>* %p0){
; CHECK-LABEL: test_mma444uhbd0:
; CHECK:       # %bb.0:
; CHECK-NEXT:    mma444uhbd0 $a0a1a2a3 = $a0a1a2a3, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 32[$r0] = $a1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 64[$r0] = $a2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 96[$r0] = $a3
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %m1 = tail call <1024 x i1> @llvm.kvx.mma444uhbd0(<1024 x i1> undef, <256 x i1> undef, <256 x i1> undef)
  store <1024 x i1> %m1, <1024 x i1>* %p0, align 32
  ret void
}

declare <1024 x i1> @llvm.kvx.mma444uhbd1(<1024 x i1>, <256 x i1>, <256 x i1>)
define void @test_mma444uhbd1(<1024 x i1>* %p0){
; CHECK-LABEL: test_mma444uhbd1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    mma444uhbd1 $a0a1a2a3 = $a0a1a2a3, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 32[$r0] = $a1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 64[$r0] = $a2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 96[$r0] = $a3
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %m1 = tail call <1024 x i1> @llvm.kvx.mma444uhbd1(<1024 x i1> undef, <256 x i1> undef, <256 x i1> undef)
  store <1024 x i1> %m1, <1024 x i1>* %p0, align 32
  ret void
}

declare <1024 x i1> @llvm.kvx.mma444uhd(<1024 x i1>, <256 x i1>, <256 x i1>)
define void @test_mma444uhd(<1024 x i1>* %p0){
; CHECK-LABEL: test_mma444uhd:
; CHECK:       # %bb.0:
; CHECK-NEXT:    mma444uhd $a0a1a2a3 = $a0a1a2a3, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 32[$r0] = $a1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 64[$r0] = $a2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 96[$r0] = $a3
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %m1 = tail call <1024 x i1> @llvm.kvx.mma444uhd(<1024 x i1> undef, <256 x i1> undef, <256 x i1> undef)
  store <1024 x i1> %m1, <1024 x i1>* %p0, align 32
  ret void
}

declare <1024 x i1> @llvm.kvx.mma444ushbd0(<1024 x i1>, <256 x i1>, <256 x i1>)
define void @test_mma444ushbd0(<1024 x i1>* %p0){
; CHECK-LABEL: test_mma444ushbd0:
; CHECK:       # %bb.0:
; CHECK-NEXT:    mma444ushbd0 $a0a1a2a3 = $a0a1a2a3, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 32[$r0] = $a1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 64[$r0] = $a2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 96[$r0] = $a3
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %m1 = tail call <1024 x i1> @llvm.kvx.mma444ushbd0(<1024 x i1> undef, <256 x i1> undef, <256 x i1> undef)
  store <1024 x i1> %m1, <1024 x i1>* %p0, align 32
  ret void
}

declare <1024 x i1> @llvm.kvx.mma444ushbd1(<1024 x i1>, <256 x i1>, <256 x i1>)
define void @test_mma444ushbd1(<1024 x i1>* %p0){
; CHECK-LABEL: test_mma444ushbd1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    mma444ushbd1 $a0a1a2a3 = $a0a1a2a3, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 32[$r0] = $a1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 64[$r0] = $a2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 96[$r0] = $a3
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %m1 = tail call <1024 x i1> @llvm.kvx.mma444ushbd1(<1024 x i1> undef, <256 x i1> undef, <256 x i1> undef)
  store <1024 x i1> %m1, <1024 x i1>* %p0, align 32
  ret void
}

declare <1024 x i1> @llvm.kvx.mma444ushd(<1024 x i1>, <256 x i1>, <256 x i1>)
define void @test_mma444ushd(<1024 x i1>* %p0){
; CHECK-LABEL: test_mma444ushd:
; CHECK:       # %bb.0:
; CHECK-NEXT:    mma444ushd $a0a1a2a3 = $a0a1a2a3, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 32[$r0] = $a1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 64[$r0] = $a2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 96[$r0] = $a3
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %m1 = tail call <1024 x i1> @llvm.kvx.mma444ushd(<1024 x i1> undef, <256 x i1> undef, <256 x i1> undef)
  store <1024 x i1> %m1, <1024 x i1>* %p0, align 32
  ret void
}

declare <512 x i1> @llvm.kvx.mma484bw(<512 x i1>, <256 x i1>, <256 x i1>)
define void @test_mma484bw(<512 x i1>* %p0){
; CHECK-LABEL: test_mma484bw:
; CHECK:       # %bb.0:
; CHECK-NEXT:    mma484bw $a0a1 = $a0a1, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 32[$r0] = $a1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %m1 = tail call <512 x i1> @llvm.kvx.mma484bw(<512 x i1> undef, <256 x i1> undef, <256 x i1> undef)
  store <512 x i1> %m1, <512 x i1>* %p0, align 32
  ret void
}

declare <512 x i1> @llvm.kvx.mma484subw(<512 x i1>, <256 x i1>, <256 x i1>)
define void @test_mma484subw(<512 x i1>* %p0){
; CHECK-LABEL: test_mma484subw:
; CHECK:       # %bb.0:
; CHECK-NEXT:    mma484subw $a0a1 = $a0a1, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 32[$r0] = $a1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %m1 = tail call <512 x i1> @llvm.kvx.mma484subw(<512 x i1> undef, <256 x i1> undef, <256 x i1> undef)
  store <512 x i1> %m1, <512 x i1>* %p0, align 32
  ret void
}

declare <512 x i1> @llvm.kvx.mma484ubw(<512 x i1>, <256 x i1>, <256 x i1>)
define void @test_mma484ubw(<512 x i1>* %p0){
; CHECK-LABEL: test_mma484ubw:
; CHECK:       # %bb.0:
; CHECK-NEXT:    mma484ubw $a0a1 = $a0a1, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 32[$r0] = $a1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %m1 = tail call <512 x i1> @llvm.kvx.mma484ubw(<512 x i1> undef, <256 x i1> undef, <256 x i1> undef)
  store <512 x i1> %m1, <512 x i1>* %p0, align 32
  ret void
}

declare <512 x i1> @llvm.kvx.mma484usbw(<512 x i1>, <256 x i1>, <256 x i1>)
define void @test_mma484usbw(<512 x i1>* %p0){
; CHECK-LABEL: test_mma484usbw:
; CHECK:       # %bb.0:
; CHECK-NEXT:    mma484usbw $a0a1 = $a0a1, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 32[$r0] = $a1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %m1 = tail call <512 x i1> @llvm.kvx.mma484usbw(<512 x i1> undef, <256 x i1> undef, <256 x i1> undef)
  store <512 x i1> %m1, <512 x i1>* %p0, align 32
  ret void
}

declare <1024 x i1> @llvm.kvx.mt44d(<1024 x i1>)
define void @test_mt44d(<1024 x i1>* %p0){
; CHECK-LABEL: test_mt44d:
; CHECK:       # %bb.0:
; CHECK-NEXT:    mt44d $a0a1a2a3 = $a0a1a2a3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 32[$r0] = $a1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 64[$r0] = $a2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 96[$r0] = $a3
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %m1 = tail call <1024 x i1> @llvm.kvx.mt44d(<1024 x i1> undef)
  store <1024 x i1> %m1, <1024 x i1>* %p0, align 32
  ret void
}

declare <256 x i1> @llvm.kvx.fscalewv(<256 x i1>, i32, i32, i32)
define void @test_fscalewv(<256 x i1>* %p0){
; CHECK-LABEL: test_fscalewv:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fscalewv.rn $a0 = $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %m1 = tail call <256 x i1> @llvm.kvx.fscalewv(<256 x i1> undef, i32 0, i32 0, i32 0)
  store <256 x i1> %m1, <256 x i1>* %p0, align 32
  ret void
}

declare <256 x i1> @llvm.kvx.fnarrowwhv(<512 x i1>, i32, i32)
define void @test_fnarrowwhv(<256 x i1>* %p0){
; CHECK-LABEL: test_fnarrowwhv:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fnarrowwhv.rn $a0 = $a0a1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r0] = $a0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %m1 = tail call <256 x i1> @llvm.kvx.fnarrowwhv(<512 x i1> undef, i32 0, i32 0)
  store <256 x i1> %m1, <256 x i1>* %p0, align 32
  ret void
}


declare <256 x i1> @llvm.kvx.lv.cond(<256 x i1>, i8*, i64, i32, i32)
declare <1024 x i1> @llvm.kvx.lvc(<1024 x i1>, i8*, i32, i32)
declare <1024 x i1> @llvm.kvx.lvc.cond(<1024 x i1>, i8*, i32, i64, i32, i32)
declare { <4 x i64>, <256 x i1> } @llvm.kvx.swapvo(<4 x i64>, <256 x i1>) #2
declare void @llvm.kvx.sv.cond(i8*, <256 x i1>, i64, i32) #3

; Test generated from clang's intrinsics_tca.c
define <4 x i64> @test_tca_builtins(i64 %a, i64 %b, i64 %c, i64 %d, <256 x i1>* %v, <512 x i1>* %w, <1024 x i1>* %m) {
; CHECK-LABEL: test_tca_builtins:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    lv $a0 = 0[$r4]
; CHECK-NEXT:    addd $r15 = $r4, 96
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lv $a0 = 0[$r4]
; CHECK-NEXT:    make $r1 = 4
; CHECK-NEXT:    make $r11 = 3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    movetq $a0_lo = $r11, $r1
; CHECK-NEXT:    make $r10 = 2
; CHECK-NEXT:    make $r9 = 1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    movetq $a0_hi = $r9, $r10
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r4] = $a0
; CHECK-NEXT:    make $r8 = 0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lv $a1 = 0[$r4]
; CHECK-NEXT:    copyd $r7 = $r0
; CHECK-NEXT:    movetq $a0_lo = $r8, $r9
; CHECK-NEXT:    movetq $a0_hi = $r10, $r11
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lv $a4 = 0[$r6]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lv $a5 = 32[$r6]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lv $a6 = 64[$r6]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lv $a7 = 96[$r6]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lv $a2 = 0[$r5]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lv $a3 = 32[$r5]
; CHECK-NEXT:    alignv $a1 = $a0, $a1, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    aligno $r0r1r2r3 = $a0, $a1, 1
; CHECK-NEXT:    convwbv0.ru.sat $a1_x = $a4a5a6a7
; CHECK-NEXT:    ;;
; CHECK-NEXT:    convwbv1.ru.sat $a1_y = $a4a5a6a7
; CHECK-NEXT:    ;;
; CHECK-NEXT:    convwbv2.ru.sat $a1_z = $a4a5a6a7
; CHECK-NEXT:    ;;
; CHECK-NEXT:    convwbv3.ru.sat $a1_t = $a4a5a6a7
; CHECK-NEXT:    ;;
; CHECK-NEXT:    mma444hbd0 $a4a5a6a7 = $a4a5a6a7, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fmma242hw2 $a9_lo = $a2a3, $a1, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    mma444hbd1 $a4a5a6a7 = $a4a5a6a7, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fmma242hw3 $a9_hi = $a2a3, $a1, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    mma444hd $a4a5a6a7 = $a4a5a6a7, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fmma242hw0 $a8_lo = $a2a3, $a1, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    mma444suhbd0 $a4a5a6a7 = $a4a5a6a7, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fmma242hw1 $a8_hi = $a2a3, $a1, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fscalewv $a1 = $a1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    mma484bw $a2a3 = $a8a9, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    mma484subw $a2a3 = $a2a3, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    mma484ubw $a2a3 = $a2a3, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    mma484usbw $a2a3 = $a2a3, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fnarrowwhv.rn.s $a8 = $a2a3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fscalewv.rna.relu $a1 = $a1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    mma444suhbd1 $a4a5a6a7 = $a4a5a6a7, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    mma444suhd $a4a5a6a7 = $a4a5a6a7, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    mma444uhbd0 $a4a5a6a7 = $a4a5a6a7, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    mma444uhbd1 $a4a5a6a7 = $a4a5a6a7, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    movefo $r0r1r2r3 = $a1
; CHECK-NEXT:    movetq $a1_lo = $r0, $r1
; CHECK-NEXT:    movetq $a1_hi = $r2, $r3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fscalewv.relu $a1 = $a1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    mma444uhd $a4a5a6a7 = $a4a5a6a7, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    mma444ushbd0 $a4a5a6a7 = $a4a5a6a7, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    mma444ushbd1 $a4a5a6a7 = $a4a5a6a7, $a0, $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    mma444ushd $a4a5a6a7 = $a4a5a6a7, $a0, $a0
; CHECK-NEXT:    lv.s.even $r7 ? $a1 = [$r15]
; CHECK-NEXT:    addd $r15 = $r4, 128
; CHECK-NEXT:    ;;
; CHECK-NEXT:    mt44d $a4a5a6a7 = $a4a5a6a7
; CHECK-NEXT:    lv.s $a0 = 0[$r4]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lv.c3.s $a4a5a6a7 = 0[$r15]
; CHECK-NEXT:    addd $r15 = $r4, 160
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lv.c2.odd $r7 ? $a4a5a6a7 = [$r15]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r4] = $a0
; CHECK-NEXT:    addd $r4 = $r4, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv.even $r9 ? [$r4] = $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r5] = $a2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 32[$r5] = $a3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 0[$r6] = $a4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 32[$r6] = $a5
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 64[$r6] = $a6
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 96[$r6] = $a7
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = load volatile <256 x i1>, <256 x i1>* %v, align 32
  %1 = call <256 x i1> @llvm.kvx.movetohi(<256 x i1> %0, i64 0, i64 1)
  %2 = load volatile <256 x i1>, <256 x i1>* %v, align 32
  %3 = call <256 x i1> @llvm.kvx.movetolo(<256 x i1> %2, i64 3, i64 2)
  %4 = call <256 x i1> @llvm.kvx.moveto(i64 1, i64 2, i64 3, i64 4)
  store volatile <256 x i1> %4, <256 x i1>* %v, align 32
  %5 = call <256 x i1> @llvm.kvx.moveoto(<4 x i64> <i64 0, i64 1, i64 2, i64 3>)
  %6 = load volatile <256 x i1>, <256 x i1>* %v, align 32
  %7 = call <256 x i1> @llvm.kvx.alignv(<256 x i1> %5, <256 x i1> %6, i64 16)
  %8 = call <4 x i64> @llvm.kvx.alignov(<256 x i1> %5, <256 x i1> %7, i64 1)
  %9 = load volatile <1024 x i1>, <1024 x i1>* %m, align 128
  %10 = call <256 x i1> @llvm.kvx.convdhv0(<256 x i1> %5, <1024 x i1> %9, i32 0, i32 0)
  %11 = call <256 x i1> @llvm.kvx.convdhv1(<256 x i1> %5, <1024 x i1> %9, i32 1, i32 1)
  %12 = call <256 x i1> @llvm.kvx.convdhv(<1024 x i1> %9, i32 4, i32 0)
  %13 = call <256 x i1> @llvm.kvx.convwbv0(<256 x i1> %12, <1024 x i1> %9, i32 1, i32 0)
  %14 = call <256 x i1> @llvm.kvx.convwbv1(<256 x i1> %12, <1024 x i1> %9, i32 2, i32 1)
  %15 = call <256 x i1> @llvm.kvx.convwbv2(<256 x i1> %12, <1024 x i1> %9, i32 3, i32 0)
  %16 = call <256 x i1> @llvm.kvx.convwbv3(<256 x i1> %12, <1024 x i1> %9, i32 4, i32 1)
  %17 = load volatile <512 x i1>, <512 x i1>* %w, align 64
  %18 = call <256 x i1> @llvm.kvx.convwbv(<1024 x i1> %9, i32 1, i32 0)
  %19 = call <256 x i1> @llvm.kvx.fmma242hw0(<256 x i1> %5, <512 x i1> %17, <256 x i1> %5, <256 x i1> %18)
  %20 = call <256 x i1> @llvm.kvx.fmma242hw1(<256 x i1> %18, <512 x i1> %17, <256 x i1> %5, <256 x i1> %18)
  %21 = call <256 x i1> @llvm.kvx.fmma242hw2(<256 x i1> %5, <512 x i1> %17, <256 x i1> %5, <256 x i1> %18)
  %22 = call <256 x i1> @llvm.kvx.fmma242hw3(<256 x i1> %18, <512 x i1> %17, <256 x i1> %5, <256 x i1> %18)
  %23 = call <512 x i1> @llvm.kvx.fmma242hw(<512 x i1> %17, <256 x i1> %18, <256 x i1> %5)
  %24 = call <1024 x i1> @llvm.kvx.mma444hbd0(<1024 x i1> %9, <256 x i1> %5, <256 x i1> %5)
  %25 = call <1024 x i1> @llvm.kvx.mma444hbd1(<1024 x i1> %24, <256 x i1> %5, <256 x i1> %5)
  %26 = call <1024 x i1> @llvm.kvx.mma444hd(<1024 x i1> %25, <256 x i1> %5, <256 x i1> %5)
  %27 = call <1024 x i1> @llvm.kvx.mma444suhbd0(<1024 x i1> %26, <256 x i1> %5, <256 x i1> %5)
  %28 = call <1024 x i1> @llvm.kvx.mma444suhbd1(<1024 x i1> %27, <256 x i1> %5, <256 x i1> %5)
  %29 = call <1024 x i1> @llvm.kvx.mma444suhd(<1024 x i1> %28, <256 x i1> %5, <256 x i1> %5)
  %30 = call <1024 x i1> @llvm.kvx.mma444uhbd0(<1024 x i1> %29, <256 x i1> %5, <256 x i1> %5)
  %31 = call <1024 x i1> @llvm.kvx.mma444uhbd1(<1024 x i1> %30, <256 x i1> %5, <256 x i1> %5)
  %32 = call <1024 x i1> @llvm.kvx.mma444uhd(<1024 x i1> %31, <256 x i1> %5, <256 x i1> %5)
  %33 = call <1024 x i1> @llvm.kvx.mma444ushbd0(<1024 x i1> %32, <256 x i1> %5, <256 x i1> %5)
  %34 = call <1024 x i1> @llvm.kvx.mma444ushbd1(<1024 x i1> %33, <256 x i1> %5, <256 x i1> %5)
  %35 = call <1024 x i1> @llvm.kvx.mma444ushd(<1024 x i1> %34, <256 x i1> %5, <256 x i1> %5)
  %36 = call <512 x i1> @llvm.kvx.mma484bw(<512 x i1> %23, <256 x i1> %5, <256 x i1> %5)
  %37 = call <512 x i1> @llvm.kvx.mma484subw(<512 x i1> %36, <256 x i1> %5, <256 x i1> %5)
  %38 = call <512 x i1> @llvm.kvx.mma484ubw(<512 x i1> %37, <256 x i1> %5, <256 x i1> %5)
  %39 = call <512 x i1> @llvm.kvx.mma484usbw(<512 x i1> %38, <256 x i1> %5, <256 x i1> %5)
  %40 = call <1024 x i1> @llvm.kvx.mt44d(<1024 x i1> %35)
  %41 = call <256 x i1> @llvm.kvx.fscalewv(<256 x i1> %18, i32 7, i32 0, i32 0)
  %42 = call <256 x i1> @llvm.kvx.fnarrowwhv(<512 x i1> %39, i32 0, i32 1)
  %43 = call <256 x i1> @llvm.kvx.fscalewv(<256 x i1> %41, i32 4, i32 0, i32 1)
  %44 = call { <4 x i64>, <256 x i1> } @llvm.kvx.swapvo(<4 x i64> %8, <256 x i1> %43)
  %45 = extractvalue { <4 x i64>, <256 x i1> } %44, 0
  %46 = extractvalue { <4 x i64>, <256 x i1> } %44, 1
  %47 = call <256 x i1> @llvm.kvx.fscalewv(<256 x i1> %46, i32 7, i32 0, i32 1)
  %arrayidx6 = getelementptr inbounds <256 x i1>, <256 x i1>* %v, i64 3
  %48 = bitcast <256 x i1>* %arrayidx6 to i8*
  %49 = call <256 x i1> @llvm.kvx.lv.cond(<256 x i1> %47, i8* nonnull %48, i64 %a, i32 1, i32 7)
  %50 = addrspacecast <256 x i1>* %v to <256 x i1> addrspace(258)*
  %51 = load <256 x i1>, <256 x i1> addrspace(258)* %50, align 32
  %arrayidx7 = getelementptr inbounds <256 x i1>, <256 x i1>* %v, i64 4
  %52 = bitcast <256 x i1>* %arrayidx7 to i8*
  %53 = call <1024 x i1> @llvm.kvx.lvc(<1024 x i1> %40, i8* nonnull %52, i32 3, i32 1)
  %arrayidx8 = getelementptr inbounds <256 x i1>, <256 x i1>* %v, i64 5
  %54 = bitcast <256 x i1>* %arrayidx8 to i8*
  %55 = call <1024 x i1> @llvm.kvx.lvc.cond(<1024 x i1> %53, i8* nonnull %54, i32 2, i64 %a, i32 0, i32 6)
  store <256 x i1> %51, <256 x i1>* %v, align 32
  %arrayidx10 = getelementptr inbounds <256 x i1>, <256 x i1>* %v, i64 1
  %56 = bitcast <256 x i1>* %arrayidx10 to i8*
  call void @llvm.kvx.sv.cond(i8* nonnull %56, <256 x i1> %51, i64 1, i32 7)
  store volatile <512 x i1> %39, <512 x i1>* %w, align 64
  store volatile <1024 x i1> %55, <1024 x i1>* %m, align 128
  ret <4 x i64> %45
}
