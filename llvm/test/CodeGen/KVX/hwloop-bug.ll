; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -disable-kvx-hwloops=false -O2 -o - %s | FileCheck %s
; This test is for all the backend, and not just the kvx-hwloops, as the BB
; generated by it gets deleted by simplify cfg.
; T14744
target triple = "kvx-kalray-cos"

@x = common global [256 x i16] zeroinitializer, align 2
@y = common global [256 x i16] zeroinitializer, align 2
@h = common global [16 x i16] zeroinitializer, align 2

; FIXME: Loop invariants, such as make $r5 = 0xbeefbeef should be moved outise loops.
define void @InitDataSet(i32 %m, i16* nocapture %x, i32 %n, i16* nocapture %h) {
; CHECK-LABEL: InitDataSet:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    cb.wlez $r0 ? .LBB0_1
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.2: # %for.body.preheader
; CHECK-NEXT:    zxwd $r5 = $r0
; CHECK-NEXT:    make $r4 = 0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    loopdo $r5, .__LOOPDO_5_END_
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_9: # %for.body
; CHECK-NEXT:    # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    sh.xs $r4[$r1] = $r4
; CHECK-NEXT:    addd $r4 = $r4, 1
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .__LOOPDO_5_END_:
; CHECK-NEXT:  # %bb.3: # %for.cond1.preheader
; CHECK-NEXT:    compw.gtu $r4 = $r0, 255
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.even $r4 ? .LBB0_4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    goto .LBB0_11
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_1:
; CHECK-NEXT:    make $r0 = 0
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_4: # %for.body4.preheader
; CHECK-NEXT:    zxwd $r6 = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    maxud $r0 = $r6, 255
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sbfd $r0 = $r6, $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addd $r4 = $r0, 1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    compd.gtu $r0 = $r4, 1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.odd $r0 ? .LBB0_7
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.5:
; CHECK-NEXT:    copyd $r0 = $r6
; CHECK-NEXT:    goto .LBB0_6
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_7: # %vector.ph
; CHECK-NEXT:    andd $r5 = $r4, -2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addd $r0 = $r5, -2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    srld $r0 = $r0, 1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addd $r7 = $r0, 1
; CHECK-NEXT:    addd $r0 = $r5, $r6
; CHECK-NEXT:    addx2d $r6 = $r6, $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    loopdo $r7, .__LOOPDO_4_END_
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_8: # %vector.body
; CHECK-NEXT:    # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    make $r7 = 0xffffffffdeaddead
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw 0[$r6] = $r7
; CHECK-NEXT:    addd $r6 = $r6, 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .__LOOPDO_4_END_:
; CHECK-NEXT:  # %bb.10: # %middle.block
; CHECK-NEXT:    compd.eq $r4 = $r4, $r5
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.odd $r4 ? .LBB0_11
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_6: # %for.body4.preheader87
; CHECK-NEXT:    maxud $r4 = $r0, 255
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sbfd $r4 = $r0, $r4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addd $r4 = $r4, 1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    loopdo $r4, .__LOOPDO_3_END_
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_14: # %for.body4
; CHECK-NEXT:    # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    make $r4 = 0xdead
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh.xs $r0[$r1] = $r4
; CHECK-NEXT:    addd $r0 = $r0, 1
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .__LOOPDO_3_END_:
; CHECK-NEXT:  .LBB0_11: # %for.cond10.preheader
; CHECK-NEXT:    cb.wlez $r2 ? .LBB0_12
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.13: # %for.body13.preheader
; CHECK-NEXT:    zxwd $r4 = $r2
; CHECK-NEXT:    make $r0 = 0
; CHECK-NEXT:    copyd $r1 = $r3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    loopdo $r4, .__LOOPDO_2_END_
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_21: # %for.body13
; CHECK-NEXT:    # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    mulw $r4 = $r0, $r0
; CHECK-NEXT:    addw $r0 = $r0, 1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 0[$r1] = $r4
; CHECK-NEXT:    addd $r1 = $r1, 2
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .__LOOPDO_2_END_:
; CHECK-NEXT:  # %bb.15: # %for.cond20.preheader
; CHECK-NEXT:    compw.gtu $r0 = $r2, 15
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.even $r0 ? .LBB0_16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    goto .LBB0_24
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_12:
; CHECK-NEXT:    make $r2 = 0
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_16: # %for.body23.preheader
; CHECK-NEXT:    zxwd $r4 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    maxud $r0 = $r4, 15
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sbfd $r0 = $r4, $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addd $r1 = $r0, 1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    compd.gtu $r0 = $r1, 1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.odd $r0 ? .LBB0_19
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.17:
; CHECK-NEXT:    copyd $r0 = $r4
; CHECK-NEXT:    goto .LBB0_18
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_19: # %vector.ph74
; CHECK-NEXT:    andd $r2 = $r1, -2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addd $r0 = $r2, -2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    srld $r0 = $r0, 1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addd $r5 = $r0, 1
; CHECK-NEXT:    addd $r0 = $r2, $r4
; CHECK-NEXT:    addx2d $r4 = $r4, $r3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    loopdo $r5, .__LOOPDO_1_END_
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_20: # %vector.body71
; CHECK-NEXT:    # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    make $r5 = 0xffffffffbeefbeef
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw 0[$r4] = $r5
; CHECK-NEXT:    addd $r4 = $r4, 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .__LOOPDO_1_END_:
; CHECK-NEXT:  # %bb.23: # %middle.block69
; CHECK-NEXT:    compd.eq $r1 = $r1, $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.odd $r1 ? .LBB0_24
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_18: # %for.body23.preheader86
; CHECK-NEXT:    maxud $r1 = $r0, 15
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sbfd $r1 = $r0, $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addd $r1 = $r1, 1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    loopdo $r1, .__LOOPDO_0_END_
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_22: # %for.body23
; CHECK-NEXT:    # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    make $r1 = 0xbeef
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh.xs $r0[$r3] = $r1
; CHECK-NEXT:    addd $r0 = $r0, 1
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .__LOOPDO_0_END_:
; CHECK-NEXT:  .LBB0_24: # %for.end28
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp52 = icmp sgt i32 %m, 0
  br i1 %cmp52, label %for.body.preheader, label %for.body4.preheader

for.body.preheader:
  %wide.trip.count61 = zext i32 %m to i64
  br label %for.body

for.cond1.preheader:
  %cmp250 = icmp ult i32 %m, 256
  br i1 %cmp250, label %for.body4.preheader, label %for.cond10.preheader

for.body4.preheader:
  %i.0.lcssa65 = phi i32 [ %m, %for.cond1.preheader ], [ 0, %entry ]
  %0 = zext i32 %i.0.lcssa65 to i64
  %1 = icmp ugt i64 %0, 255
  %umax = select i1 %1, i64 %0, i64 255
  %2 = add nuw nsw i64 %umax, 1
  %3 = sub nsw i64 %2, %0
  %min.iters.check = icmp ult i64 %3, 2
  br i1 %min.iters.check, label %for.body4.preheader87, label %vector.ph

for.body4.preheader87:
  %indvars.iv57.ph = phi i64 [ %0, %for.body4.preheader ], [ %ind.end, %middle.block ]
  br label %for.body4

vector.ph:
  %n.vec = and i64 %3, -2
  %ind.end = add nsw i64 %n.vec, %0
  br label %vector.body

vector.body:
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %offset.idx = add i64 %index, %0
  %4 = getelementptr inbounds i16, i16* %x, i64 %offset.idx
  %5 = bitcast i16* %4 to <2 x i16>*
  store <2 x i16> <i16 -8531, i16 -8531>, <2 x i16>* %5, align 2
  %index.next = add i64 %index, 2
  %6 = icmp eq i64 %index.next, %n.vec
  br i1 %6, label %middle.block, label %vector.body

middle.block:
  %cmp.n = icmp eq i64 %3, %n.vec
  br i1 %cmp.n, label %for.cond10.preheader, label %for.body4.preheader87

for.body:
  %indvars.iv59 = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next60, %for.body ]
  %conv = trunc i64 %indvars.iv59 to i16
  %arrayidx = getelementptr inbounds i16, i16* %x, i64 %indvars.iv59
  store i16 %conv, i16* %arrayidx, align 2
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next60, %wide.trip.count61
  br i1 %exitcond62, label %for.cond1.preheader, label %for.body

