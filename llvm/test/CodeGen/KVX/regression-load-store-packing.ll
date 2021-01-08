; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -O3 --disable-debug-info-print --disable-kvx-loadstore-packing=false -o - %s | FileCheck %s
target triple = "kvx-kalray-cos"

@x = common global i64* null, align 8

define void @f(i64* %v) #0 {
; CHECK-LABEL: f:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    addd $r12 = $r12, -96
; CHECK-NEXT:    get $r16 = $ra
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sd 72[$r12] = $r16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    so 40[$r12] = $r24r25r26r27
; CHECK-NEXT:    ;;
; CHECK-NEXT:    so 8[$r12] = $r20r21r22r23
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sd 0[$r12] = $r18
; CHECK-NEXT:    copyd $r18 = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lo $r20r21r22r23 = 0[$r18]
; CHECK-NEXT:    call g
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lo $r24r25r26r27 = 32[$r18]
; CHECK-NEXT:    copyd $r0 = $r18
; CHECK-NEXT:    call g
; CHECK-NEXT:    ;;
; CHECK-NEXT:    make $r0 = x
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ld $r0 = 0[$r0]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    so 0[$r0] = $r20r21r22r23
; CHECK-NEXT:    ;;
; CHECK-NEXT:    so 32[$r0] = $r24r25r26r27
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ld $r18 = 0[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lo $r20r21r22r23 = 8[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lo $r24r25r26r27 = 40[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ld $r16 = 72[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    set $ra = $r16
; CHECK-NEXT:    addd $r12 = $r12, 96
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %0 = load i64, i64* %v, align 8
  %arrayidx2 = getelementptr inbounds i64, i64* %v, i64 1
  %1 = load i64, i64* %arrayidx2, align 8
  %arrayidx4 = getelementptr inbounds i64, i64* %v, i64 2
  %2 = load i64, i64* %arrayidx4, align 8
  %arrayidx6 = getelementptr inbounds i64, i64* %v, i64 3
  %3 = load i64, i64* %arrayidx6, align 8
  tail call void @g(i64* nonnull %v)
  %arrayidx8 = getelementptr inbounds i64, i64* %v, i64 4
  %4 = load i64, i64* %arrayidx8, align 8
  %arrayidx10 = getelementptr inbounds i64, i64* %v, i64 5
  %5 = load i64, i64* %arrayidx10, align 8
  %arrayidx12 = getelementptr inbounds i64, i64* %v, i64 6
  %6 = load i64, i64* %arrayidx12, align 8
  %arrayidx14 = getelementptr inbounds i64, i64* %v, i64 7
  %7 = load i64, i64* %arrayidx14, align 8
  tail call void @g(i64* nonnull %v)
  %8 = load i64*, i64** @x, align 8
  store i64 %0, i64* %8, align 8
  %arrayidx19 = getelementptr inbounds i64, i64* %8, i64 1
  store i64 %1, i64* %arrayidx19, align 8
  %arrayidx21 = getelementptr inbounds i64, i64* %8, i64 2
  store i64 %2, i64* %arrayidx21, align 8
  %arrayidx23 = getelementptr inbounds i64, i64* %8, i64 3
  store i64 %3, i64* %arrayidx23, align 8
  %arrayidx25 = getelementptr inbounds i64, i64* %8, i64 4
  store i64 %4, i64* %arrayidx25, align 8
  %arrayidx27 = getelementptr inbounds i64, i64* %8, i64 5
  store i64 %5, i64* %arrayidx27, align 8
  %arrayidx29 = getelementptr inbounds i64, i64* %8, i64 6
  store i64 %6, i64* %arrayidx29, align 8
  %arrayidx31 = getelementptr inbounds i64, i64* %8, i64 7
  store i64 %7, i64* %arrayidx31, align 8
  ret void
}

declare void @g(i64*)
attributes #0 = { nounwind }
