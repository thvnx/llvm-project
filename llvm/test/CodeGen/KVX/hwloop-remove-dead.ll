; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -disable-kvx-hwloops=false -O2 -o - %s | FileCheck %s
target triple = "kvx-kalray-cos"

define void @matrix_add_const(i32 %N, i16* nocapture %A, i16 %val){
; CHECK-LABEL: matrix_add_const:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    cb.weqz $r0 ? .LBB0_5
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.1: # %for.cond1.preheader.lr.ph
; CHECK-NEXT:    make $r3 = 0
; CHECK-NEXT:    zxwd $r4 = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r5 = $r3
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_2: # %for.body3.lr.ph
; CHECK-NEXT:    # =>This Loop Header: Depth=1
; CHECK-NEXT:    # Child Loop BB0_3 Depth 2
; CHECK-NEXT:    copyd $r6 = $r3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    loopdo $r4, .__LOOPDO_0_END_
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_3: # %for.body3
; CHECK-NEXT:    # Parent Loop BB0_2 Depth=1
; CHECK-NEXT:    # => This Inner Loop Header: Depth=2
; CHECK-NEXT:    zxwd $r7 = $r6
; CHECK-NEXT:    addw $r6 = $r6, 1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lhz.xs $r8 = $r7[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addw $r8 = $r8, $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sh.xs $r7[$r1] = $r8
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .__LOOPDO_0_END_:
; CHECK-NEXT:  # %bb.4: # %for.inc7
; CHECK-NEXT:    # in Loop: Header=BB0_2 Depth=1
; CHECK-NEXT:    addw $r5 = $r5, 1
; CHECK-NEXT:    addw $r3 = $r3, $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    compw.ne $r6 = $r5, $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.odd $r6 ? .LBB0_2
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_5: # %for.end9
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %cmp20 = icmp eq i32 %N, 0
  br i1 %cmp20, label %for.end9, label %for.cond1.preheader.lr.ph

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %wide.trip.count = zext i32 %N to i64
  br label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader.lr.ph, %for.inc7
  %i.021 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc8, %for.inc7 ]
  %mul = mul i32 %i.021, %N
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body3.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next, %for.body3 ]
  %0 = trunc i64 %indvars.iv to i32
  %add = add i32 %mul, %0
  %idxprom = zext i32 %add to i64
  %arrayidx = getelementptr inbounds i16, i16* %A, i64 %idxprom
  %1 = load i16, i16* %arrayidx, align 2
  %add5 = add i16 %1, %val
  store i16 %add5, i16* %arrayidx, align 2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc7, label %for.body3

for.inc7:                                         ; preds = %for.body3
  %inc8 = add nuw i32 %i.021, 1
  %exitcond23 = icmp eq i32 %inc8, %N
  br i1 %exitcond23, label %for.end9, label %for.body3.lr.ph

for.end9:                                         ; preds = %for.inc7, %entry
  ret void
}

