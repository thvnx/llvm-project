; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -O0 -o - %s | FileCheck %s
target triple = "kvx-kalray-cos"

define i32 @noalign(i32 %n, i32 %n2, i32 %n3) #0 !dbg !10 {
; CHECK-LABEL: noalign:
; CHECK:       .Lfunc_begin0:
; CHECK-NEXT:    .file 1 "d/dwarf.c"
; CHECK-NEXT:    .loc 1 5 0 # dwarf.c:5:0
; CHECK-NEXT:    .cfi_sections .debug_frame
; CHECK-NEXT:    .cfi_startproc
; CHECK-NEXT:  # %bb.0: # %entry
; CHECK-NEXT:    addd $r12 = $r12, -32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 32
; CHECK-NEXT:    get $r16 = $ra
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sd 0[$r12] = $r16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_offset 67, -32
; CHECK-NEXT:    sw 8[$r12] = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw 12[$r12] = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw 16[$r12] = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    make $r0 = 7
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .Ltmp0:
; CHECK-NEXT:    .loc 1 6 7 prologue_end # dwarf.c:6:7
; CHECK-NEXT:    sw 20[$r12] = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    make $r0 = 0x4d2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 7 7 # dwarf.c:7:7
; CHECK-NEXT:    sw 24[$r12] = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 8 8 # dwarf.c:8:8
; CHECK-NEXT:    lwz $r0 = 8[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 8 5 is_stmt 0 # dwarf.c:8:5
; CHECK-NEXT:    lwz $r1 = 24[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sbfw $r0 = $r0, $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw 24[$r12] = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 9 8 is_stmt 1 # dwarf.c:9:8
; CHECK-NEXT:    lwz $r0 = 12[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 9 5 is_stmt 0 # dwarf.c:9:5
; CHECK-NEXT:    lwz $r1 = 24[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addw $r0 = $r1, $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw 24[$r12] = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 10 8 is_stmt 1 # dwarf.c:10:8
; CHECK-NEXT:    lwz $r0 = 16[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 10 5 is_stmt 0 # dwarf.c:10:5
; CHECK-NEXT:    lwz $r1 = 24[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    mulw $r0 = $r1, $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw 24[$r12] = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addd $r0 = $r12, 20
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addd $r1 = $r12, 24
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 11 10 is_stmt 1 # dwarf.c:11:10
; CHECK-NEXT:    call other
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 11 3 is_stmt 0 # dwarf.c:11:3
; CHECK-NEXT:    ld $r16 = 0[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    set $ra = $r16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addd $r12 = $r12, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .Ltmp1:
entry:
  %n.addr = alloca i32, align 4
  %n2.addr = alloca i32, align 4
  %n3.addr = alloca i32, align 4
  %c = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !14, metadata !DIExpression()), !dbg !15
  store i32 %n2, i32* %n2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n2.addr, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 %n3, i32* %n3.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n3.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %c, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 7, i32* %c, align 4, !dbg !21
  call void @llvm.dbg.declare(metadata i32* %i, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 1234, i32* %i, align 4, !dbg !23
  %0 = load i32, i32* %n.addr, align 4, !dbg !24
  %1 = load i32, i32* %i, align 4, !dbg !25
  %sub = sub nsw i32 %1, %0, !dbg !25
  store i32 %sub, i32* %i, align 4, !dbg !25
  %2 = load i32, i32* %n2.addr, align 4, !dbg !26
  %3 = load i32, i32* %i, align 4, !dbg !27
  %add = add nsw i32 %3, %2, !dbg !27
  store i32 %add, i32* %i, align 4, !dbg !27
  %4 = load i32, i32* %n3.addr, align 4, !dbg !28
  %5 = load i32, i32* %i, align 4, !dbg !29
  %mul = mul nsw i32 %5, %4, !dbg !29
  store i32 %mul, i32* %i, align 4, !dbg !29
  %call = call i32 @other(i32* %c, i32* %i), !dbg !30
  ret i32 %call, !dbg !31
}

declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @other(i32*, i32*) #2

define i32 @stackrealign1(i32 %n, i32 %n2, i32 %n3) #0 !dbg !32 {
; CHECK-LABEL: stackrealign1:
; CHECK:       .Lfunc_begin1:
; CHECK-NEXT:    .loc 1 31 0 is_stmt 1 # dwarf.c:31:0
; CHECK-NEXT:    .cfi_startproc
; CHECK-NEXT:  # %bb.0: # %entry
; CHECK-NEXT:    addd $r12 = $r12, -384
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 384
; CHECK-NEXT:    copyd $r32 = $r12
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_register 32
; CHECK-NEXT:    addd $r12 = $r12, 96
; CHECK-NEXT:    ;;
; CHECK-NEXT:    andd $r12 = $r12, -128
; CHECK-NEXT:    ;;
; CHECK-NEXT:    get $r16 = $ra
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sd 8[$r12] = $r16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_escape 0x10, 0x43, 0x02, 0x7c, 0x08
; CHECK-NEXT:    sd 0[$r12] = $r14
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_escape 0x10, 0x0e, 0x02, 0x7c, 0x00
; CHECK-NEXT:    copyd $r14 = $r32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_register 14
; CHECK-NEXT:    sw 16[$r12] = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw 20[$r12] = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw 24[$r12] = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    make $r0 = 7
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .Ltmp2:
; CHECK-NEXT:    .loc 1 32 7 prologue_end # dwarf.c:32:7
; CHECK-NEXT:    sw 28[$r12] = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    make $r0 = 0x4d2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 33 20 # dwarf.c:33:20
; CHECK-NEXT:    sw 128[$r12] = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 34 8 # dwarf.c:34:8
; CHECK-NEXT:    lwz $r0 = 16[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 34 5 is_stmt 0 # dwarf.c:34:5
; CHECK-NEXT:    lwz $r1 = 128[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sbfw $r0 = $r0, $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw 128[$r12] = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 35 8 is_stmt 1 # dwarf.c:35:8
; CHECK-NEXT:    lwz $r0 = 20[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 35 5 is_stmt 0 # dwarf.c:35:5
; CHECK-NEXT:    lwz $r1 = 128[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addw $r0 = $r1, $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw 128[$r12] = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 36 8 is_stmt 1 # dwarf.c:36:8
; CHECK-NEXT:    lwz $r0 = 24[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 36 5 is_stmt 0 # dwarf.c:36:5
; CHECK-NEXT:    lwz $r1 = 128[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    mulw $r0 = $r1, $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw 128[$r12] = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addd $r0 = $r12, 28
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addd $r1 = $r12, 128
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 37 10 is_stmt 1 # dwarf.c:37:10
; CHECK-NEXT:    call other1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 37 3 is_stmt 0 # dwarf.c:37:3
; CHECK-NEXT:    copyd $r32 = $r14
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_register 32
; CHECK-NEXT:    ld $r16 = 8[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    set $ra = $r16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_restore 67
; CHECK-NEXT:    ld $r14 = 0[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r12 = $r32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_register 12
; CHECK-NEXT:    addd $r12 = $r12, 384
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .Ltmp3:
entry:
  %n.addr = alloca i32, align 4
  %n2.addr = alloca i32, align 4
  %n3.addr = alloca i32, align 4
  %c = alloca i32, align 4
  %i = alloca i32, align 128
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !33, metadata !DIExpression()), !dbg !34
  store i32 %n2, i32* %n2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n2.addr, metadata !35, metadata !DIExpression()), !dbg !36
  store i32 %n3, i32* %n3.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n3.addr, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i32* %c, metadata !39, metadata !DIExpression()), !dbg !40
  store i32 7, i32* %c, align 4, !dbg !40
  call void @llvm.dbg.declare(metadata i32* %i, metadata !41, metadata !DIExpression()), !dbg !43
  store i32 1234, i32* %i, align 128, !dbg !43
  %0 = load i32, i32* %n.addr, align 4, !dbg !44
  %1 = load i32, i32* %i, align 128, !dbg !45
  %sub = sub nsw i32 %1, %0, !dbg !45
  store i32 %sub, i32* %i, align 128, !dbg !45
  %2 = load i32, i32* %n2.addr, align 4, !dbg !46
  %3 = load i32, i32* %i, align 128, !dbg !47
  %add = add nsw i32 %3, %2, !dbg !47
  store i32 %add, i32* %i, align 128, !dbg !47
  %4 = load i32, i32* %n3.addr, align 4, !dbg !48
  %5 = load i32, i32* %i, align 128, !dbg !49
  %mul = mul nsw i32 %5, %4, !dbg !49
  store i32 %mul, i32* %i, align 128, !dbg !49
  %call = call i32 @other1(i32* %c, i32* %i), !dbg !50
  ret i32 %call, !dbg !51
}

declare i32 @other1(i32*, i32*) #2

define i32 @stackrealign2(i32 %n) #0 !dbg !52 {
; CHECK-LABEL: stackrealign2:
; CHECK:       .Lfunc_begin2:
; CHECK-NEXT:    .loc 1 68 0 is_stmt 1 # dwarf.c:68:0
; CHECK-NEXT:    .cfi_startproc
; CHECK-NEXT:  # %bb.0: # %entry
; CHECK-NEXT:    addd $r12 = $r12, -384
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 384
; CHECK-NEXT:    copyd $r32 = $r12
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_register 32
; CHECK-NEXT:    addd $r12 = $r12, 96
; CHECK-NEXT:    ;;
; CHECK-NEXT:    andd $r12 = $r12, -128
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r33 = $r14
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r14 = $r12
; CHECK-NEXT:    ;;
; CHECK-NEXT:    get $r16 = $ra
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sd 16[$r12] = $r16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_escape 0x10, 0x43, 0x02, 0x7e, 0x10
; CHECK-NEXT:    sd 8[$r12] = $r33
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_escape 0x10, 0x0e, 0x02, 0x7e, 0x08
; CHECK-NEXT:    sd 0[$r12] = $r31
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_escape 0x10, 0x1f, 0x02, 0x7e, 0x00
; CHECK-NEXT:    copyd $r31 = $r32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_register 31
; CHECK-NEXT:    sw 24[$r14] = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .Ltmp4:
; CHECK-NEXT:    .loc 1 69 41 prologue_end # dwarf.c:69:41
; CHECK-NEXT:    lws $r0 = 24[$r14]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 69 20 is_stmt 0 # dwarf.c:69:20
; CHECK-NEXT:    addx4d $r0 = $r0, 31
; CHECK-NEXT:    ;;
; CHECK-NEXT:    andd $r0 = $r0, -32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r1 = $r12
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sbfd $r0 = $r0, $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r12 = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 69 8 # dwarf.c:69:8
; CHECK-NEXT:    sd 32[$r14] = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    make $r0 = 0
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .Ltmp5:
; CHECK-NEXT:    .loc 1 70 12 is_stmt 1 # dwarf.c:70:12
; CHECK-NEXT:    sw 40[$r14] = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB2_1: # %for.cond
; CHECK-NEXT:    # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:  .Ltmp6:
; CHECK-NEXT:    .loc 1 70 19 is_stmt 0 # dwarf.c:70:19
; CHECK-NEXT:    lwz $r0 = 40[$r14]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 70 23 # dwarf.c:70:23
; CHECK-NEXT:    lwz $r1 = 24[$r14]
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .Ltmp7:
; CHECK-NEXT:    .loc 1 70 3 # dwarf.c:70:3
; CHECK-NEXT:    compw.ge $r0 = $r0, $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.odd $r0 ? .LBB2_4
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.2: # %for.body
; CHECK-NEXT:    # in Loop: Header=BB2_1 Depth=1
; CHECK-NEXT:  .Ltmp8:
; CHECK-NEXT:    .loc 1 71 13 is_stmt 1 # dwarf.c:71:13
; CHECK-NEXT:    lwz $r0 = 24[$r14]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 71 17 is_stmt 0 # dwarf.c:71:17
; CHECK-NEXT:    lwz $r1 = 40[$r14]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 71 15 # dwarf.c:71:15
; CHECK-NEXT:    sbfw $r0 = $r1, $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 71 5 # dwarf.c:71:5
; CHECK-NEXT:    ld $r2 = 32[$r14]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sxwd $r1 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 71 11 # dwarf.c:71:11
; CHECK-NEXT:    sw.xs $r1[$r2] = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.3: # %for.inc
; CHECK-NEXT:    # in Loop: Header=BB2_1 Depth=1
; CHECK-NEXT:    .loc 1 70 27 is_stmt 1 # dwarf.c:70:27
; CHECK-NEXT:    lwz $r0 = 40[$r14]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addw $r0 = $r0, 1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw 40[$r14] = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 70 3 is_stmt 0 # dwarf.c:70:3
; CHECK-NEXT:    goto .LBB2_1
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .Ltmp9:
; CHECK-NEXT:  .LBB2_4: # %for.end
; CHECK-NEXT:    .loc 1 0 3 # dwarf.c:0:3
; CHECK-NEXT:    make $r0 = 0x4d2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 72 20 is_stmt 1 # dwarf.c:72:20
; CHECK-NEXT:    sw 128[$r14] = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 73 17 # dwarf.c:73:17
; CHECK-NEXT:    ld $r0 = 32[$r14]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 73 21 is_stmt 0 # dwarf.c:73:21
; CHECK-NEXT:    lwz $r1 = 24[$r14]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addd $r2 = $r14, 128
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 73 10 # dwarf.c:73:10
; CHECK-NEXT:    call other2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 73 3 # dwarf.c:73:3
; CHECK-NEXT:    copyd $r32 = $r31
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_register 32
; CHECK-NEXT:    copyd $r12 = $r14
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ld $r31 = 0[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ld $r16 = 16[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    set $ra = $r16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_restore 67
; CHECK-NEXT:    ld $r14 = 8[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r12 = $r32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_register 12
; CHECK-NEXT:    addd $r12 = $r12, 384
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .Ltmp10:
entry:
  %n.addr = alloca i32, align 4
  %av = alloca i32*, align 8
  %j = alloca i32, align 4
  %i = alloca i32, align 128
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i32** %av, metadata !57, metadata !DIExpression()), !dbg !58
  %0 = load i32, i32* %n.addr, align 4, !dbg !59
  %conv = sext i32 %0 to i64, !dbg !59
  %mul = mul i64 4, %conv, !dbg !60
  %1 = alloca i8, i64 %mul, align 8, !dbg !61
  %2 = bitcast i8* %1 to i32*, !dbg !62
  store i32* %2, i32** %av, align 8, !dbg !58
  call void @llvm.dbg.declare(metadata i32* %j, metadata !63, metadata !DIExpression()), !dbg !65
  store i32 0, i32* %j, align 4, !dbg !65
  br label %for.cond, !dbg !66

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %j, align 4, !dbg !67
  %4 = load i32, i32* %n.addr, align 4, !dbg !69
  %cmp = icmp slt i32 %3, %4, !dbg !70
  br i1 %cmp, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %n.addr, align 4, !dbg !72
  %6 = load i32, i32* %j, align 4, !dbg !73
  %sub = sub nsw i32 %5, %6, !dbg !74
  %7 = load i32*, i32** %av, align 8, !dbg !75
  %8 = load i32, i32* %j, align 4, !dbg !76
  %idxprom = sext i32 %8 to i64, !dbg !75
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom, !dbg !75
  store i32 %sub, i32* %arrayidx, align 4, !dbg !77
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %j, align 4, !dbg !78
  %inc = add nsw i32 %9, 1, !dbg !78
  store i32 %inc, i32* %j, align 4, !dbg !78
  br label %for.cond, !dbg !79, !llvm.loop !80

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i, metadata !82, metadata !DIExpression()), !dbg !83
  store i32 1234, i32* %i, align 128, !dbg !83
  %10 = load i32*, i32** %av, align 8, !dbg !84
  %11 = load i32, i32* %n.addr, align 4, !dbg !85
  %call = call i32 @other2(i32* %10, i32 %11, i32* %i), !dbg !86
  ret i32 %call, !dbg !87
}

declare i32 @other2(i32*, i32, i32*) #2

define i32 @teststackalloca(i32 %n) #0 !dbg !88 {
; CHECK-LABEL: teststackalloca:
; CHECK:       .Lfunc_begin3:
; CHECK-NEXT:    .loc 1 114 0 is_stmt 1 # dwarf.c:114:0
; CHECK-NEXT:    .cfi_startproc
; CHECK-NEXT:  # %bb.0: # %entry
; CHECK-NEXT:    addd $r12 = $r12, -64
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 64
; CHECK-NEXT:    get $r16 = $ra
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sd 8[$r12] = $r16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_offset 67, -56
; CHECK-NEXT:    sd 0[$r12] = $r14
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_offset 14, -64
; CHECK-NEXT:    copyd $r14 = $r12
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_register 14
; CHECK-NEXT:    sw 16[$r14] = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .Ltmp11:
; CHECK-NEXT:    .loc 1 115 41 prologue_end # dwarf.c:115:41
; CHECK-NEXT:    lws $r0 = 16[$r14]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 115 20 is_stmt 0 # dwarf.c:115:20
; CHECK-NEXT:    addx4d $r0 = $r0, 31
; CHECK-NEXT:    ;;
; CHECK-NEXT:    andd $r0 = $r0, -32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r1 = $r12
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sbfd $r0 = $r0, $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    copyd $r12 = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 115 8 # dwarf.c:115:8
; CHECK-NEXT:    sd 24[$r14] = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    make $r0 = 0
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .Ltmp12:
; CHECK-NEXT:    .loc 1 116 12 is_stmt 1 # dwarf.c:116:12
; CHECK-NEXT:    sw 32[$r14] = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB3_1: # %for.cond
; CHECK-NEXT:    # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:  .Ltmp13:
; CHECK-NEXT:    .loc 1 116 19 is_stmt 0 # dwarf.c:116:19
; CHECK-NEXT:    lwz $r0 = 32[$r14]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 116 23 # dwarf.c:116:23
; CHECK-NEXT:    lwz $r1 = 16[$r14]
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .Ltmp14:
; CHECK-NEXT:    .loc 1 116 3 # dwarf.c:116:3
; CHECK-NEXT:    compw.ge $r0 = $r0, $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.odd $r0 ? .LBB3_4
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.2: # %for.body
; CHECK-NEXT:    # in Loop: Header=BB3_1 Depth=1
; CHECK-NEXT:  .Ltmp15:
; CHECK-NEXT:    .loc 1 117 13 is_stmt 1 # dwarf.c:117:13
; CHECK-NEXT:    lwz $r0 = 16[$r14]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 117 17 is_stmt 0 # dwarf.c:117:17
; CHECK-NEXT:    lwz $r1 = 32[$r14]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 117 15 # dwarf.c:117:15
; CHECK-NEXT:    sbfw $r0 = $r1, $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 117 5 # dwarf.c:117:5
; CHECK-NEXT:    ld $r2 = 24[$r14]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sxwd $r1 = $r1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 117 11 # dwarf.c:117:11
; CHECK-NEXT:    sw.xs $r1[$r2] = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.3: # %for.inc
; CHECK-NEXT:    # in Loop: Header=BB3_1 Depth=1
; CHECK-NEXT:    .loc 1 116 27 is_stmt 1 # dwarf.c:116:27
; CHECK-NEXT:    lwz $r0 = 32[$r14]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addw $r0 = $r0, 1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw 32[$r14] = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 116 3 is_stmt 0 # dwarf.c:116:3
; CHECK-NEXT:    goto .LBB3_1
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .Ltmp16:
; CHECK-NEXT:  .LBB3_4: # %for.end
; CHECK-NEXT:    .loc 1 0 3 # dwarf.c:0:3
; CHECK-NEXT:    make $r0 = 0x4d2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 118 7 is_stmt 1 # dwarf.c:118:7
; CHECK-NEXT:    sw 36[$r14] = $r0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 119 17 # dwarf.c:119:17
; CHECK-NEXT:    ld $r0 = 24[$r14]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 119 21 is_stmt 0 # dwarf.c:119:21
; CHECK-NEXT:    lwz $r1 = 16[$r14]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addd $r2 = $r14, 36
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 119 10 # dwarf.c:119:10
; CHECK-NEXT:    call other4
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .loc 1 119 3 # dwarf.c:119:3
; CHECK-NEXT:    copyd $r12 = $r14
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_register 12
; CHECK-NEXT:    ld $r16 = 8[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    set $ra = $r16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ld $r14 = 0[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addd $r12 = $r12, 64
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .Ltmp17:
entry:
  %n.addr = alloca i32, align 4
  %av = alloca i32*, align 8
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i32** %av, metadata !91, metadata !DIExpression()), !dbg !92
  %0 = load i32, i32* %n.addr, align 4, !dbg !93
  %conv = sext i32 %0 to i64, !dbg !93
  %mul = mul i64 4, %conv, !dbg !94
  %1 = alloca i8, i64 %mul, align 8, !dbg !95
  %2 = bitcast i8* %1 to i32*, !dbg !96
  store i32* %2, i32** %av, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i32* %j, metadata !97, metadata !DIExpression()), !dbg !99
  store i32 0, i32* %j, align 4, !dbg !99
  br label %for.cond, !dbg !100

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %j, align 4, !dbg !101
  %4 = load i32, i32* %n.addr, align 4, !dbg !103
  %cmp = icmp slt i32 %3, %4, !dbg !104
  br i1 %cmp, label %for.body, label %for.end, !dbg !105

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %n.addr, align 4, !dbg !106
  %6 = load i32, i32* %j, align 4, !dbg !107
  %sub = sub nsw i32 %5, %6, !dbg !108
  %7 = load i32*, i32** %av, align 8, !dbg !109
  %8 = load i32, i32* %j, align 4, !dbg !110
  %idxprom = sext i32 %8 to i64, !dbg !109
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom, !dbg !109
  store i32 %sub, i32* %arrayidx, align 4, !dbg !111
  br label %for.inc, !dbg !109

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %j, align 4, !dbg !112
  %inc = add nsw i32 %9, 1, !dbg !112
  store i32 %inc, i32* %j, align 4, !dbg !112
  br label %for.cond, !dbg !113, !llvm.loop !114

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i, metadata !116, metadata !DIExpression()), !dbg !117
  store i32 1234, i32* %i, align 4, !dbg !117
  %10 = load i32*, i32** %av, align 8, !dbg !118
  %11 = load i32, i32* %n.addr, align 4, !dbg !119
  %call = call i32 @other4(i32* %10, i32 %11, i32* %i), !dbg !120
  ret i32 %call, !dbg !121
}

declare i32 @other4(i32*, i32, i32*) #2

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Kalray clang version 10.0.1 (git:software/tools/llvm-project 413660a1a7a7a2ef431d0d906778c974f42d70d8)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "dwarf.c", directory: "d")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{i32 7, !"Dwarf Version", i32 2}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{!"Kalray clang version 10.0.1 (git:software/tools/llvm-project 413660a1a7a7a2ef431d0d906778c974f42d70d8)"}
!10 = distinct !DISubprogram(name: "noalign", scope: !11, file: !11, line: 5, type: !12, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!11 = !DIFile(filename: "dwarf.c", directory: "d")
!12 = !DISubroutineType(types: !13)
!13 = !{!5, !5, !5, !5}
!14 = !DILocalVariable(name: "n", arg: 1, scope: !10, file: !11, line: 5, type: !5)
!15 = !DILocation(line: 5, column: 17, scope: !10)
!16 = !DILocalVariable(name: "n2", arg: 2, scope: !10, file: !11, line: 5, type: !5)
!17 = !DILocation(line: 5, column: 24, scope: !10)
!18 = !DILocalVariable(name: "n3", arg: 3, scope: !10, file: !11, line: 5, type: !5)
!19 = !DILocation(line: 5, column: 32, scope: !10)
!20 = !DILocalVariable(name: "c", scope: !10, file: !11, line: 6, type: !5)
!21 = !DILocation(line: 6, column: 7, scope: !10)
!22 = !DILocalVariable(name: "i", scope: !10, file: !11, line: 7, type: !5)
!23 = !DILocation(line: 7, column: 7, scope: !10)
!24 = !DILocation(line: 8, column: 8, scope: !10)
!25 = !DILocation(line: 8, column: 5, scope: !10)
!26 = !DILocation(line: 9, column: 8, scope: !10)
!27 = !DILocation(line: 9, column: 5, scope: !10)
!28 = !DILocation(line: 10, column: 8, scope: !10)
!29 = !DILocation(line: 10, column: 5, scope: !10)
!30 = !DILocation(line: 11, column: 10, scope: !10)
!31 = !DILocation(line: 11, column: 3, scope: !10)
!32 = distinct !DISubprogram(name: "stackrealign1", scope: !11, file: !11, line: 31, type: !12, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DILocalVariable(name: "n", arg: 1, scope: !32, file: !11, line: 31, type: !5)
!34 = !DILocation(line: 31, column: 23, scope: !32)
!35 = !DILocalVariable(name: "n2", arg: 2, scope: !32, file: !11, line: 31, type: !5)
!36 = !DILocation(line: 31, column: 30, scope: !32)
!37 = !DILocalVariable(name: "n3", arg: 3, scope: !32, file: !11, line: 31, type: !5)
!38 = !DILocation(line: 31, column: 38, scope: !32)
!39 = !DILocalVariable(name: "c", scope: !32, file: !11, line: 32, type: !5)
!40 = !DILocation(line: 32, column: 7, scope: !32)
!41 = !DILocalVariable(name: "i", scope: !32, file: !11, line: 33, type: !42)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "more_aligned_int", file: !11, line: 27, baseType: !5, align: 1024)
!43 = !DILocation(line: 33, column: 20, scope: !32)
!44 = !DILocation(line: 34, column: 8, scope: !32)
!45 = !DILocation(line: 34, column: 5, scope: !32)
!46 = !DILocation(line: 35, column: 8, scope: !32)
!47 = !DILocation(line: 35, column: 5, scope: !32)
!48 = !DILocation(line: 36, column: 8, scope: !32)
!49 = !DILocation(line: 36, column: 5, scope: !32)
!50 = !DILocation(line: 37, column: 10, scope: !32)
!51 = !DILocation(line: 37, column: 3, scope: !32)
!52 = distinct !DISubprogram(name: "stackrealign2", scope: !11, file: !11, line: 68, type: !53, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!5, !5}
!55 = !DILocalVariable(name: "n", arg: 1, scope: !52, file: !11, line: 68, type: !5)
!56 = !DILocation(line: 68, column: 23, scope: !52)
!57 = !DILocalVariable(name: "av", scope: !52, file: !11, line: 69, type: !4)
!58 = !DILocation(line: 69, column: 8, scope: !52)
!59 = !DILocation(line: 69, column: 41, scope: !52)
!60 = !DILocation(line: 69, column: 39, scope: !52)
!61 = !DILocation(line: 69, column: 20, scope: !52)
!62 = !DILocation(line: 69, column: 13, scope: !52)
!63 = !DILocalVariable(name: "j", scope: !64, file: !11, line: 70, type: !5)
!64 = distinct !DILexicalBlock(scope: !52, file: !11, line: 70, column: 3)
!65 = !DILocation(line: 70, column: 12, scope: !64)
!66 = !DILocation(line: 70, column: 8, scope: !64)
!67 = !DILocation(line: 70, column: 19, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !11, line: 70, column: 3)
!69 = !DILocation(line: 70, column: 23, scope: !68)
!70 = !DILocation(line: 70, column: 21, scope: !68)
!71 = !DILocation(line: 70, column: 3, scope: !64)
!72 = !DILocation(line: 71, column: 13, scope: !68)
!73 = !DILocation(line: 71, column: 17, scope: !68)
!74 = !DILocation(line: 71, column: 15, scope: !68)
!75 = !DILocation(line: 71, column: 5, scope: !68)
!76 = !DILocation(line: 71, column: 8, scope: !68)
!77 = !DILocation(line: 71, column: 11, scope: !68)
!78 = !DILocation(line: 70, column: 27, scope: !68)
!79 = !DILocation(line: 70, column: 3, scope: !68)
!80 = distinct !{!80, !71, !81}
!81 = !DILocation(line: 71, column: 17, scope: !64)
!82 = !DILocalVariable(name: "i", scope: !52, file: !11, line: 72, type: !42)
!83 = !DILocation(line: 72, column: 20, scope: !52)
!84 = !DILocation(line: 73, column: 17, scope: !52)
!85 = !DILocation(line: 73, column: 21, scope: !52)
!86 = !DILocation(line: 73, column: 10, scope: !52)
!87 = !DILocation(line: 73, column: 3, scope: !52)
!88 = distinct !DISubprogram(name: "teststackalloca", scope: !11, file: !11, line: 114, type: !53, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "n", arg: 1, scope: !88, file: !11, line: 114, type: !5)
!90 = !DILocation(line: 114, column: 25, scope: !88)
!91 = !DILocalVariable(name: "av", scope: !88, file: !11, line: 115, type: !4)
!92 = !DILocation(line: 115, column: 8, scope: !88)
!93 = !DILocation(line: 115, column: 41, scope: !88)
!94 = !DILocation(line: 115, column: 39, scope: !88)
!95 = !DILocation(line: 115, column: 20, scope: !88)
!96 = !DILocation(line: 115, column: 13, scope: !88)
!97 = !DILocalVariable(name: "j", scope: !98, file: !11, line: 116, type: !5)
!98 = distinct !DILexicalBlock(scope: !88, file: !11, line: 116, column: 3)
!99 = !DILocation(line: 116, column: 12, scope: !98)
!100 = !DILocation(line: 116, column: 8, scope: !98)
!101 = !DILocation(line: 116, column: 19, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !11, line: 116, column: 3)
!103 = !DILocation(line: 116, column: 23, scope: !102)
!104 = !DILocation(line: 116, column: 21, scope: !102)
!105 = !DILocation(line: 116, column: 3, scope: !98)
!106 = !DILocation(line: 117, column: 13, scope: !102)
!107 = !DILocation(line: 117, column: 17, scope: !102)
!108 = !DILocation(line: 117, column: 15, scope: !102)
!109 = !DILocation(line: 117, column: 5, scope: !102)
!110 = !DILocation(line: 117, column: 8, scope: !102)
!111 = !DILocation(line: 117, column: 11, scope: !102)
!112 = !DILocation(line: 116, column: 27, scope: !102)
!113 = !DILocation(line: 116, column: 3, scope: !102)
!114 = distinct !{!114, !105, !115}
!115 = !DILocation(line: 117, column: 17, scope: !98)
!116 = !DILocalVariable(name: "i", scope: !88, file: !11, line: 118, type: !5)
!117 = !DILocation(line: 118, column: 7, scope: !88)
!118 = !DILocation(line: 119, column: 17, scope: !88)
!119 = !DILocation(line: 119, column: 21, scope: !88)
!120 = !DILocation(line: 119, column: 10, scope: !88)
!121 = !DILocation(line: 119, column: 3, scope: !88)
