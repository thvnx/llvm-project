; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -O1 -o - %s | FileCheck %s
target triple = "kvx-kalray-cos"

define <2 x i8> @bchar2(i8 %a) {
; CHECK-LABEL: bchar2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r1, 15, 8
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit1 = insertelement <2 x i8> <i8 undef, i8 4>, i8 %a, i32 0
  ret <2 x i8> %vecinit1
}

define <2 x i8> @bchar2_2(i8 %a) {
; CHECK-LABEL: bchar2_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r1 = $r0, 15, 8
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit = insertelement <2 x i8> <i8 4, i8 undef>, i8 %a, i32 1
  ret <2 x i8> %vecinit
}

define <2 x i16> @bshort2(i16 %a) {
; CHECK-LABEL: bshort2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r1, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit1 = insertelement <2 x i16> <i16 undef, i16 4>, i16 %a, i32 0
  ret <2 x i16> %vecinit1
}

define <2 x i16> @bshort2_2(i16 %a) {
; CHECK-LABEL: bshort2_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r1 = $r0, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit = insertelement <2 x i16> <i16 4, i16 undef>, i16 %a, i32 1
  ret <2 x i16> %vecinit
}

define <2 x i32> @bint2(i32 %a) {
; CHECK-LABEL: bint2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r1, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit1 = insertelement <2 x i32> <i32 undef, i32 4>, i32 %a, i32 0
  ret <2 x i32> %vecinit1
}

define <2 x i32> @bint2_2(i32 %a) {
; CHECK-LABEL: bint2_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r1 = $r0, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit = insertelement <2 x i32> <i32 4, i32 undef>, i32 %a, i32 1
  ret <2 x i32> %vecinit
}

define <2 x i64> @blong2(i64 %a) {
; CHECK-LABEL: blong2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit1 = insertelement <2 x i64> <i64 undef, i64 4>, i64 %a, i32 0
  ret <2 x i64> %vecinit1
}

define <2 x i64> @blong2_2(i64 %a) {
; CHECK-LABEL: blong2_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r2 = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r1 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit = insertelement <2 x i64> <i64 4, i64 undef>, i64 %a, i32 1
  ret <2 x i64> %vecinit
}

define <4 x i8> @bchar4_0(i8 %a, i8 %b, i8 %c) {
; CHECK-LABEL: bchar4_0:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r2 = $r3, 15, 8
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r1, 15, 8
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r2, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = insertelement <4 x i8> <i8 undef, i8 undef, i8 undef, i8 4>, i8 %a, i32 0
  %1 = insertelement <4 x i8> %0, i8 %b, i32 1
  %vecinit3 = insertelement <4 x i8> %1, i8 %c, i32 2
  ret <4 x i8> %vecinit3
}

define <4 x i8> @bchar4_1(i8 %a, i8 %b, i8 %c) {
; CHECK-LABEL: bchar4_1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r3 = $r2, 15, 8
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r1, 15, 8
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r3, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = insertelement <4 x i8> <i8 undef, i8 undef, i8 4, i8 undef>, i8 %a, i32 0
  %vecinit2 = insertelement <4 x i8> %0, i8 %b, i32 1
  %vecinit3 = insertelement <4 x i8> %vecinit2, i8 %c, i32 3
  ret <4 x i8> %vecinit3
}

define <4 x i8> @bchar4_2(i8 %a, i8 %b, i8 %c) {
; CHECK-LABEL: bchar4_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r1 = $r2, 15, 8
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r3, 15, 8
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r1, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit1 = insertelement <4 x i8> <i8 undef, i8 4, i8 undef, i8 undef>, i8 %a, i32 0
  %vecinit2 = insertelement <4 x i8> %vecinit1, i8 %b, i32 2
  %vecinit3 = insertelement <4 x i8> %vecinit2, i8 %c, i32 3
  ret <4 x i8> %vecinit3
}

