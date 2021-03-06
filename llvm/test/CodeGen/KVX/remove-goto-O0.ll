; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -O2 | FileCheck %s
target triple = "kvx-kalray-cos"

define i32 @factorial(i32 %v){
; CHECK-LABEL: factorial:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    addd $r12 = $r12, -32
; CHECK-NEXT:    get $r16 = $ra
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 32
; CHECK-NEXT:    sd 0[$r12] = $r16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_offset 67, -32
; CHECK-NEXT:    sw 8[$r12] = $r0
; CHECK-NEXT:    cb.wlez $r0 ? .LBB0_2
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.1: # %if.then
; CHECK-NEXT:    lwz $r0 = 8[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addw $r0 = $r0, -1
; CHECK-NEXT:    call factorial
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lwz $r1 = 8[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    mulw $r0 = $r1, $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw 8[$r12] = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_2: # %if.end
; CHECK-NEXT:    lwz $r0 = 8[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ld $r16 = 0[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    set $ra = $r16
; CHECK-NEXT:    addd $r12 = $r12, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %v.addr = alloca i32, align 4
  store i32 %v, i32* %v.addr, align 4
  %0 = load i32, i32* %v.addr, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %v.addr, align 4
  %sub = sub nsw i32 %1, 1
  %call = call i32 @factorial(i32 %sub)
  %2 = load i32, i32* %v.addr, align 4
  %mul = mul nsw i32 %2, %call
  store i32 %mul, i32* %v.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, i32* %v.addr, align 4
  ret i32 %3
}

define i32 @f(){
; CHECK-LABEL: f:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    addd $r12 = $r12, -32
; CHECK-NEXT:    make $r0 = 0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 32
; CHECK-NEXT:    sw 4[$r12] = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB1_1: # %for.cond
; CHECK-NEXT:    # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    sw 0[$r12] = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lwz $r0 = 0[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    compw.gt $r0 = $r0, 3
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.odd $r0 ? .LBB1_3
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.2: # %for.body
; CHECK-NEXT:    # in Loop: Header=BB1_1 Depth=1
; CHECK-NEXT:    lwz $r0 = 0[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lwz $r1 = 4[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addw $r0 = $r1, $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw 4[$r12] = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    lwz $r0 = 0[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addw $r0 = $r0, 1
; CHECK-NEXT:    goto .LBB1_1
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB1_3: # %for.end
; CHECK-NEXT:    make $r0 = 0
; CHECK-NEXT:    addd $r12 = $r12, 32
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
entry:
  %i = alloca i32, align 4
  %s = alloca i32, align 4
  store i32 0, i32* %s, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* %s, align 4
  %add = add nsw i32 %2, %1
  store i32 %add, i32* %s, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

