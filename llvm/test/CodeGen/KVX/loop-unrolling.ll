; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -disable-kvx-hwloops < %s -O3 | FileCheck %s
target triple = "kvx-kalray-cos"

define void @loop_unrolling(i32* nocapture %t){
; CHECK-LABEL: loop_unrolling:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    addd $r0 = $r0, 16
; CHECK-NEXT:    make $r1 = 0
; CHECK-NEXT:    make $r2 = 0
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_1: # %for.body
; CHECK-NEXT:    # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ord $r3 = $r1, 1
; CHECK-NEXT:    ord $r4 = $r1, 2
; CHECK-NEXT:    ord $r5 = $r1, 3
; CHECK-NEXT:    ord $r6 = $r1, 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ord $r7 = $r1, 5
; CHECK-NEXT:    ord $r8 = $r1, 6
; CHECK-NEXT:    ord $r9 = $r1, 7
; CHECK-NEXT:    addd $r1 = $r1, 8
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw -16[$r0] = $r2
; CHECK-NEXT:    addw $r2 = $r2, 8
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw -12[$r0] = $r3
; CHECK-NEXT:    compd.eq $r3 = $r1, 1024
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw -8[$r0] = $r4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw -4[$r0] = $r5
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw 0[$r0] = $r6
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw 4[$r0] = $r7
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw 8[$r0] = $r8
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw 12[$r0] = $r9
; CHECK-NEXT:    addd $r0 = $r0, 32
; CHECK-NEXT:    cb.even $r3 ? .LBB0_1
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.2: # %for.cond.cleanup
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body
  ret void

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next.7, %for.body ]
  %arrayidx = getelementptr inbounds i32, i32* %t, i64 %indvars.iv
  %0 = trunc i64 %indvars.iv to i32
  store i32 %0, i32* %arrayidx, align 4
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx.1 = getelementptr inbounds i32, i32* %t, i64 %indvars.iv.next
  %1 = trunc i64 %indvars.iv.next to i32
  store i32 %1, i32* %arrayidx.1, align 4
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx.2 = getelementptr inbounds i32, i32* %t, i64 %indvars.iv.next.1
  %2 = trunc i64 %indvars.iv.next.1 to i32
  store i32 %2, i32* %arrayidx.2, align 4
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %arrayidx.3 = getelementptr inbounds i32, i32* %t, i64 %indvars.iv.next.2
  %3 = trunc i64 %indvars.iv.next.2 to i32
  store i32 %3, i32* %arrayidx.3, align 4
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %arrayidx.4 = getelementptr inbounds i32, i32* %t, i64 %indvars.iv.next.3
  %4 = trunc i64 %indvars.iv.next.3 to i32
  store i32 %4, i32* %arrayidx.4, align 4
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %arrayidx.5 = getelementptr inbounds i32, i32* %t, i64 %indvars.iv.next.4
  %5 = trunc i64 %indvars.iv.next.4 to i32
  store i32 %5, i32* %arrayidx.5, align 4
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %arrayidx.6 = getelementptr inbounds i32, i32* %t, i64 %indvars.iv.next.5
  %6 = trunc i64 %indvars.iv.next.5 to i32
  store i32 %6, i32* %arrayidx.6, align 4
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %arrayidx.7 = getelementptr inbounds i32, i32* %t, i64 %indvars.iv.next.6
  %7 = trunc i64 %indvars.iv.next.6 to i32
  store i32 %7, i32* %arrayidx.7, align 4
  %indvars.iv.next.7 = add nuw nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1024
  br i1 %exitcond.7, label %for.cond.cleanup, label %for.body
}