define <4 x i8> @bchar4_3(i8 %a, i8 %b, i8 %c) {
; CHECK-LABEL: bchar4_3:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r1 = $r2, 15, 8
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r3 = $r0, 15, 8
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r3 = $r1, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit = insertelement <4 x i8> <i8 4, i8 undef, i8 undef, i8 undef>, i8 %a, i32 1
  %vecinit1 = insertelement <4 x i8> %vecinit, i8 %b, i32 2
  %vecinit2 = insertelement <4 x i8> %vecinit1, i8 %c, i32 3
  ret <4 x i8> %vecinit2
}

define <4 x i8> @bchar4_4(i8 %a, i8 %b) {
; CHECK-LABEL: bchar4_4:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r2 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r1 = $r2, 15, 8
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r2 = $r0, 15, 8
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r2 = $r1, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = insertelement <4 x i8> <i8 4, i8 undef, i8 undef, i8 4>, i8 %a, i32 1
  %vecinit2 = insertelement <4 x i8> %0, i8 %b, i32 2
  ret <4 x i8> %vecinit2
}

define <4 x i8> @bchar4_5(i8 %a, i8 %b) {
; CHECK-LABEL: bchar4_5:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r2 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r1, 15, 8
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r2 = $r2, 15, 8
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r2 = $r0, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit = insertelement <4 x i8> <i8 4, i8 4, i8 undef, i8 undef>, i8 %a, i32 2
  %vecinit1 = insertelement <4 x i8> %vecinit, i8 %b, i32 3
  ret <4 x i8> %vecinit1
}

define <4 x i8> @bchar4_6(i8 %a, i8 %b) {
; CHECK-LABEL: bchar4_6:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r2 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r1, 15, 8
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r2 = $r2, 15, 8
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r2, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = insertelement <4 x i8> <i8 undef, i8 undef, i8 4, i8 4>, i8 %a, i32 0
  %vecinit3 = insertelement <4 x i8> %0, i8 %b, i32 1
  ret <4 x i8> %vecinit3
}

define <4 x i16> @bshort4_0(i16 %a, i16 %b, i16 %c) {
; CHECK-LABEL: bshort4_0:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r2 = $r3, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r1, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r2, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = insertelement <4 x i16> <i16 undef, i16 undef, i16 undef, i16 4>, i16 %a, i32 0
  %1 = insertelement <4 x i16> %0, i16 %b, i32 1
  %vecinit3 = insertelement <4 x i16> %1, i16 %c, i32 2
  ret <4 x i16> %vecinit3
}

define <4 x i16> @bshort4_1(i16 %a, i16 %b, i16 %c) {
; CHECK-LABEL: bshort4_1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r3 = $r2, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r1, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r3, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = insertelement <4 x i16> <i16 undef, i16 undef, i16 4, i16 undef>, i16 %a, i32 0
  %vecinit2 = insertelement <4 x i16> %0, i16 %b, i32 1
  %vecinit3 = insertelement <4 x i16> %vecinit2, i16 %c, i32 3
  ret <4 x i16> %vecinit3
}

define <4 x i16> @bshort4_2(i16 %a, i16 %b, i16 %c) {
; CHECK-LABEL: bshort4_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r1 = $r2, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r3, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r1, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit1 = insertelement <4 x i16> <i16 undef, i16 4, i16 undef, i16 undef>, i16 %a, i32 0
  %vecinit2 = insertelement <4 x i16> %vecinit1, i16 %b, i32 2
  %vecinit3 = insertelement <4 x i16> %vecinit2, i16 %c, i32 3
  ret <4 x i16> %vecinit3
}

define <4 x i16> @bshort4_3(i16 %a, i16 %b, i16 %c) {
; CHECK-LABEL: bshort4_3:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r1 = $r2, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r3 = $r0, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r3 = $r1, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit = insertelement <4 x i16> <i16 4, i16 undef, i16 undef, i16 undef>, i16 %a, i32 1
  %vecinit1 = insertelement <4 x i16> %vecinit, i16 %b, i32 2
  %vecinit2 = insertelement <4 x i16> %vecinit1, i16 %c, i32 3
  ret <4 x i16> %vecinit2
}

