; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -relocation-model=pic < %s -mtriple=kvx-kalray-cos | FileCheck %s

; reduced testcase from T15272

%struct.f = type { [16 x %struct.a] }
%struct.a = type { %class.g }
%class.g = type { i8 }

$_ZN1fILi16EEC2Ev = comdat any

$_ZN1aC2Ev = comdat any

define void @_Z1iv() {
; CHECK-LABEL: _Z1iv:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addd $r12 = $r12, -32
; CHECK-NEXT:    get $r16 = $ra
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 32
; CHECK-NEXT:    sd 0[$r12] = $r16
; CHECK-NEXT:    addd $r0 = $r12, 8
; CHECK-NEXT:    call _ZN1fILi16EEC2Ev
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_offset 67, -32
; CHECK-NEXT:    ld $r16 = 0[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    set $ra = $r16
; CHECK-NEXT:    addd $r12 = $r12, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %1 = alloca %struct.f, align 1
  call void @_ZN1fILi16EEC2Ev(%struct.f* %1)
  ret void
}

define linkonce_odr void @_ZN1fILi16EEC2Ev(%struct.f* %0) comdat align 2 {
; CHECK-LABEL: _ZN1fILi16EEC2Ev:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addd $r12 = $r12, -32
; CHECK-NEXT:    get $r16 = $ra
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 32
; CHECK-NEXT:    sd 16[$r12] = $r16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_offset 67, -16
; CHECK-NEXT:    sq 0[$r12] = $r18r19
; CHECK-NEXT:    copyd $r18 = $r0
; CHECK-NEXT:    make $r19 = 0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_offset 19, -24
; CHECK-NEXT:    .cfi_offset 18, -32
; CHECK-NEXT:    sd 24[$r12] = $r18
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB1_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    addd $r0 = $r18, $r19
; CHECK-NEXT:    call _ZN1aC2Ev
; CHECK-NEXT:    ;;
; CHECK-NEXT:    addd $r19 = $r19, 1
; CHECK-NEXT:    ;;
; CHECK-NEXT:    compd.ne $r0 = $r19, 16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    cb.odd $r0 ? .LBB1_1
; CHECK-NEXT:    ;;
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    lq $r18r19 = 0[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ld $r16 = 16[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    set $ra = $r16
; CHECK-NEXT:    addd $r12 = $r12, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %2 = alloca %struct.f*, align 8
  store %struct.f* %0, %struct.f** %2, align 8
  %3 = load %struct.f*, %struct.f** %2, align 8
  %4 = getelementptr inbounds %struct.f, %struct.f* %3, i32 0, i32 0
  %5 = getelementptr inbounds [16 x %struct.a], [16 x %struct.a]* %4, i32 0, i32 0
  %6 = getelementptr inbounds %struct.a, %struct.a* %5, i64 16
  br label %7

7:                                                ; preds = %7, %1
  %8 = phi %struct.a* [ %5, %1 ], [ %9, %7 ]
  call void @_ZN1aC2Ev(%struct.a* %8)
  %9 = getelementptr inbounds %struct.a, %struct.a* %8, i64 1
  %10 = icmp eq %struct.a* %9, %6
  br i1 %10, label %11, label %7

11:                                               ; preds = %7
  ret void
}

define linkonce_odr void @_ZN1aC2Ev(%struct.a* %0) comdat align 2 {
; CHECK-LABEL: _ZN1aC2Ev:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addd $r12 = $r12, -32
; CHECK-NEXT:    get $r16 = $ra
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 32
; CHECK-NEXT:    sd 0[$r12] = $r16
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_offset 67, -32
; CHECK-NEXT:    sd 8[$r12] = $r0
; CHECK-NEXT:    call _ZN1gC1Ev
; CHECK-NEXT:    ;;
; CHECK-NEXT:    ld $r16 = 0[$r12]
; CHECK-NEXT:    ;;
; CHECK-NEXT:    set $ra = $r16
; CHECK-NEXT:    addd $r12 = $r12, 32
; CHECK-NEXT:    ;;
; CHECK-NEXT:    .cfi_def_cfa_offset 0
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  %2 = alloca %struct.a*, align 8
  store %struct.a* %0, %struct.a** %2, align 8
  %3 = load %struct.a*, %struct.a** %2, align 8
  %4 = getelementptr inbounds %struct.a, %struct.a* %3, i32 0, i32 0
  call void @_ZN1gC1Ev(%class.g* %4)
  ret void
}

declare void @_ZN1gC1Ev(%class.g*)
