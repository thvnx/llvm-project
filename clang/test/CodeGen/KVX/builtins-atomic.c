// NOTE: Assertions have been autogenerated by utils/update_cc_test_checks.py
// RUN: %clang_cc1 -triple kvx-kalray-cos -S -O2 -emit-llvm -o - %s | FileCheck %s

// CHECK-LABEL: @acswapw(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = bitcast i32* [[P:%.*]] to i8*
// CHECK-NEXT:    [[TMP1:%.*]] = tail call i32 @llvm.kvx.acswapw(i8* [[TMP0]], i32 [[A:%.*]], i32 [[B:%.*]])
// CHECK-NEXT:    ret i32 [[TMP1]]
//
int acswapw(int *p, int a, int b) {
  return __builtin_kvx_acswapw(p, a, b);
}

// CHECK-LABEL: @acswapd(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = bitcast i32* [[P:%.*]] to i8*
// CHECK-NEXT:    [[TMP1:%.*]] = tail call i64 @llvm.kvx.acswapd(i8* [[TMP0]], i64 [[A:%.*]], i64 [[B:%.*]])
// CHECK-NEXT:    ret i64 [[TMP1]]
//
long acswapd(int *p, long a, long b) {
  return __builtin_kvx_acswapd(p, a, b);
}

// CHECK-LABEL: @aladdd(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call i64 @llvm.kvx.aladdd(i8* [[P:%.*]], i64 [[V:%.*]])
// CHECK-NEXT:    ret i64 [[TMP0]]
//
unsigned long aladdd(void *p, long v) {
  return __builtin_kvx_aladdd(p, v);
}

// CHECK-LABEL: @aladdw(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call i32 @llvm.kvx.aladdw(i8* [[P:%.*]], i32 [[V:%.*]])
// CHECK-NEXT:    ret i32 [[TMP0]]
//
unsigned int aladdw(void *p, int v) {
  return __builtin_kvx_aladdw(p, v);
}