define <4 x i16> @bshort4_4(i16 %a, i16 %b) {
; CHECK-LABEL: bshort4_4:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r2 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r1 = $r2, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r2 = $r0, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r2 = $r1, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = insertelement <4 x i16> <i16 4, i16 undef, i16 undef, i16 4>, i16 %a, i32 1
  %vecinit2 = insertelement <4 x i16> %0, i16 %b, i32 2
  ret <4 x i16> %vecinit2
}

define <4 x i16> @bshort4_5(i16 %a, i16 %b) {
; CHECK-LABEL: bshort4_5:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r2 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r1, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r2 = $r2, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r2 = $r0, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit = insertelement <4 x i16> <i16 4, i16 4, i16 undef, i16 undef>, i16 %a, i32 2
  %vecinit1 = insertelement <4 x i16> %vecinit, i16 %b, i32 3
  ret <4 x i16> %vecinit1
}

define <4 x i16> @bshort4_6(i16 %a, i16 %b) {
; CHECK-LABEL: bshort4_6:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r2 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r1, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r2 = $r2, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r2, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = insertelement <4 x i16> <i16 undef, i16 undef, i16 4, i16 4>, i16 %a, i32 0
  %vecinit3 = insertelement <4 x i16> %0, i16 %b, i32 1
  ret <4 x i16> %vecinit3
}

define <4 x i32> @bint4_0(i32 %a, i32 %b, i32 %c) {
; CHECK-LABEL: bint4_0:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r1, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r2 = $r3, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r1 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = insertelement <4 x i32> <i32 undef, i32 undef, i32 undef, i32 4>, i32 %a, i32 0
  %1 = insertelement <4 x i32> %0, i32 %b, i32 1
  %vecinit3 = insertelement <4 x i32> %1, i32 %c, i32 2
  ret <4 x i32> %vecinit3
}

define <4 x i32> @bint4_1(i32 %a, i32 %b, i32 %c) {
; CHECK-LABEL: bint4_1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r1, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r3 = $r2, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r1 = $r3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = insertelement <4 x i32> <i32 undef, i32 undef, i32 4, i32 undef>, i32 %a, i32 0
  %vecinit2 = insertelement <4 x i32> %0, i32 %b, i32 1
  %vecinit3 = insertelement <4 x i32> %vecinit2, i32 %c, i32 3
  ret <4 x i32> %vecinit3
}

define <4 x i32> @bint4_2(i32 %a, i32 %b, i32 %c) {
; CHECK-LABEL: bint4_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r3, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r1 = $r2, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit1 = insertelement <4 x i32> <i32 undef, i32 4, i32 undef, i32 undef>, i32 %a, i32 0
  %vecinit2 = insertelement <4 x i32> %vecinit1, i32 %b, i32 2
  %vecinit3 = insertelement <4 x i32> %vecinit2, i32 %c, i32 3
  ret <4 x i32> %vecinit3
}

define <4 x i32> @bint4_3(i32 %a, i32 %b, i32 %c) {
; CHECK-LABEL: bint4_3:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r3 = $r0, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r1 = $r2, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit = insertelement <4 x i32> <i32 4, i32 undef, i32 undef, i32 undef>, i32 %a, i32 1
  %vecinit1 = insertelement <4 x i32> %vecinit, i32 %b, i32 2
  %vecinit2 = insertelement <4 x i32> %vecinit1, i32 %c, i32 3
  ret <4 x i32> %vecinit2
}

define <4 x i32> @bint4_4(i32 %a, i32 %b) {
; CHECK-LABEL: bint4_4:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r2 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r1 = $r2, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r2 = $r0, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = insertelement <4 x i32> <i32 4, i32 undef, i32 undef, i32 4>, i32 %a, i32 1
  %vecinit2 = insertelement <4 x i32> %0, i32 %b, i32 2
  ret <4 x i32> %vecinit2
}

