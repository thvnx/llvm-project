; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=kvx-kalray-cos | FileCheck %s

define float @remf32(float %x, float %y) {
; CHECK-LABEL: remf32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addd $r12 = $r12, -32
; CHECK-NEXT:    get $r16 = $ra
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 32
; CHECK-NEXT:    sd 0[$r12] = $r16
; CHECK-NEXT:    call fmodf
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
  %tmp = frem float %x, %y
  ret float %tmp
}

define double @remf64(double %x, double %y) {
; CHECK-LABEL: remf64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addd $r12 = $r12, -32
; CHECK-NEXT:    get $r16 = $ra
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 32
; CHECK-NEXT:    sd 0[$r12] = $r16
; CHECK-NEXT:    call fmod
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
  %tmp = frem double %x, %y
  ret double %tmp
}

define <2 x float> @remv2f32(<2 x float> %x, <2 x float> %y) {
; CHECK-LABEL: remv2f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addd $r12 = $r12, -32
; CHECK-NEXT:    get $r16 = $ra
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 32
; CHECK-NEXT:    sd 24[$r12] = $r16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_offset 67, -8
; CHECK-NEXT:    sd 16[$r12] = $r20
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_offset 20, -16
; CHECK-NEXT:    sq 0[$r12] = $r18r19
; CHECK-NEXT:    copyd $r18 = $r1
; CHECK-NEXT:    copyd $r19 = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_offset 19, -24
; CHECK-NEXT:    .cfi_offset 18, -32
; CHECK-NEXT:    srad $r0 = $r19, 32
; CHECK-NEXT:    srad $r1 = $r18, 32
; CHECK-NEXT:    call fmodf
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r20 = $r0
; CHECK-NEXT:    copyd $r0 = $r19
; CHECK-NEXT:    copyd $r1 = $r18
; CHECK-NEXT:    call fmodf
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r20, 63, 32
; CHECK-NEXT:    lq $r18r19 = 0[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ld $r20 = 16[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ld $r16 = 24[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    set $ra = $r16
; CHECK-NEXT:    addd $r12 = $r12, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %tmp = frem <2 x float> %x, %y
  ret <2 x float> %tmp
}

define <2 x double> @remv2f64(<2 x double> %x, <2 x double> %y) {
; CHECK-LABEL: remv2f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addd $r12 = $r12, -64
; CHECK-NEXT:    get $r16 = $ra
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 64
; CHECK-NEXT:    sd 32[$r12] = $r16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_offset 67, -32
; CHECK-NEXT:    sq 16[$r12] = $r20r21
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_offset 21, -40
; CHECK-NEXT:    .cfi_offset 20, -48
; CHECK-NEXT:    sq 0[$r12] = $r18r19
; CHECK-NEXT:    copyd $r18 = $r2
; CHECK-NEXT:    copyd $r19 = $r0
; CHECK-NEXT:    copyd $r0 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_offset 19, -56
; CHECK-NEXT:    .cfi_offset 18, -64
; CHECK-NEXT:    copyd $r1 = $r3
; CHECK-NEXT:    call fmod
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r21 = $r0
; CHECK-NEXT:    copyd $r0 = $r19
; CHECK-NEXT:    copyd $r1 = $r18
; CHECK-NEXT:    call fmod
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r20 = $r0
; CHECK-NEXT:    copyd $r1 = $r21
; CHECK-NEXT:    lq $r18r19 = 0[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lq $r20r21 = 16[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ld $r16 = 32[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    set $ra = $r16
; CHECK-NEXT:    addd $r12 = $r12, 64
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %tmp = frem <2 x double> %x, %y
  ret <2 x double> %tmp
}
