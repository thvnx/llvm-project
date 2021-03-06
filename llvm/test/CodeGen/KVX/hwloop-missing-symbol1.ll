; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -disable-kvx-hwloops=false -O2 -o - %s | FileCheck %s
target triple = "kvx-kalray-cos"

@.str = private unnamed_addr constant [25 x i8] c"LAO Kernels - fircirc   \00", align 1
@x = common global [256 x i16] zeroinitializer, align 2
@h = common global [16 x i16] zeroinitializer, align 2
@y = common global [256 x i16] zeroinitializer, align 2

define void @InitDataSet(i32 %m, i16* nocapture %x, i32 %n, i16* nocapture %h)  {
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

declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture)

declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture)

define i32 @main(i32 %argc, i8** nocapture readnone %argv)  {
; CHECK-LABEL: main:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    addd $r12 = $r12, -96
; CHECK-NEXT:    get $r16 = $ra
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 96
; CHECK-NEXT:    sd 72[$r12] = $r16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_offset 67, -24
; CHECK-NEXT:    sd 64[$r12] = $r26
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_offset 26, -32
; CHECK-NEXT:    sq 48[$r12] = $r24r25
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_offset 25, -40
; CHECK-NEXT:    .cfi_offset 24, -48
; CHECK-NEXT:    so 16[$r12] = $r20r21r22r23
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_offset 23, -56
; CHECK-NEXT:    .cfi_offset 22, -64
; CHECK-NEXT:    .cfi_offset 21, -72
; CHECK-NEXT:    .cfi_offset 20, -80
; CHECK-NEXT:    sq 0[$r12] = $r18r19
; CHECK-NEXT:    make $r0 = .L.str
; CHECK-NEXT:    call BENCH_START
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_offset 19, -88
; CHECK-NEXT:    .cfi_offset 18, -96
; CHECK-NEXT:    make $r20 = 0
; CHECK-NEXT:    make $r23 = 1
; CHECK-NEXT:    make $r24 = 256
; CHECK-NEXT:    make $r25 = x
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addd $r19 = $r12, 80
; CHECK-NEXT:    copyd $r26 = $r20
; CHECK-NEXT:    make $r21 = 0
; CHECK-NEXT:    make $r22 = 9
; CHECK-NEXT:    goto .LBB1_1
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB1_7: # %for.cond10.preheader.i
; CHECK-NEXT:    # in Loop: Header=BB1_1 Depth=1
; CHECK-NEXT:    make $r3 = h
; CHECK-NEXT:    make $r0 = 4
; CHECK-NEXT:    make $r5 = 64
; CHECK-NEXT:    make $r1 = 36
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 4[$r3] = $r0
; CHECK-NEXT:    make $r0 = 25
; CHECK-NEXT:    make $r2 = 49
; CHECK-NEXT:    make $r4 = 1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 10[$r3] = $r0
; CHECK-NEXT:    make $r0 = 81
; CHECK-NEXT:    make $r18 = 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 16[$r3] = $r5
; CHECK-NEXT:    make $r5 = 144
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 12[$r3] = $r1
; CHECK-NEXT:    make $r1 = 100
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 14[$r3] = $r2
; CHECK-NEXT:    make $r2 = 121
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 18[$r3] = $r0
; CHECK-NEXT:    make $r0 = 169
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 24[$r3] = $r5
; CHECK-NEXT:    compd.ltu $r5 = $r26, 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 20[$r3] = $r1
; CHECK-NEXT:    make $r1 = 196
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 22[$r3] = $r2
; CHECK-NEXT:    make $r2 = 225
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 26[$r3] = $r0
; CHECK-NEXT:    make $r6 = 1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cmoved.weqz $r5 ? $r6 = 2
; CHECK-NEXT:    zxwd $r5 = $r26
; CHECK-NEXT:    sh 28[$r3] = $r1
; CHECK-NEXT:    make $r0 = y
; CHECK-NEXT:    ;;
; CHECK-NEXT:    make $r1 = x
; CHECK-NEXT:    sh 0[$r3] = $r21
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 2[$r3] = $r4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 6[$r3] = $r22
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 8[$r3] = $r18
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 30[$r3] = $r2
; CHECK-NEXT:    copyd $r2 = $r18
; CHECK-NEXT:    copyd $r7 = $r5
; CHECK-NEXT:    call fircirc
; CHECK-NEXT:    ;;
; CHECK-NEXT:    make $r0 = .L.str
; CHECK-NEXT:    call BENCH_STOP
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addd $r26 = $r26, 1
; CHECK-NEXT:    addw $r23 = $r23, 1
; CHECK-NEXT:    addd $r24 = $r24, -1
; CHECK-NEXT:    addd $r25 = $r25, 2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    compd.ne $r0 = $r26, 8
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.even $r0 ? .LBB1_8
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB1_1: # %if.end
; CHECK-NEXT:    # =>This Loop Header: Depth=1
; CHECK-NEXT:    # Child Loop BB1_10 Depth 2
; CHECK-NEXT:    # Child Loop BB1_5 Depth 2
; CHECK-NEXT:    # Child Loop BB1_11 Depth 2
; CHECK-NEXT:    addw $r0 = $r23, 48
; CHECK-NEXT:    sb 81[$r12] = $r20
; CHECK-NEXT:    sbfd $r18 = $r26, 256
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sb 80[$r12] = $r0
; CHECK-NEXT:    make $r0 = .L.str
; CHECK-NEXT:    copyd $r1 = $r19
; CHECK-NEXT:    call BENCH_START_S
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.deqz $r26 ? .LBB1_3
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.2: # %for.body.i.preheader
; CHECK-NEXT:    # in Loop: Header=BB1_1 Depth=1
; CHECK-NEXT:    make $r0 = 0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    loopdo $r26, .__LOOPDO_7_END_
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB1_10: # %for.body.i
; CHECK-NEXT:    # Parent Loop BB1_1 Depth=1
; CHECK-NEXT:    # => This Inner Loop Header: Depth=2
; CHECK-NEXT:    make $r1 = x
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh.xs $r0[$r1] = $r0
; CHECK-NEXT:    addd $r0 = $r0, 1
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .__LOOPDO_7_END_:
; CHECK-NEXT:  .LBB1_3: # %for.body4.preheader.i
; CHECK-NEXT:    # in Loop: Header=BB1_1 Depth=1
; CHECK-NEXT:    compd.gtu $r1 = $r18, 1
; CHECK-NEXT:    copyd $r0 = $r26
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.even $r1 ? .LBB1_11
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.4: # %vector.ph
; CHECK-NEXT:    # in Loop: Header=BB1_1 Depth=1
; CHECK-NEXT:    andd $r1 = $r18, -2
; CHECK-NEXT:    andd $r2 = $r24, -2
; CHECK-NEXT:    copyd $r3 = $r25
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addd $r0 = $r26, $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB1_5: # %vector.body
; CHECK-NEXT:    # Parent Loop BB1_1 Depth=1
; CHECK-NEXT:    # => This Inner Loop Header: Depth=2
; CHECK-NEXT:    make $r4 = 0xffffffffdeaddead
; CHECK-NEXT:    addd $r2 = $r2, -2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw 0[$r3] = $r4
; CHECK-NEXT:    addd $r3 = $r3, 4
; CHECK-NEXT:    cb.dnez $r2 ? .LBB1_5
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.6: # %middle.block
; CHECK-NEXT:    # in Loop: Header=BB1_1 Depth=1
; CHECK-NEXT:    compd.eq $r1 = $r18, $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.odd $r1 ? .LBB1_7
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB1_11: # %for.body4.i
; CHECK-NEXT:    # Parent Loop BB1_1 Depth=1
; CHECK-NEXT:    # => This Inner Loop Header: Depth=2
; CHECK-NEXT:    make $r1 = x
; CHECK-NEXT:    make $r2 = 0xdead
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh.xs $r0[$r1] = $r2
; CHECK-NEXT:    addd $r0 = $r0, 1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    compd.eq $r1 = $r0, 256
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.even $r1 ? .LBB1_11
; CHECK-NEXT:    ;;
; CHECK-NEXT:    goto .LBB1_7
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB1_8: # %for.body19.preheader
; CHECK-NEXT:    make $r23 = 8
; CHECK-NEXT:    make $r24 = 8
; CHECK-NEXT:    addd $r19 = $r12, 80
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB1_9: # %for.body19
; CHECK-NEXT:    # =>This Loop Header: Depth=1
; CHECK-NEXT:    # Child Loop BB1_12 Depth 2
; CHECK-NEXT:    # Child Loop BB1_14 Depth 2
; CHECK-NEXT:    slld $r0 = $r21, 4
; CHECK-NEXT:    make $r1 = 10
; CHECK-NEXT:    compw.gtu $r20 = $r22, 9
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ord $r25 = $r0, 8
; CHECK-NEXT:    zxwd $r0 = $r22
; CHECK-NEXT:    call __udivdi3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    zxwd $r0 = $r0
; CHECK-NEXT:    copyd $r1 = $r22
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cmoved.wnez $r20 ? $r1 = $r0
; CHECK-NEXT:    make $r20 = 0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addw $r0 = $r1, 48
; CHECK-NEXT:    sb 81[$r12] = $r20
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sb 80[$r12] = $r0
; CHECK-NEXT:    make $r0 = .L.str
; CHECK-NEXT:    copyd $r1 = $r19
; CHECK-NEXT:    call BENCH_START_S
; CHECK-NEXT:    ;;
; CHECK-NEXT:    loopdo $r25, .__LOOPDO_6_END_
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB1_12: # %for.body.i87
; CHECK-NEXT:    # Parent Loop BB1_9 Depth=1
; CHECK-NEXT:    # => This Inner Loop Header: Depth=2
; CHECK-NEXT:    make $r0 = x
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh.xs $r20[$r0] = $r20
; CHECK-NEXT:    addd $r20 = $r20, 1
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .__LOOPDO_6_END_:
; CHECK-NEXT:  # %bb.13: # %vector.body116.preheader
; CHECK-NEXT:    # in Loop: Header=BB1_9 Depth=1
; CHECK-NEXT:    copyd $r0 = $r18
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB1_14: # %vector.body116
; CHECK-NEXT:    # Parent Loop BB1_9 Depth=1
; CHECK-NEXT:    # => This Inner Loop Header: Depth=2
; CHECK-NEXT:    make $r1 = x
; CHECK-NEXT:    make $r2 = 0xffffffffdeaddead
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw $r1[$r0] = $r2
; CHECK-NEXT:    addd $r0 = $r0, 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    compd.ne $r1 = $r0, 512
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.odd $r1 ? .LBB1_14
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.15: # %for.cond10.preheader.i88
; CHECK-NEXT:    # in Loop: Header=BB1_9 Depth=1
; CHECK-NEXT:    make $r3 = h
; CHECK-NEXT:    make $r0 = 4
; CHECK-NEXT:    make $r1 = 9
; CHECK-NEXT:    make $r5 = 64
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 4[$r3] = $r0
; CHECK-NEXT:    make $r0 = 25
; CHECK-NEXT:    make $r2 = 49
; CHECK-NEXT:    make $r20 = 0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 6[$r3] = $r1
; CHECK-NEXT:    make $r1 = 36
; CHECK-NEXT:    make $r4 = 1
; CHECK-NEXT:    make $r6 = 144
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 16[$r3] = $r5
; CHECK-NEXT:    make $r5 = 121
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 10[$r3] = $r0
; CHECK-NEXT:    make $r0 = 81
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 12[$r3] = $r1
; CHECK-NEXT:    make $r1 = 100
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 22[$r3] = $r5
; CHECK-NEXT:    make $r5 = 225
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 14[$r3] = $r2
; CHECK-NEXT:    make $r2 = 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 18[$r3] = $r0
; CHECK-NEXT:    make $r0 = 169
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 20[$r3] = $r1
; CHECK-NEXT:    make $r1 = 196
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 30[$r3] = $r5
; CHECK-NEXT:    zxwd $r5 = $r24
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 24[$r3] = $r6
; CHECK-NEXT:    srlw $r6 = $r23, 3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 26[$r3] = $r0
; CHECK-NEXT:    make $r0 = y
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 28[$r3] = $r1
; CHECK-NEXT:    make $r1 = x
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 0[$r3] = $r20
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 2[$r3] = $r4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh 8[$r3] = $r2
; CHECK-NEXT:    copyd $r7 = $r5
; CHECK-NEXT:    call fircirc
; CHECK-NEXT:    ;;
; CHECK-NEXT:    make $r0 = .L.str
; CHECK-NEXT:    call BENCH_STOP
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addw $r22 = $r22, 1
; CHECK-NEXT:    addd $r24 = $r24, 16
; CHECK-NEXT:    addw $r23 = $r23, 16
; CHECK-NEXT:    addd $r18 = $r18, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    compw.ne $r0 = $r22, 13
; CHECK-NEXT:    addd $r21 = $r21, 1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.odd $r0 ? .LBB1_9
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.16: # %for.end42
; CHECK-NEXT:    make $r0 = 32
; CHECK-NEXT:    addd $r1 = $r12, 80
; CHECK-NEXT:    sb 82[$r12] = $r20
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sb 80[$r12] = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sb 81[$r12] = $r0
; CHECK-NEXT:    make $r0 = .L.str
; CHECK-NEXT:    call BENCH_STOP_S
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r0 = $r20
; CHECK-NEXT:    lq $r18r19 = 0[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lo $r20r21r22r23 = 16[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lq $r24r25 = 48[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ld $r26 = 64[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ld $r16 = 72[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    set $ra = $r16
; CHECK-NEXT:    addd $r12 = $r12, 96
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %str2 = alloca [3 x i8], align 1
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* %str2, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 3, i8* nonnull %0)
  tail call void @BENCH_START(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i64 0, i64 0))
  %arrayidx9 = getelementptr inbounds [3 x i8], [3 x i8]* %str2, i64 0, i64 1
  %arrayidx5 = getelementptr inbounds [3 x i8], [3 x i8]* %str2, i64 0, i64 2
  br label %if.end

if.end:
  %indvars.iv111 = phi i64 [ 0, %entry ], [ %indvars.iv.next112, %for.cond10.preheader.i ]
  %j.0105 = phi i32 [ 1, %entry ], [ %inc, %for.cond10.preheader.i ]
  %1 = sub nsw i64 256, %indvars.iv111
  %2 = trunc i32 %j.0105 to i8
  %conv7 = add nuw nsw i8 %2, 48
  store i8 %conv7, i8* %0, align 1
  store i8 0, i8* %arrayidx9, align 1
  call void @BENCH_START_S(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i64 0, i64 0), i8* nonnull %0)
  %cmp52.i = icmp eq i64 %indvars.iv111, 0
  br i1 %cmp52.i, label %for.body4.preheader.i, label %for.body.i

for.body4.preheader.i:
  %min.iters.check = icmp ult i64 %1, 2
  br i1 %min.iters.check, label %for.body4.i.preheader, label %vector.ph

for.body4.i.preheader:
  %indvars.iv57.i.ph = phi i64 [ %indvars.iv111, %for.body4.preheader.i ], [ %ind.end, %middle.block ]
  br label %for.body4.i

vector.ph:
  %n.vec = and i64 %1, -2
  %ind.end = add i64 %indvars.iv111, %n.vec
  br label %vector.body

vector.body:
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %offset.idx = add i64 %indvars.iv111, %index
  %3 = getelementptr inbounds [256 x i16], [256 x i16]* @x, i64 0, i64 %offset.idx
  %4 = bitcast i16* %3 to <2 x i16>*
  store <2 x i16> <i16 -8531, i16 -8531>, <2 x i16>* %4, align 2
  %index.next = add i64 %index, 2
  %5 = icmp eq i64 %index.next, %n.vec
  br i1 %5, label %middle.block, label %vector.body

middle.block:
  %cmp.n = icmp eq i64 %1, %n.vec
  br i1 %cmp.n, label %for.cond10.preheader.i, label %for.body4.i.preheader

for.body.i:
  %indvars.iv59.i = phi i64 [ %indvars.iv.next60.i, %for.body.i ], [ 0, %if.end ]
  %conv.i = trunc i64 %indvars.iv59.i to i16
  %arrayidx.i = getelementptr inbounds [256 x i16], [256 x i16]* @x, i64 0, i64 %indvars.iv59.i
  store i16 %conv.i, i16* %arrayidx.i, align 2
  %indvars.iv.next60.i = add nuw nsw i64 %indvars.iv59.i, 1
  %exitcond62.i = icmp eq i64 %indvars.iv.next60.i, %indvars.iv111
  br i1 %exitcond62.i, label %for.body4.preheader.i, label %for.body.i

for.cond10.preheader.i:
  store i16 0, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 0), align 2
  store i16 1, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 1), align 2
  store i16 4, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 2), align 2
  store i16 9, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 3), align 2
  store i16 16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 4), align 2
  store i16 25, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 5), align 2
  store i16 36, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 6), align 2
  store i16 49, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 7), align 2
  store i16 64, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 8), align 2
  store i16 81, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 9), align 2
  store i16 100, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 10), align 2
  store i16 121, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 11), align 2
  store i16 144, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 12), align 2
  store i16 169, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 13), align 2
  store i16 196, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 14), align 2
  store i16 225, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 15), align 2
  %cmp10 = icmp ult i64 %indvars.iv111, 4
  %. = select i1 %cmp10, i32 1, i32 2
  %6 = trunc i64 %indvars.iv111 to i32
  call void @fircirc(i16* getelementptr inbounds ([256 x i16], [256 x i16]* @y, i64 0, i64 0), i16* getelementptr inbounds ([256 x i16], [256 x i16]* @x, i64 0, i64 0), i32 16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 0), i32 1, i32 %6, i32 %., i32 %6)
  call void @BENCH_STOP(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i64 0, i64 0))
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %inc = add nuw nsw i32 %j.0105, 1
  %exitcond113 = icmp eq i64 %indvars.iv.next112, 8
  br i1 %exitcond113, label %for.body19, label %if.end