define <4 x i32> @bint4_5(i32 %a, i32 %b) {
; CHECK-LABEL: bint4_5:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    copyd $r2 = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r2 = $r1, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    make $r0 = 0x400000004
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r1 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit = insertelement <4 x i32> <i32 4, i32 4, i32 undef, i32 undef>, i32 %a, i32 2
  %vecinit1 = insertelement <4 x i32> %vecinit, i32 %b, i32 3
  ret <4 x i32> %vecinit1
}

define <4 x i32> @bint4_6(i32 %a, i32 %b) {
; CHECK-LABEL: bint4_6:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    insf $r0 = $r1, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    make $r1 = 0x400000004
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = insertelement <4 x i32> <i32 undef, i32 undef, i32 4, i32 4>, i32 %a, i32 0
  %vecinit3 = insertelement <4 x i32> %0, i32 %b, i32 1
  ret <4 x i32> %vecinit3
}

define <4 x i64> @blong4_0(i64 %a, i64 %b, i64 %c) {
; CHECK-LABEL: blong4_0:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = insertelement <4 x i64> <i64 undef, i64 undef, i64 undef, i64 4>, i64 %a, i32 0
  %1 = insertelement <4 x i64> %0, i64 %b, i32 1
  %vecinit3 = insertelement <4 x i64> %1, i64 %c, i32 2
  ret <4 x i64> %vecinit3
}

define <4 x i64> @blong4_1(i64 %a, i64 %b, i64 %c) {
; CHECK-LABEL: blong4_1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r4 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r2 = $r3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r3 = $r4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = insertelement <4 x i64> <i64 undef, i64 undef, i64 4, i64 undef>, i64 %a, i32 0
  %vecinit2 = insertelement <4 x i64> %0, i64 %b, i32 1
  %vecinit3 = insertelement <4 x i64> %vecinit2, i64 %c, i32 3
  ret <4 x i64> %vecinit3
}

define <4 x i64> @blong4_2(i64 %a, i64 %b, i64 %c) {
; CHECK-LABEL: blong4_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r4 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r2 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r1 = $r3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r3 = $r4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit1 = insertelement <4 x i64> <i64 undef, i64 4, i64 undef, i64 undef>, i64 %a, i32 0
  %vecinit2 = insertelement <4 x i64> %vecinit1, i64 %b, i32 2
  %vecinit3 = insertelement <4 x i64> %vecinit2, i64 %c, i32 3
  ret <4 x i64> %vecinit3
}

define <4 x i64> @blong4_3(i64 %a, i64 %b, i64 %c) {
; CHECK-LABEL: blong4_3:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r4 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r2 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r1 = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r3 = $r4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit = insertelement <4 x i64> <i64 4, i64 undef, i64 undef, i64 undef>, i64 %a, i32 1
  %vecinit1 = insertelement <4 x i64> %vecinit, i64 %b, i32 2
  %vecinit2 = insertelement <4 x i64> %vecinit1, i64 %c, i32 3
  ret <4 x i64> %vecinit2
}

define <4 x i64> @blong4_4(i64 %a, i64 %b) {
; CHECK-LABEL: blong4_4:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r2 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r1 = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = insertelement <4 x i64> <i64 4, i64 undef, i64 undef, i64 4>, i64 %a, i32 1
  %vecinit2 = insertelement <4 x i64> %0, i64 %b, i32 2
  ret <4 x i64> %vecinit2
}

define <4 x i64> @blong4_5(i64 %a, i64 %b) {
; CHECK-LABEL: blong4_5:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r2 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r3 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r4 = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r1 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r2 = $r4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit = insertelement <4 x i64> <i64 4, i64 4, i64 undef, i64 undef>, i64 %a, i32 2
  %vecinit1 = insertelement <4 x i64> %vecinit, i64 %b, i32 3
  ret <4 x i64> %vecinit1
}

define <4 x i64> @blong4_6(i64 %a, i64 %b) {
; CHECK-LABEL: blong4_6:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r2 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r3 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = insertelement <4 x i64> <i64 undef, i64 undef, i64 4, i64 4>, i64 %a, i32 0
  %vecinit3 = insertelement <4 x i64> %0, i64 %b, i32 1
  ret <4 x i64> %vecinit3
}

