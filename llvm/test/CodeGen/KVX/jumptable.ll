; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -O2 -o - %s | FileCheck %s
target triple = "kvx-kalray-cos"

define dso_local void @f(i32* nocapture %x, i32 %state) local_unnamed_addr #0 {
; CHECK-LABEL: f:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    compw.gtu $r2 = $r1, 8
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.odd $r2 ? .LBB0_11
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.1: # %entry
; CHECK-NEXT:    zxwd $r1 = $r1
; CHECK-NEXT:    make $r2 = .LJTI0_0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ld.xs $r2 = $r1[$r2]
; CHECK-NEXT:    make $r1 = 1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    igoto $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_2: # %sw.bb1
; CHECK-NEXT:    addd $r0 = $r0, 4
; CHECK-NEXT:    make $r1 = 2
; CHECK-NEXT:    goto .LBB0_10
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_3: # %sw.bb3
; CHECK-NEXT:    addd $r0 = $r0, 8
; CHECK-NEXT:    make $r1 = 3
; CHECK-NEXT:    goto .LBB0_10
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_4: # %sw.bb6
; CHECK-NEXT:    addd $r0 = $r0, 12
; CHECK-NEXT:    make $r1 = 4
; CHECK-NEXT:    goto .LBB0_10
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_5: # %sw.bb9
; CHECK-NEXT:    addd $r0 = $r0, 16
; CHECK-NEXT:    make $r1 = 5
; CHECK-NEXT:    goto .LBB0_10
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_6: # %sw.bb12
; CHECK-NEXT:    addd $r0 = $r0, 20
; CHECK-NEXT:    make $r1 = 6
; CHECK-NEXT:    goto .LBB0_10
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_7: # %sw.bb15
; CHECK-NEXT:    addd $r0 = $r0, 24
; CHECK-NEXT:    make $r1 = 7
; CHECK-NEXT:    goto .LBB0_10
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_8: # %sw.bb18
; CHECK-NEXT:    addd $r0 = $r0, 28
; CHECK-NEXT:    make $r1 = 8
; CHECK-NEXT:    goto .LBB0_10
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_9: # %sw.bb21
; CHECK-NEXT:    addd $r0 = $r0, 32
; CHECK-NEXT:    make $r1 = 9
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_10: # %sw.epilog.sink.split
; CHECK-NEXT:    lwz $r2 = 0[$r0]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addw $r1 = $r2, $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw 0[$r0] = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_11: # %sw.epilog
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  switch i32 %state, label %sw.epilog [
    i32 0, label %sw.epilog.sink.split
    i32 1, label %sw.bb1
    i32 2, label %sw.bb3
    i32 3, label %sw.bb6
    i32 4, label %sw.bb9
    i32 5, label %sw.bb12
    i32 6, label %sw.bb15
    i32 7, label %sw.bb18
    i32 8, label %sw.bb21
  ]

sw.bb1:                                           ; preds = %entry
  %arrayidx2 = getelementptr inbounds i32, i32* %x, i64 1
  br label %sw.epilog.sink.split

sw.bb3:                                           ; preds = %entry
  %arrayidx4 = getelementptr inbounds i32, i32* %x, i64 2
  br label %sw.epilog.sink.split

sw.bb6:                                           ; preds = %entry
  %arrayidx7 = getelementptr inbounds i32, i32* %x, i64 3
  br label %sw.epilog.sink.split

sw.bb9:                                           ; preds = %entry
  %arrayidx10 = getelementptr inbounds i32, i32* %x, i64 4
  br label %sw.epilog.sink.split

sw.bb12:                                          ; preds = %entry
  %arrayidx13 = getelementptr inbounds i32, i32* %x, i64 5
  br label %sw.epilog.sink.split

sw.bb15:                                          ; preds = %entry
  %arrayidx16 = getelementptr inbounds i32, i32* %x, i64 6
  br label %sw.epilog.sink.split

sw.bb18:                                          ; preds = %entry
  %arrayidx19 = getelementptr inbounds i32, i32* %x, i64 7
  br label %sw.epilog.sink.split

sw.bb21:                                          ; preds = %entry
  %arrayidx22 = getelementptr inbounds i32, i32* %x, i64 8
  br label %sw.epilog.sink.split

sw.epilog.sink.split:                             ; preds = %entry, %sw.bb1, %sw.bb3, %sw.bb6, %sw.bb9, %sw.bb12, %sw.bb15, %sw.bb18, %sw.bb21
  %arrayidx22.sink33 = phi i32* [ %arrayidx22, %sw.bb21 ], [ %arrayidx19, %sw.bb18 ], [ %arrayidx16, %sw.bb15 ], [ %arrayidx13, %sw.bb12 ], [ %arrayidx10, %sw.bb9 ], [ %arrayidx7, %sw.bb6 ], [ %arrayidx4, %sw.bb3 ], [ %arrayidx2, %sw.bb1 ], [ %x, %entry ]
  %.sink32 = phi i32 [ 9, %sw.bb21 ], [ 8, %sw.bb18 ], [ 7, %sw.bb15 ], [ 6, %sw.bb12 ], [ 5, %sw.bb9 ], [ 4, %sw.bb6 ], [ 3, %sw.bb3 ], [ 2, %sw.bb1 ], [ 1, %entry ]
  %0 = load i32, i32* %arrayidx22.sink33, align 4, !tbaa !2
  %add23 = add nsw i32 %0, %.sink32
  store i32 %add23, i32* %arrayidx22.sink33, align 4, !tbaa !2
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.epilog.sink.split, %entry
  ret void
}

attributes #0 = { nofree norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"Kalray clang version 10.0.1 (git:software/tools/llvm-project 413660a1a7a7a2ef431d0d906778c974f42d70d8)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