for.body4.i:
  %indvars.iv57.i = phi i64 [ %indvars.iv.next58.i, %for.body4.i ], [ %indvars.iv57.i.ph, %for.body4.i.preheader ]
  %arrayidx6.i = getelementptr inbounds [256 x i16], [256 x i16]* @x, i64 0, i64 %indvars.iv57.i
  store i16 -8531, i16* %arrayidx6.i, align 2
  %indvars.iv.next58.i = add nuw nsw i64 %indvars.iv57.i, 1
  %exitcond110 = icmp eq i64 %indvars.iv.next58.i, 256
  br i1 %exitcond110, label %for.cond10.preheader.i, label %for.body4.i

for.body19:
  %indvar = phi i64 [ %indvar.next, %for.cond10.preheader.i88 ], [ 0, %for.cond10.preheader.i ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.cond10.preheader.i88 ], [ 8, %for.cond10.preheader.i ]
  %size.1104 = phi i32 [ %add40, %for.cond10.preheader.i88 ], [ 8, %for.cond10.preheader.i ]
  %j.1102 = phi i32 [ %inc41, %for.cond10.preheader.i88 ], [ 9, %for.cond10.preheader.i ]
  %7 = mul nsw i64 %indvar, -16
  %cmp20 = icmp ugt i32 %j.1102, 9
  %div23 = udiv i32 %j.1102, 10
  %storemerge.in.in = select i1 %cmp20, i32 %div23, i32 %j.1102
  %storemerge.in = trunc i32 %storemerge.in.in to i8
  %storemerge = add i8 %storemerge.in, 48
  store i8 %storemerge, i8* %0, align 1
  store i8 0, i8* %arrayidx9, align 1
  call void @BENCH_START_S(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i64 0, i64 0), i8* nonnull %0)
  br label %for.body.i87