define <2 x half> @bhalf2(half %a) {
; CHECK-LABEL: bhalf2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 0x4400
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r1, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit1 = insertelement <2 x half> <half undef, half 0xH4400>, half %a, i32 0
  ret <2 x half> %vecinit1
}

define <2 x half> @bhalf2_2(half %a) {
; CHECK-LABEL: bhalf2_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 0x4400
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r1 = $r0, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit = insertelement <2 x half> <half 0xH4400, half undef>, half %a, i32 1
  ret <2 x half> %vecinit
}

define <2 x float> @bfloat2(float %a) {
; CHECK-LABEL: bfloat2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 0x40800000
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r1, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit1 = insertelement <2 x float> <float undef, float 4.000000e+00>, float %a, i32 0
  ret <2 x float> %vecinit1
}

define <2 x float> @bfloat2_2(float %a) {
; CHECK-LABEL: bfloat2_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 0x40800000
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r1 = $r0, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit = insertelement <2 x float> <float 4.000000e+00, float undef>, float %a, i32 1
  ret <2 x float> %vecinit
}

define <2 x double> @bdouble2(double %a) {
; CHECK-LABEL: bdouble2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 0x4010000000000000
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit1 = insertelement <2 x double> <double undef, double 4.000000e+00>, double %a, i32 0
  ret <2 x double> %vecinit1
}

define <2 x double> @bdouble2_2(double %a) {
; CHECK-LABEL: bdouble2_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 0x4010000000000000
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r2 = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r1 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit = insertelement <2 x double> <double 4.000000e+00, double undef>, double %a, i32 1
  ret <2 x double> %vecinit
}

define <4 x half> @bhalf4_0(half %a, half %b, half %c) {
; CHECK-LABEL: bhalf4_0:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 0x4400
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r2 = $r3, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r1, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r2, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = insertelement <4 x half> <half undef, half undef, half undef, half 0xH4400>, half %a, i32 0
  %1 = insertelement <4 x half> %0, half %b, i32 1
  %vecinit3 = insertelement <4 x half> %1, half %c, i32 2
  ret <4 x half> %vecinit3
}

define <4 x half> @bhalf4_1(half %a, half %b, half %c) {
; CHECK-LABEL: bhalf4_1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 0x4400
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r3 = $r2, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r1, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r3, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = insertelement <4 x half> <half undef, half undef, half 0xH4400, half undef>, half %a, i32 0
  %vecinit2 = insertelement <4 x half> %0, half %b, i32 1
  %vecinit3 = insertelement <4 x half> %vecinit2, half %c, i32 3
  ret <4 x half> %vecinit3
}

define <4 x half> @bhalf4_2(half %a, half %b, half %c) {
; CHECK-LABEL: bhalf4_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 0x4400
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r1 = $r2, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r3, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r1, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit1 = insertelement <4 x half> <half undef, half 0xH4400, half undef, half undef>, half %a, i32 0
  %vecinit2 = insertelement <4 x half> %vecinit1, half %b, i32 2
  %vecinit3 = insertelement <4 x half> %vecinit2, half %c, i32 3
  ret <4 x half> %vecinit3
}

define <4 x half> @bhalf4_3(half %a, half %b, half %c) {
; CHECK-LABEL: bhalf4_3:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 0x4400
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r1 = $r2, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r3 = $r0, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r3 = $r1, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit = insertelement <4 x half> <half 0xH4400, half undef, half undef, half undef>, half %a, i32 1
  %vecinit1 = insertelement <4 x half> %vecinit, half %b, i32 2
  %vecinit2 = insertelement <4 x half> %vecinit1, half %c, i32 3
  ret <4 x half> %vecinit2
}