for.cond10.preheader:
  %cmp1148 = icmp sgt i32 %n, 0
  br i1 %cmp1148, label %for.body13.preheader, label %for.body23.preheader

for.body13.preheader:
  %wide.trip.count = zext i32 %n to i64
  br label %for.body13

for.body4:
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %for.body4 ], [ %indvars.iv57.ph, %for.body4.preheader87 ]
  %arrayidx6 = getelementptr inbounds i16, i16* %x, i64 %indvars.iv57
  store i16 -8531, i16* %arrayidx6, align 2
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %cmp2 = icmp ult i64 %indvars.iv57, 255
  br i1 %cmp2, label %for.body4, label %for.cond10.preheader

for.cond20.preheader:
  %cmp2146 = icmp ult i32 %n, 16
  br i1 %cmp2146, label %for.body23.preheader, label %for.end28

for.body23.preheader:
  %i.2.lcssa68 = phi i32 [ %n, %for.cond20.preheader ], [ 0, %for.cond10.preheader ]
  %7 = zext i32 %i.2.lcssa68 to i64
  %8 = icmp ugt i64 %7, 15
  %umax72 = select i1 %8, i64 %7, i64 15
  %9 = add nuw nsw i64 %umax72, 1
  %10 = sub nsw i64 %9, %7
  %min.iters.check73 = icmp ult i64 %10, 2
  br i1 %min.iters.check73, label %for.body23.preheader86, label %vector.ph74

