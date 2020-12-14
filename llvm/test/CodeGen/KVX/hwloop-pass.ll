; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc --disable-kvx-hwloops=false < %s -O2 | FileCheck %s
target triple = "kvx-kalray-cos"

define void @imm_imm_positive_bump(i32* nocapture %x){
; CHECK-LABEL: imm_imm_positive_bump:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 0
; CHECK-NEXT:    make $r2 = 0
; CHECK-NEXT:    make $r3 = 100
; CHECK-NEXT:    ;;
; CHECK-NEXT:    loopdo $r3, .LBB0_1
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_2: # %for.body
; CHECK-NEXT:    # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    sw.xs $r1[$r0] = $r2
; CHECK-NEXT:    addd $r1 = $r1, 1
; CHECK-NEXT:    addw $r2 = $r2, 1
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_1: # Block address taken
; CHECK-NEXT:    # %for.cond.cleanup
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body
  ret void

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds i32, i32* %x, i64 %indvars.iv
  %0 = trunc i64 %indvars.iv to i32
  store i32 %0, i32* %arrayidx, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 100
  br i1 %exitcond, label %for.cond.cleanup, label %for.body
}

define void @imm_imm_negative_bump(i32* nocapture %x){
; CHECK-LABEL: imm_imm_negative_bump:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    make $r1 = 99
; CHECK-NEXT:    make $r2 = 99
; CHECK-NEXT:    make $r3 = 100
; CHECK-NEXT:    ;;
; CHECK-NEXT:    loopdo $r3, .LBB1_1
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB1_2: # %for.body
; CHECK-NEXT:    # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    sw.xs $r1[$r0] = $r2
; CHECK-NEXT:    addd $r1 = $r1, -1
; CHECK-NEXT:    addw $r2 = $r2, -1
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB1_1: # Block address taken
; CHECK-NEXT:    # %for.cond.cleanup
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body
  ret void

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ 99, %entry ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds i32, i32* %x, i64 %indvars.iv
  %0 = trunc i64 %indvars.iv to i32
  store i32 %0, i32* %arrayidx, align 4
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %cmp = icmp eq i64 %indvars.iv, 0
  br i1 %cmp, label %for.cond.cleanup, label %for.body
}