define <4 x half> @bhalf4_4(half %a, half %b) {
; CHECK-LABEL: bhalf4_4:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r2 = 0x4400
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r1 = $r2, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r2 = $r0, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r2 = $r1, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = insertelement <4 x half> <half 0xH4400, half undef, half undef, half 0xH4400>, half %a, i32 1
  %vecinit2 = insertelement <4 x half> %0, half %b, i32 2
  ret <4 x half> %vecinit2
}

define <4 x half> @bhalf4_5(half %a, half %b) {
; CHECK-LABEL: bhalf4_5:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r2 = 0x4400
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r1, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r2 = $r2, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r2 = $r0, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit = insertelement <4 x half> <half 0xH4400, half 0xH4400, half undef, half undef>, half %a, i32 2
  %vecinit1 = insertelement <4 x half> %vecinit, half %b, i32 3
  ret <4 x half> %vecinit1
}

define <4 x half> @bhalf4_6(half %a, half %b) {
; CHECK-LABEL: bhalf4_6:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r2 = 0x4400
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r1, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r2 = $r2, 31, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r2, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = insertelement <4 x half> <half undef, half undef, half 0xH4400, half 0xH4400>, half %a, i32 0
  %vecinit3 = insertelement <4 x half> %0, half %b, i32 1
  ret <4 x half> %vecinit3
}

define <4 x float> @bfloat4_0(float %a, float %b, float %c) {
; CHECK-LABEL: bfloat4_0:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 0x40800000
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r1, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r2 = $r3, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r1 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = insertelement <4 x float> <float undef, float undef, float undef, float 4.000000e+00>, float %a, i32 0
  %1 = insertelement <4 x float> %0, float %b, i32 1
  %vecinit3 = insertelement <4 x float> %1, float %c, i32 2
  ret <4 x float> %vecinit3
}

define <4 x float> @bfloat4_1(float %a, float %b, float %c) {
; CHECK-LABEL: bfloat4_1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 0x40800000
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r1, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r3 = $r2, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r1 = $r3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = insertelement <4 x float> <float undef, float undef, float 4.000000e+00, float undef>, float %a, i32 0
  %vecinit2 = insertelement <4 x float> %0, float %b, i32 1
  %vecinit3 = insertelement <4 x float> %vecinit2, float %c, i32 3
  ret <4 x float> %vecinit3
}

define <4 x float> @bfloat4_2(float %a, float %b, float %c) {
; CHECK-LABEL: bfloat4_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 0x40800000
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r0 = $r3, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r1 = $r2, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit1 = insertelement <4 x float> <float undef, float 4.000000e+00, float undef, float undef>, float %a, i32 0
  %vecinit2 = insertelement <4 x float> %vecinit1, float %b, i32 2
  %vecinit3 = insertelement <4 x float> %vecinit2, float %c, i32 3
  ret <4 x float> %vecinit3
}

define <4 x float> @bfloat4_3(float %a, float %b, float %c) {
; CHECK-LABEL: bfloat4_3:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 0x40800000
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r3 = $r0, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r1 = $r2, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit = insertelement <4 x float> <float 4.000000e+00, float undef, float undef, float undef>, float %a, i32 1
  %vecinit1 = insertelement <4 x float> %vecinit, float %b, i32 2
  %vecinit2 = insertelement <4 x float> %vecinit1, float %c, i32 3
  ret <4 x float> %vecinit2
}

define <4 x float> @bfloat4_4(float %a, float %b) {
; CHECK-LABEL: bfloat4_4:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r2 = 0x40800000
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r1 = $r2, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r2 = $r0, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = insertelement <4 x float> <float 4.000000e+00, float undef, float undef, float 4.000000e+00>, float %a, i32 1
  %vecinit2 = insertelement <4 x float> %0, float %b, i32 2
  ret <4 x float> %vecinit2
}

define <4 x float> @bfloat4_5(float %a, float %b) {
; CHECK-LABEL: bfloat4_5:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    copyd $r2 = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    insf $r2 = $r1, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    make $r0 = 0x4080000040800000
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r1 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit = insertelement <4 x float> <float 4.000000e+00, float 4.000000e+00, float undef, float undef>, float %a, i32 2
  %vecinit1 = insertelement <4 x float> %vecinit, float %b, i32 3
  ret <4 x float> %vecinit1
}