for.body23.preheader86:
  %indvars.iv.ph = phi i64 [ %7, %for.body23.preheader ], [ %ind.end80, %middle.block69 ]
  br label %for.body23

vector.ph74:
  %n.vec76 = and i64 %10, -2
  %ind.end80 = add nsw i64 %n.vec76, %7
  br label %vector.body71

vector.body71:
  %index77 = phi i64 [ 0, %vector.ph74 ], [ %index.next78, %vector.body71 ]
  %offset.idx82 = add i64 %index77, %7
  %11 = getelementptr inbounds i16, i16* %h, i64 %offset.idx82
  %12 = bitcast i16* %11 to <2 x i16>*
  store <2 x i16> <i16 -16657, i16 -16657>, <2 x i16>* %12, align 2
  %index.next78 = add i64 %index77, 2
  %13 = icmp eq i64 %index.next78, %n.vec76
  br i1 %13, label %middle.block69, label %vector.body71

middle.block69:
  %cmp.n81 = icmp eq i64 %10, %n.vec76
  br i1 %cmp.n81, label %for.end28, label %for.body23.preheader86

for.body13:
  %indvars.iv55 = phi i64 [ 0, %for.body13.preheader ], [ %indvars.iv.next56, %for.body13 ]
  %14 = trunc i64 %indvars.iv55 to i32
  %mul = mul nsw i32 %14, %14
  %conv14 = trunc i32 %mul to i16
  %arrayidx16 = getelementptr inbounds i16, i16* %h, i64 %indvars.iv55
  store i16 %conv14, i16* %arrayidx16, align 2
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond = icmp eq i64 %indvars.iv.next56, %wide.trip.count
  br i1 %exitcond, label %for.cond20.preheader, label %for.body13

for.body23:
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body23 ], [ %indvars.iv.ph, %for.body23.preheader86 ]
  %arrayidx25 = getelementptr inbounds i16, i16* %h, i64 %indvars.iv
  store i16 -16657, i16* %arrayidx25, align 2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %cmp21 = icmp ult i64 %indvars.iv, 15
  br i1 %cmp21, label %for.body23, label %for.end28

for.end28:
  ret void
}


; This ensures we correctly have the loop latch with the
; loopdo end position and branching/falling to the loop exit
; From the C code:
; a, b;
; c() {
;   int d = e();
;   int *f = g();
;   a = 0;
;   for (; a < d; a++)
;     for (; f[a + 1];)
;       b = g;
; }

