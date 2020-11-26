; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -O3 -o - %s | FileCheck %s
; Check the correct order of the swapvo
; TODO: Remove unecessary sv/lv
target triple = "kvx-kalray-cos"

@.str = private constant [44 x i8] c"{ %ld, %ld, %ld, %ld } == { 0, 1, 2, 3 } ?\0A\00"
@.str.1 = private constant [44 x i8] c"{ %ld, %ld, %ld, %ld } == { 1, 2, 3, 4 } ?\0A\00"

define i32 @main() {
; CHECK-LABEL: main:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    addd $r12 = $r12, -64
; CHECK-NEXT:    get $r16 = $ra
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 64
; CHECK-NEXT:    sd 0[$r12] = $r16
; CHECK-NEXT:    make $r4 = 0
; CHECK-NEXT:    make $r5 = 1
; CHECK-NEXT:    make $r6 = 2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_offset 67, -64
; CHECK-NEXT:    make $r7 = 3
; CHECK-NEXT:    copyd $r0 = $r5
; CHECK-NEXT:    copyd $r1 = $r6
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r2 = $r7
; CHECK-NEXT:    make $r3 = 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    movefo $r0r1r2r3 = $a0
; CHECK-NEXT:    movetq $a0_lo = $r0, $r1
; CHECK-NEXT:    movetq $a0_hi = $r2, $r3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sv 32[$r12] = $a0
; CHECK-NEXT:    copyd $r1 = $r4
; CHECK-NEXT:    copyd $r2 = $r5
; CHECK-NEXT:    copyd $r3 = $r6
; CHECK-NEXT:    ;;
; CHECK-NEXT:    make $r0 = .L.str
; CHECK-NEXT:    copyd $r4 = $r7
; CHECK-NEXT:    call printf
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lv $a0 = 32[$r12]
; CHECK-NEXT:    make $r0 = .L.str.1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    movefo $r4r5r6r7 = $a0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r1 = $r4
; CHECK-NEXT:    copyd $r2 = $r5
; CHECK-NEXT:    copyd $r3 = $r6
; CHECK-NEXT:    copyd $r4 = $r7
; CHECK-NEXT:    call printf
; CHECK-NEXT:    ;;
; CHECK-NEXT:    make $r0 = 0
; CHECK-NEXT:    ld $r16 = 0[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    set $ra = $r16
; CHECK-NEXT:    addd $r12 = $r12, 64
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = tail call <256 x i1> @llvm.kvx.moveoto(<4 x i64> <i64 0, i64 1, i64 2, i64 3>)
  %1 = tail call { <4 x i64>, <256 x i1> } @llvm.kvx.swapvo(<4 x i64> <i64 1, i64 2, i64 3, i64 4>, <256 x i1> undef)
  %2 = extractvalue { <4 x i64>, <256 x i1> } %1, 1
  %3 = tail call <4 x i64> @llvm.kvx.movefo(<256 x i1> %0)
  %vecext = extractelement <4 x i64> %3, i32 0
  %vecext1 = extractelement <4 x i64> %3, i32 1
  %vecext2 = extractelement <4 x i64> %3, i32 2
  %vecext3 = extractelement <4 x i64> %3, i32 3
  %call = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i64 0, i64 0), i64 %vecext, i64 %vecext1, i64 %vecext2, i64 %vecext3)
  %4 = tail call <4 x i64> @llvm.kvx.movefo(<256 x i1> %2)
  %vecext4 = extractelement <4 x i64> %4, i32 0
  %vecext5 = extractelement <4 x i64> %4, i32 1
  %vecext6 = extractelement <4 x i64> %4, i32 2
  %vecext7 = extractelement <4 x i64> %4, i32 3
  %call8 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([44 x i8], [44 x i8]* @.str.1, i64 0, i64 0), i64 %vecext4, i64 %vecext5, i64 %vecext6, i64 %vecext7)
  ret i32 0
}
declare <256 x i1> @llvm.kvx.moveoto(<4 x i64>)
declare { <4 x i64>, <256 x i1> } @llvm.kvx.swapvo(<4 x i64>, <256 x i1>)
declare <4 x i64> @llvm.kvx.movefo(<256 x i1>)
declare i32 @printf(i8* nocapture readonly, ...)