define void @imm_nonzero_reg_positive_bump(i32* nocapture %x, i32 %n){
; CHECK-LABEL: imm_nonzero_reg_positive_bump:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    compw.lt $r2 = $r1, 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.odd $r2 ? .LBB2_2
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.1: # %for.body.preheader
; CHECK-NEXT:    zxwd $r1 = $r1
; CHECK-NEXT:    addd $r0 = $r0, 12
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addd $r2 = $r1, -3
; CHECK-NEXT:    make $r1 = 3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.dlez $r2 ? .LBB2_3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    loopdo $r2, .LBB2_2
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB2_3: # %for.body
; CHECK-NEXT:    # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    sw 0[$r0] = $r1
; CHECK-NEXT:    addw $r1 = $r1, 1
; CHECK-NEXT:    addd $r0 = $r0, 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB2_2: # Block address taken
; CHECK-NEXT:    # %for.cond.cleanup
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp5 = icmp sgt i32 %n, 3
  br i1 %cmp5, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %entry
  ret void

for.body:                                         ; preds = %for.body, %for.body.preheader
  %indvars.iv = phi i64 [ 3, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds i32, i32* %x, i64 %indvars.iv
  %0 = trunc i64 %indvars.iv to i32
  store i32 %0, i32* %arrayidx, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond.cleanup, label %for.body
}

define void @imm_nonzero_reg_negative_bump(i32* nocapture %x, i32 %n){
; CHECK-LABEL: imm_nonzero_reg_negative_bump:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    compw.gt $r2 = $r1, 99
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.odd $r2 ? .LBB3_3
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.1: # %for.body.preheader
; CHECK-NEXT:    make $r3 = 99
; CHECK-NEXT:    sxwd $r1 = $r1
; CHECK-NEXT:    make $r2 = 99
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB3_2: # %for.body
; CHECK-NEXT:    # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    sw.xs $r3[$r0] = $r2
; CHECK-NEXT:    compd.gt $r4 = $r3, $r1
; CHECK-NEXT:    addd $r3 = $r3, -1
; CHECK-NEXT:    addw $r2 = $r2, -1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.odd $r4 ? .LBB3_2
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB3_3: # %for.cond.cleanup
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp5 = icmp sgt i32 %n, 99
  br i1 %cmp5, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %0 = sext i32 %n to i64
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ 99, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds i32, i32* %x, i64 %indvars.iv
  %1 = trunc i64 %indvars.iv to i32
  store i32 %1, i32* %arrayidx, align 4
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %cmp = icmp sgt i64 %indvars.iv, %0
  br i1 %cmp, label %for.body, label %for.cond.cleanup
}

define void @imm_zero_reg_positive_bump(i32* nocapture %x, i32 %n){
; CHECK-LABEL: imm_zero_reg_positive_bump:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    cb.wlez $r1 ? .LBB4_2
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.1: # %for.body.preheader
; CHECK-NEXT:    zxwd $r2 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    make $r2 = 0
; CHECK-NEXT:    cb.dlez $r1 ? .LBB4_3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    loopdo $r1, .LBB4_2
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB4_3: # %for.body
; CHECK-NEXT:    # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    sw 0[$r0] = $r2
; CHECK-NEXT:    addw $r2 = $r2, 1
; CHECK-NEXT:    addd $r0 = $r0, 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB4_2: # Block address taken
; CHECK-NEXT:    # %for.cond.cleanup
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp5 = icmp sgt i32 %n, 0
  br i1 %cmp5, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %entry
  ret void

for.body:                                         ; preds = %for.body, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds i32, i32* %x, i64 %indvars.iv
  %0 = trunc i64 %indvars.iv to i32
  store i32 %0, i32* %arrayidx, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond.cleanup, label %for.body
}

define void @imm_zero_reg_negative_bump(i32* nocapture %x, i32 %n){
; CHECK-LABEL: imm_zero_reg_negative_bump:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    cb.wgtz $r1 ? .LBB5_2
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.1: # %for.body.preheader
; CHECK-NEXT:    sxwd $r1 = $r1
; CHECK-NEXT:    make $r2 = 1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sbfd $r2 = $r1, 1
; CHECK-NEXT:    make $r1 = 0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.dlez $r2 ? .LBB5_3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    loopdo $r2, .LBB5_2
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB5_3: # %for.body
; CHECK-NEXT:    # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    sw 0[$r0] = $r1
; CHECK-NEXT:    addw $r1 = $r1, -1
; CHECK-NEXT:    addd $r0 = $r0, 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB5_2: # Block address taken
; CHECK-NEXT:    # %for.cond.cleanup
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp5 = icmp sgt i32 %n, 0
  br i1 %cmp5, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %0 = sext i32 %n to i64
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %1 = sub nsw i64 0, %indvars.iv
  %arrayidx = getelementptr inbounds i32, i32* %x, i64 %1
  %2 = trunc i64 %indvars.iv to i32
  store i32 %2, i32* %arrayidx, align 4
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %cmp = icmp sgt i64 %indvars.iv, %0
  br i1 %cmp, label %for.body, label %for.cond.cleanup
}

define void @reg_imm_nonzero_negative_bump(i32* nocapture %x, i32 %start){
; CHECK-LABEL: reg_imm_nonzero_negative_bump:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    compw.lt $r2 = $r1, 3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.odd $r2 ? .LBB6_3
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.1: # %for.body.preheader
; CHECK-NEXT:    zxwd $r2 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB6_2: # %for.body
; CHECK-NEXT:    # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    sw.xs $r2[$r0] = $r1
; CHECK-NEXT:    compd.gt $r3 = $r2, 3
; CHECK-NEXT:    addd $r2 = $r2, -1
; CHECK-NEXT:    addw $r1 = $r1, -1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.odd $r3 ? .LBB6_2
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB6_3: # %for.cond.cleanup
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp6 = icmp sgt i32 %start, 2
  br i1 %cmp6, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:                               ; preds = %entry
  %0 = zext i32 %start to i64
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds i32, i32* %x, i64 %indvars.iv
  %1 = trunc i64 %indvars.iv to i32
  store i32 %1, i32* %arrayidx, align 4
  %cmp = icmp sgt i64 %indvars.iv, 3
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  br i1 %cmp, label %for.body, label %for.cond.cleanup
}

define void @reg_imm_nonzero_positive_bump(i32* nocapture %x, i32 %start){
; CHECK-LABEL: reg_imm_nonzero_positive_bump:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    compw.gt $r2 = $r1, 99
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.odd $r2 ? .LBB7_3
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.1: # %for.body.preheader
; CHECK-NEXT:    sxwd $r2 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB7_2: # %for.body
; CHECK-NEXT:    # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    sw.xs $r2[$r0] = $r1
; CHECK-NEXT:    compd.lt $r3 = $r2, 99
; CHECK-NEXT:    addd $r2 = $r2, 1
; CHECK-NEXT:    addw $r1 = $r1, 1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.odd $r3 ? .LBB7_2
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB7_3: # %for.cond.cleanup
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp5 = icmp slt i32 %start, 100
  br i1 %cmp5, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:                               ; preds = %entry
  %0 = sext i32 %start to i64
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds i32, i32* %x, i64 %indvars.iv
  %1 = trunc i64 %indvars.iv to i32
  store i32 %1, i32* %arrayidx, align 4
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv, 99
  br i1 %cmp, label %for.body, label %for.cond.cleanup
}

define void @reg_imm_zero_positive_bump(i32* nocapture %x, i32 %start){
; CHECK-LABEL: reg_imm_zero_positive_bump:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    cb.wgtz $r1 ? .LBB8_2
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.1: # %for.body.preheader
; CHECK-NEXT:    sxwd $r2 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addd $r3 = $r2, -1
; CHECK-NEXT:    sbfx4d $r0 = $r2, $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    negd $r3 = $r3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.dlez $r3 ? .LBB8_3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    loopdo $r3, .LBB8_2
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB8_3: # %for.body
; CHECK-NEXT:    # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    sw 0[$r0] = $r1
; CHECK-NEXT:    addw $r1 = $r1, 1
; CHECK-NEXT:    addd $r0 = $r0, -4
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB8_2: # Block address taken
; CHECK-NEXT:    # %for.cond.cleanup
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp5 = icmp slt i32 %start, 1
  br i1 %cmp5, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:                               ; preds = %entry
  %0 = sext i32 %start to i64
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %1 = sub nsw i64 0, %indvars.iv
  %arrayidx = getelementptr inbounds i32, i32* %x, i64 %1
  %2 = trunc i64 %indvars.iv to i32
  store i32 %2, i32* %arrayidx, align 4
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv, 0
  br i1 %cmp, label %for.body, label %for.cond.cleanup
}

define void @reg_imm_zero_negative_bump(i32* nocapture %x, i32 %start){
; CHECK-LABEL: reg_imm_zero_negative_bump:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    cb.wltz $r1 ? .LBB9_3
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.1: # %for.body.preheader
; CHECK-NEXT:    zxwd $r2 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB9_2: # %for.body
; CHECK-NEXT:    # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    copyd $r3 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw.xs $r3[$r0] = $r1
; CHECK-NEXT:    addd $r2 = $r3, -1
; CHECK-NEXT:    addw $r1 = $r1, -1
; CHECK-NEXT:    cb.dgtz $r3 ? .LBB9_2
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB9_3: # %for.cond.cleanup
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp6 = icmp sgt i32 %start, -1
  br i1 %cmp6, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:                               ; preds = %entry
  %0 = zext i32 %start to i64
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds i32, i32* %x, i64 %indvars.iv
  %1 = trunc i64 %indvars.iv to i32
  store i32 %1, i32* %arrayidx, align 4
  %cmp = icmp sgt i64 %indvars.iv, 0
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  br i1 %cmp, label %for.body, label %for.cond.cleanup
}

define void @reg_reg_positive_bump(i32* nocapture %x, i32 %start, i32 %end){
; CHECK-LABEL: reg_reg_positive_bump:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    compw.ge $r3 = $r1, $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.odd $r3 ? .LBB10_2
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.1: # %for.body.preheader
; CHECK-NEXT:    sxwd $r3 = $r1
; CHECK-NEXT:    sxwd $r2 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sbfd $r2 = $r3, $r2
; CHECK-NEXT:    addx4d $r0 = $r3, $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.dlez $r2 ? .LBB10_3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    loopdo $r2, .LBB10_2
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB10_3: # %for.body
; CHECK-NEXT:    # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    sw 0[$r0] = $r1
; CHECK-NEXT:    addw $r1 = $r1, 1
; CHECK-NEXT:    addd $r0 = $r0, 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB10_2: # Block address taken
; CHECK-NEXT:    # %for.cond.cleanup
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp5 = icmp slt i32 %start, %end
  br i1 %cmp5, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:                               ; preds = %entry
  %0 = sext i32 %start to i64
  %wide.trip.count = sext i32 %end to i64
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %entry
  ret void

for.body:                                         ; preds = %for.body, %for.body.preheader
  %indvars.iv = phi i64 [ %0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds i32, i32* %x, i64 %indvars.iv
  %1 = trunc i64 %indvars.iv to i32
  store i32 %1, i32* %arrayidx, align 4
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond.cleanup, label %for.body
}

define void @reg_reg_negative_bump(i32* nocapture %x, i32 %start, i32 %end){
; CHECK-LABEL: reg_reg_negative_bump:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    compw.lt $r3 = $r1, $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.odd $r3 ? .LBB11_3
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.1: # %for.body.preheader
; CHECK-NEXT:    sxwd $r3 = $r1
; CHECK-NEXT:    sxwd $r2 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB11_2: # %for.body
; CHECK-NEXT:    # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    sw.xs $r3[$r0] = $r1
; CHECK-NEXT:    compd.gt $r4 = $r3, $r2
; CHECK-NEXT:    addd $r3 = $r3, -1
; CHECK-NEXT:    addw $r1 = $r1, -1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.odd $r4 ? .LBB11_2
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB11_3: # %for.cond.cleanup
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp5 = icmp slt i32 %start, %end
  br i1 %cmp5, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %0 = sext i32 %start to i64
  %1 = sext i32 %end to i64
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds i32, i32* %x, i64 %indvars.iv
  %2 = trunc i64 %indvars.iv to i32
  store i32 %2, i32* %arrayidx, align 4
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %cmp = icmp sgt i64 %indvars.iv, %1
  br i1 %cmp, label %for.body, label %for.cond.cleanup
}