for.body.i87:
  %indvars.iv59.i82 = phi i64 [ 0, %for.body19 ], [ %indvars.iv.next60.i85, %for.body.i87 ]
  %conv.i83 = trunc i64 %indvars.iv59.i82 to i16
  %arrayidx.i84 = getelementptr inbounds [256 x i16], [256 x i16]* @x, i64 0, i64 %indvars.iv59.i82
  store i16 %conv.i83, i16* %arrayidx.i84, align 2
  %indvars.iv.next60.i85 = add nuw nsw i64 %indvars.iv59.i82, 1
  %exitcond62.i86 = icmp eq i64 %indvars.iv.next60.i85, %indvars.iv
  br i1 %exitcond62.i86, label %vector.body116.preheader, label %for.body.i87

vector.body116.preheader:
  %8 = add nsw i64 %7, 246
  br label %vector.body116

vector.body116:
  %index121 = phi i64 [ %index.next122, %vector.body116 ], [ 0, %vector.body116.preheader ]
  %offset.idx126 = add i64 %indvars.iv, %index121
  %9 = getelementptr inbounds [256 x i16], [256 x i16]* @x, i64 0, i64 %offset.idx126
  %10 = bitcast i16* %9 to <2 x i16>*
  store <2 x i16> <i16 -8531, i16 -8531>, <2 x i16>* %10, align 2
  %index.next122 = add i64 %index121, 2
  %11 = icmp eq i64 %index121, %8
  br i1 %11, label %for.cond10.preheader.i88, label %vector.body116

