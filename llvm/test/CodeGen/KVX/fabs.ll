; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=kvx-kalray-cos | FileCheck %s

define float @fabsf32(float %x) {
; CHECK-LABEL: fabsf32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fabsw $r0 = $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %tmp = call float @llvm.fabs.f32(float %x)
  ret float %tmp
}

define double @fabsf64(double %x) {
; CHECK-LABEL: fabsf64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fabsd $r0 = $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %tmp = call double @llvm.fabs.f64(double %x)
  ret double %tmp
}

define <2 x float> @fabsv2f32(<2 x float> %x) {
; CHECK-LABEL: fabsv2f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fabswp $r0 = $r0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %tmp = call <2 x float> @llvm.fabs.v2f32(<2 x float> %x)
  ret <2 x float> %tmp
}

define <2 x double> @fabsv2f64(<2 x double> %x) {
; CHECK-LABEL: fabsv2f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fabsd $r2 = $r0
; CHECK-NEXT:    fabsd $r3 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r2
; CHECK-NEXT:    copyd $r1 = $r3
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %tmp = call <2 x double> @llvm.fabs.v2f64(<2 x double> %x)
  ret <2 x double> %tmp
}

declare float @llvm.fabs.f32(float)
declare double @llvm.fabs.f64(double)
declare <2x float> @llvm.fabs.v2f32(<2 x float>)
declare <2x double> @llvm.fabs.v2f64(<2 x double>)
