; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -O2 -o - %s | FileCheck %s
target triple = "kvx-kalray-cos"

define half @mul_f16_f16(half %0, half %1) {
; CHECK-LABEL: mul_f16_f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    zxhd $r1 = $r1
; CHECK-NEXT:    zxhd $r0 = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fmulhq $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %3 = fmul half %0, %1
  ret half %3
}

define <2 x half> @mul_v2f16_v2f16(<2 x half> %0, <2 x half> %1) {
; CHECK-LABEL: mul_v2f16_v2f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    zxwd $r1 = $r1
; CHECK-NEXT:    zxwd $r0 = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fmulhq $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %3 = fmul <2 x half> %0, %1
  ret <2 x half> %3
}

define <4 x half> @mul_v4f16_v4f16(<4 x half> %0, <4 x half> %1) {
; CHECK-LABEL: mul_v4f16_v4f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fmulhq $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %3 = fmul <4 x half> %0, %1
  ret <4 x half> %3
}


define float @mul_f32_f32(float %0, float %1) {
; CHECK-LABEL: mul_f32_f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fmulw $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %3 = fmul float %0, %1
  ret float %3
}

define <2 x float> @mul_v2f32_v2f32(<2 x float> %0, <2 x float> %1) {
; CHECK-LABEL: mul_v2f32_v2f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fmulwp $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %3 = fmul <2 x float> %0, %1
  ret <2 x float> %3
}

define <4 x float> @mul_v4f32_v4f32(<4 x float> %0, <4 x float> %1) {
; CHECK-LABEL: mul_v4f32_v4f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fmulwp $r0 = $r0, $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fmulwp $r1 = $r1, $r3
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %3 = fmul <4 x float> %0, %1
  ret <4 x float> %3
}


define double @mul_f64_f64(double %0, double %1) {
; CHECK-LABEL: mul_f64_f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fmuld $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %3 = fmul double %0, %1
  ret double %3
}

define <2 x double> @mul_v2f64_v2f64(<2 x double> %0, <2 x double> %1) {
; CHECK-LABEL: mul_v2f64_v2f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fmuld $r5 = $r1, $r3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fmuld $r4 = $r0, $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r4
; CHECK-NEXT:    copyd $r1 = $r5
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %3 = fmul <2 x double> %0, %1
  ret <2 x double> %3
}

define <4 x double> @mul_v4f64_v4f64(<4 x double> %0, <4 x double> %1) {
; CHECK-LABEL: mul_v4f64_v4f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fmuld $r9 = $r1, $r5
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fmuld $r8 = $r0, $r4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fmuld $r10 = $r2, $r6
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fmuld $r11 = $r3, $r7
; CHECK-NEXT:    copyd $r0 = $r8
; CHECK-NEXT:    copyd $r1 = $r9
; CHECK-NEXT:    copyd $r2 = $r10
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r3 = $r11
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %3 = fmul <4 x double> %0, %1
  ret <4 x double> %3
}