for.cond10.preheader.i88:
  store i16 0, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 0), align 2
  store i16 1, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 1), align 2
  store i16 4, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 2), align 2
  store i16 9, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 3), align 2
  store i16 16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 4), align 2
  store i16 25, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 5), align 2
  store i16 36, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 6), align 2
  store i16 49, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 7), align 2
  store i16 64, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 8), align 2
  store i16 81, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 9), align 2
  store i16 100, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 10), align 2
  store i16 121, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 11), align 2
  store i16 144, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 12), align 2
  store i16 169, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 13), align 2
  store i16 196, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 14), align 2
  store i16 225, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 15), align 2
  %12 = lshr exact i32 %size.1104, 3
  %13 = trunc i64 %indvars.iv to i32
  call void @fircirc(i16* getelementptr inbounds ([256 x i16], [256 x i16]* @y, i64 0, i64 0), i16* getelementptr inbounds ([256 x i16], [256 x i16]* @x, i64 0, i64 0), i32 16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @h, i64 0, i64 0), i32 1, i32 %13, i32 %12, i32 %13)
  call void @BENCH_STOP(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i64 0, i64 0))
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 16
  %add40 = add nuw nsw i32 %size.1104, 16
  %inc41 = add nuw nsw i32 %j.1102, 1
  %exitcond109 = icmp eq i32 %inc41, 13
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond109, label %for.end42, label %for.body19

for.end42:
  store i8 32, i8* %0, align 1
  store i8 32, i8* %arrayidx9, align 1
  store i8 0, i8* %arrayidx5, align 1
  call void @BENCH_STOP_S(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i64 0, i64 0), i8* nonnull %0)
  call void @llvm.lifetime.end.p0i8(i64 3, i8* nonnull %0)
  ret i32 0
}

declare void @BENCH_START(i8*)

declare void @BENCH_START_S(i8*, i8*)

declare void @fircirc(i16*, i16*, i32, i16*, i32, i32, i32, i32)

declare void @BENCH_STOP(i8*)

declare void @BENCH_STOP_S(i8*, i8*)