@a = common global i32 0, align 4
@b = common global i32 0, align 4

define i32 @c()  {
; CHECK-LABEL: c:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    addd $r12 = $r12, -32
; CHECK-NEXT:    get $r16 = $ra
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 32
; CHECK-NEXT:    sd 8[$r12] = $r16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_offset 67, -24
; CHECK-NEXT:    sd 0[$r12] = $r18
; CHECK-NEXT:    call e
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_offset 18, -32
; CHECK-NEXT:    copyd $r18 = $r0
; CHECK-NEXT:    call g
; CHECK-NEXT:    ;;
; CHECK-NEXT:    make $r1 = 0
; CHECK-NEXT:    make $r2 = a
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw 0[$r2] = $r1
; CHECK-NEXT:    cb.wlez $r18 ? .LBB1_6
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.1: # %for.cond3.preheader.preheader
; CHECK-NEXT:    zxwd $r2 = $r18
; CHECK-NEXT:    sxwd $r0 = $r0
; CHECK-NEXT:    make $r3 = b
; CHECK-NEXT:    ;;
; CHECK-NEXT:    loopdo $r2, .__LOOPDO_6_END_
; CHECK-NEXT:    ;;
; CHECK-NEXT:    goto .LBB1_3
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB1_2: # %for.cond.loopexit
; CHECK-NEXT:    # in Loop: Header=BB1_3 Depth=1
; CHECK-NEXT:    make $r2 = a
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw 0[$r2] = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .__LOOPDO_6_END_:
; CHECK-NEXT:    goto .LBB1_6
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB1_3: # %for.cond3.preheader
; CHECK-NEXT:    # =>This Loop Header: Depth=1
; CHECK-NEXT:    # Child Loop BB1_5 Depth 2
; CHECK-NEXT:    addd $r1 = $r1, 1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lwz.xs $r2 = $r1[$r0]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.weqz $r2 ? .LBB1_2
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB1_5: # %for.body4
; CHECK-NEXT:    # Parent Loop BB1_3 Depth=1
; CHECK-NEXT:    # => This Inner Loop Header: Depth=2
; CHECK-NEXT:    make $r2 = g
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw 0[$r3] = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lwz.xs $r2 = $r1[$r0]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.wnez $r2 ? .LBB1_5
; CHECK-NEXT:    ;;
; CHECK-NEXT:    goto .LBB1_2
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB1_6: # %for.end5
; CHECK-NEXT:    ld $r18 = 0[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ld $r16 = 8[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    set $ra = $r16
; CHECK-NEXT:    addd $r12 = $r12, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %call = tail call i32 bitcast (i32 (...)* @e to i32 ()*)()
  %call1 = tail call i32 bitcast (i32 (...)* @g to i32 ()*)()
  %conv = sext i32 %call1 to i64
  %0 = inttoptr i64 %conv to i32*
  store i32 0, i32* @a, align 4
  %cmp9 = icmp sgt i32 %call, 0
  br i1 %cmp9, label %for.cond3.preheader.preheader, label %for.end5

for.cond3.preheader.preheader:
  %wide.trip.count = zext i32 %call to i64
  br label %for.cond3.preheader

for.cond.loopexit:
  %1 = trunc i64 %indvars.iv.next to i32
  store i32 %1, i32* @a, align 4
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end5, label %for.cond3.preheader

for.cond3.preheader:
  %indvars.iv = phi i64 [ 0, %for.cond3.preheader.preheader ], [ %indvars.iv.next, %for.cond.loopexit ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next
  %2 = load i32, i32* %arrayidx, align 4
  %tobool8 = icmp eq i32 %2, 0
  br i1 %tobool8, label %for.cond.loopexit, label %for.body4

for.body4:
  store i32 ptrtoint (i32 (...)* @g to i32), i32* @b, align 4
  %3 = load i32, i32* %arrayidx, align 4
  %tobool = icmp eq i32 %3, 0
  br i1 %tobool, label %for.cond.loopexit, label %for.body4

for.end5:
  ret i32 undef
}

declare i32 @e(...)
declare i32 @g(...)

