; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -o - %s | FileCheck %s
target triple = "kvx-kalray-cos"

declare half @llvm.maxnum.f16(half, half)

define half @fmaxh(half %a, half %b) {
; CHECK-LABEL: fmaxh:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addd $r12 = $r12, -32
; CHECK-NEXT:    get $r16 = $ra
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 32
; CHECK-NEXT:    sd 0[$r12] = $r16
; CHECK-NEXT:    fwidenlhw $r0 = $r0
; CHECK-NEXT:    fwidenlhw $r1 = $r1
; CHECK-NEXT:    call fmaxf
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_offset 67, -32
; CHECK-NEXT:    ld $r16 = 0[$r12]
; CHECK-NEXT:    fnarrowwh $r0 = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    set $ra = $r16
; CHECK-NEXT:    addd $r12 = $r12, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %res = call half @llvm.maxnum.f16(half %a, half %b)
  ret half %res
}

define half @fmaxh_fast(half %a, half %b) {
; CHECK-LABEL: fmaxh_fast:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fmaxhq $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %res = call fast half @llvm.maxnum.f16(half %a, half %b)
  ret half %res
}

define float @fmaxw(float %a, float %b) {
; CHECK-LABEL: fmaxw:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addd $r12 = $r12, -32
; CHECK-NEXT:    get $r16 = $ra
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 32
; CHECK-NEXT:    sd 0[$r12] = $r16
; CHECK-NEXT:    call fmaxf
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_offset 67, -32
; CHECK-NEXT:    ld $r16 = 0[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    set $ra = $r16
; CHECK-NEXT:    addd $r12 = $r12, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %res = call float @llvm.maxnum.f32(float %a, float %b)
  ret float %res
}

define float @fmaxw_fast(float %a, float %b) {
; CHECK-LABEL: fmaxw_fast:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fmaxw $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %res = call fast float @llvm.maxnum.f32(float %a, float %b)
  ret float %res
}

declare float @llvm.maxnum.f32(float, float)

define double @fmaxd(double %a, double %b) {
; CHECK-LABEL: fmaxd:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addd $r12 = $r12, -32
; CHECK-NEXT:    get $r16 = $ra
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 32
; CHECK-NEXT:    sd 0[$r12] = $r16
; CHECK-NEXT:    call fmax
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_offset 67, -32
; CHECK-NEXT:    ld $r16 = 0[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    set $ra = $r16
; CHECK-NEXT:    addd $r12 = $r12, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %res = call double @llvm.maxnum.f64(double %a, double %b)
  ret double %res
}

define double @fmaxd_fast(double %a, double %b) {
; CHECK-LABEL: fmaxd_fast:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fmaxd $r0 = $r0, $r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %res = call fast double @llvm.maxnum.f64(double %a, double %b)
  ret double %res
}

declare double @llvm.maxnum.f64(double, double)
