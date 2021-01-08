; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -disable-kvx-hwloops=false -O2 -o - %s | FileCheck %s
target triple = "kvx-kalray-cos"

@I = external global i32*, align 8

define i32 @ia(i32 %x, i32 %y)  {
; CHECK-LABEL: ia:
; CHECK:       # %bb.0: # %entry
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
; CHECK-NEXT:    copyd $r18 = $r1
; CHECK-NEXT:    copyd $r19 = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_offset 19, -56
; CHECK-NEXT:    .cfi_offset 18, -64
; CHECK-NEXT:    sxwd $r20 = $r18
; CHECK-NEXT:    sxwd $r0 = $r19
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r1 = $r20
; CHECK-NEXT:    call __moddi3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    compw.eq $r1 = $r19, $r18
; CHECK-NEXT:    zxwd $r0 = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.odd $r1 ? .LBB0_3
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.1: # %for.body.lr.ph
; CHECK-NEXT:    make $r1 = I
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ld $r21 = 0[$r1]
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_2: # %for.body
; CHECK-NEXT:    # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    addw $r19 = $r19, 1
; CHECK-NEXT:    sw 0[$r21] = $r0
; CHECK-NEXT:    copyd $r1 = $r20
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sxwd $r0 = $r19
; CHECK-NEXT:    call __moddi3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    zxwd $r0 = $r0
; CHECK-NEXT:    compw.ne $r1 = $r18, $r19
; CHECK-NEXT:    addd $r21 = $r21, 4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.odd $r1 ? .LBB0_2
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_3: # %for.end
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
entry:
  %cmp8 = icmp eq i32 %x, %y
  %rem9 = srem i32 %x, %y
  br i1 %cmp8, label %for.end, label %for.body.lr.ph

for.body.lr.ph:
  %0 = load i32*, i32** @I, align 8
  br label %for.body

for.body:
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %rem12 = phi i32 [ %rem9, %for.body.lr.ph ], [ %rem, %for.body ]
  %x.addr.010 = phi i32 [ %x, %for.body.lr.ph ], [ %inc, %for.body ]
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %indvars.iv
  store i32 %rem12, i32* %arrayidx, align 4
  %inc = add nsw i32 %x.addr.010, 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %cmp = icmp eq i32 %inc, %y
  %rem = srem i32 %inc, %y
  br i1 %cmp, label %for.end, label %for.body

for.end:
  %rem.lcssa = phi i32 [ %rem9, %entry ], [ %rem, %for.body ]
  ret i32 %rem.lcssa
}