define <4 x float> @bfloat4_6(float %a, float %b) {
; CHECK-LABEL: bfloat4_6:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    insf $r0 = $r1, 63, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    make $r1 = 0x4080000040800000
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = insertelement <4 x float> <float undef, float undef, float 4.000000e+00, float 4.000000e+00>, float %a, i32 0
  %vecinit3 = insertelement <4 x float> %0, float %b, i32 1
  ret <4 x float> %vecinit3
}

define <4 x double> @bdouble4_0(double %a, double %b, double %c) {
; CHECK-LABEL: bdouble4_0:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 0x4010000000000000
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = insertelement <4 x double> <double undef, double undef, double undef, double 4.000000e+00>, double %a, i32 0
  %1 = insertelement <4 x double> %0, double %b, i32 1
  %vecinit3 = insertelement <4 x double> %1, double %c, i32 2
  ret <4 x double> %vecinit3
}

define <4 x double> @bdouble4_1(double %a, double %b, double %c) {
; CHECK-LABEL: bdouble4_1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 0x4010000000000000
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r4 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r2 = $r3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r3 = $r4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = insertelement <4 x double> <double undef, double undef, double 4.000000e+00, double undef>, double %a, i32 0
  %vecinit2 = insertelement <4 x double> %0, double %b, i32 1
  %vecinit3 = insertelement <4 x double> %vecinit2, double %c, i32 3
  ret <4 x double> %vecinit3
}

define <4 x double> @bdouble4_2(double %a, double %b, double %c) {
; CHECK-LABEL: bdouble4_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 0x4010000000000000
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r4 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r2 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r1 = $r3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r3 = $r4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit1 = insertelement <4 x double> <double undef, double 4.000000e+00, double undef, double undef>, double %a, i32 0
  %vecinit2 = insertelement <4 x double> %vecinit1, double %b, i32 2
  %vecinit3 = insertelement <4 x double> %vecinit2, double %c, i32 3
  ret <4 x double> %vecinit3
}

define <4 x double> @bdouble4_3(double %a, double %b, double %c) {
; CHECK-LABEL: bdouble4_3:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 0x4010000000000000
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r4 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r2 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r1 = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r3 = $r4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit = insertelement <4 x double> <double 4.000000e+00, double undef, double undef, double undef>, double %a, i32 1
  %vecinit1 = insertelement <4 x double> %vecinit, double %b, i32 2
  %vecinit2 = insertelement <4 x double> %vecinit1, double %c, i32 3
  ret <4 x double> %vecinit2
}

define <4 x double> @bdouble4_4(double %a, double %b) {
; CHECK-LABEL: bdouble4_4:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r3 = 0x4010000000000000
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r2 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r1 = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = insertelement <4 x double> <double 4.000000e+00, double undef, double undef, double 4.000000e+00>, double %a, i32 1
  %vecinit2 = insertelement <4 x double> %0, double %b, i32 2
  ret <4 x double> %vecinit2
}

define <4 x double> @bdouble4_5(double %a, double %b) {
; CHECK-LABEL: bdouble4_5:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r2 = 0x4010000000000000
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r3 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r4 = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r1 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r2 = $r4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %vecinit = insertelement <4 x double> <double 4.000000e+00, double 4.000000e+00, double undef, double undef>, double %a, i32 2
  %vecinit1 = insertelement <4 x double> %vecinit, double %b, i32 3
  ret <4 x double> %vecinit1
}

define <4 x double> @bdouble4_6(double %a, double %b) {
; CHECK-LABEL: bdouble4_6:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r2 = 0x4010000000000000
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r3 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = insertelement <4 x double> <double undef, double undef, double 4.000000e+00, double 4.000000e+00>, double %a, i32 0
  %vecinit3 = insertelement <4 x double> %0, double %b, i32 1
  ret <4 x double> %vecinit3
}
