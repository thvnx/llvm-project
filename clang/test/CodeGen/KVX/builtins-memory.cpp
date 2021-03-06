// NOTE: Assertions have been autogenerated by utils/update_cc_test_checks.py
// RUN: %clang_cc1 -x c++ -triple kvx-kalray-cos -S -O2 -emit-llvm -o - %s | FileCheck %s

// CHECK-LABEL: @_Z6dinvalv(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    tail call void @llvm.kvx.dinval()
// CHECK-NEXT:    ret void
//
void dinval() {
  __builtin_kvx_dinval();
}

// CHECK-LABEL: @_Z7dinvallPc(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    tail call void @llvm.kvx.dinvall(i8* [[P:%.*]])
// CHECK-NEXT:    ret void
//
void dinvall(char *p) {
  __builtin_kvx_dinvall(p);
}

// CHECK-LABEL: @_Z7dtouchlPc(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    tail call void @llvm.kvx.dtouchl(i8* [[P:%.*]])
// CHECK-NEXT:    ret void
//
void dtouchl(char *p) {
  __builtin_kvx_dtouchl(p);
}

// CHECK-LABEL: @_Z6dzerolPc(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    tail call void @llvm.kvx.dzerol(i8* [[P:%.*]])
// CHECK-NEXT:    ret void
//
void dzerol(char *p) {
  __builtin_kvx_dzerol(p);
}

// CHECK-LABEL: @_Z5fencev(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    tail call void @llvm.kvx.fence()
// CHECK-NEXT:    ret void
//
void fence(void) {
  __builtin_kvx_fence();
}

// CHECK-LABEL: @_Z6iinvalv(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    tail call void @llvm.kvx.iinval()
// CHECK-NEXT:    ret void
//
void iinval(void) {
  __builtin_kvx_iinval();
}

// CHECK-LABEL: @_Z7iinvalsPc(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    tail call void @llvm.kvx.iinvals(i8* [[P:%.*]])
// CHECK-NEXT:    ret void
//
void iinvals(char *p) {
  __builtin_kvx_iinvals(p);
}

// CHECK-LABEL: @_Z9tlbdinvalv(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    tail call void @llvm.kvx.tlbdinval()
// CHECK-NEXT:    ret void
//
void tlbdinval(void) {
  __builtin_kvx_tlbdinval();
}

// CHECK-LABEL: @_Z9tlbiinvalv(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    tail call void @llvm.kvx.tlbiinval()
// CHECK-NEXT:    ret void
//
void tlbiinval(void) {
  __builtin_kvx_tlbiinval();
}

// CHECK-LABEL: @_Z8tlbprobev(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    tail call void @llvm.kvx.tlbprobe()
// CHECK-NEXT:    ret void
//
void tlbprobe(void) {
  __builtin_kvx_tlbprobe();
}

// CHECK-LABEL: @_Z7tlbreadv(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    tail call void @llvm.kvx.tlbread()
// CHECK-NEXT:    ret void
//
void tlbread(void) {
  __builtin_kvx_tlbread();
}

// CHECK-LABEL: @_Z8tlbwritev(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    tail call void @llvm.kvx.tlbwrite()
// CHECK-NEXT:    ret void
//
void tlbwrite(void) {
  __builtin_kvx_tlbwrite();
}

// CHECK-LABEL: @_Z3lbzPv(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = addrspacecast i8* [[P:%.*]] to i8 addrspace(256)*
// CHECK-NEXT:    [[TMP1:%.*]] = load i8, i8 addrspace(256)* [[TMP0]], align 1
// CHECK-NEXT:    ret i8 [[TMP1]]
//
unsigned char lbz(void *p) {
  return __builtin_kvx_lbz(p, ".u", false);
}

// CHECK-LABEL: @_Z3lbsPv(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = addrspacecast i8* [[P:%.*]] to i8 addrspace(256)*
// CHECK-NEXT:    [[TMP1:%.*]] = load i8, i8 addrspace(256)* [[TMP0]], align 1
// CHECK-NEXT:    [[CONV:%.*]] = sext i8 [[TMP1]] to i32
// CHECK-NEXT:    ret i32 [[CONV]]
//
int lbs(void *p) {
  return __builtin_kvx_lbs(p, ".u", false);
}

// CHECK-LABEL: @_Z3lhzPv(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = bitcast i8* [[P:%.*]] to i16*
// CHECK-NEXT:    [[TMP1:%.*]] = addrspacecast i16* [[TMP0]] to i16 addrspace(256)*
// CHECK-NEXT:    [[TMP2:%.*]] = load i16, i16 addrspace(256)* [[TMP1]], align 2
// CHECK-NEXT:    ret i16 [[TMP2]]
//
unsigned short lhz(void *p) {
  return __builtin_kvx_lhz(p, ".u", false);
}

// CHECK-LABEL: @_Z3lhsPv(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = bitcast i8* [[P:%.*]] to i16*
// CHECK-NEXT:    [[TMP1:%.*]] = addrspacecast i16* [[TMP0]] to i16 addrspace(256)*
// CHECK-NEXT:    [[TMP2:%.*]] = load i16, i16 addrspace(256)* [[TMP1]], align 2
// CHECK-NEXT:    [[TMP3:%.*]] = sext i16 [[TMP2]] to i64
// CHECK-NEXT:    ret i64 [[TMP3]]
//
long lhs(void *p) {
  return __builtin_kvx_lhs(p, ".u", false);
}

// CHECK-LABEL: @_Z3lwzPv(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = bitcast i8* [[P:%.*]] to i32*
// CHECK-NEXT:    [[TMP1:%.*]] = addrspacecast i32* [[TMP0]] to i32 addrspace(256)*
// CHECK-NEXT:    [[TMP2:%.*]] = load i32, i32 addrspace(256)* [[TMP1]], align 4
// CHECK-NEXT:    ret i32 [[TMP2]]
//
unsigned int lwz(void *p) {
  return __builtin_kvx_lwz(p, ".u", false);
}

// CHECK-LABEL: @_Z3lwsPv(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = bitcast i8* [[P:%.*]] to i32*
// CHECK-NEXT:    [[TMP1:%.*]] = addrspacecast i32* [[TMP0]] to i32 addrspace(256)*
// CHECK-NEXT:    [[TMP2:%.*]] = load i32, i32 addrspace(256)* [[TMP1]], align 4
// CHECK-NEXT:    [[TMP3:%.*]] = sext i32 [[TMP2]] to i64
// CHECK-NEXT:    ret i64 [[TMP3]]
//
long lws(void *p) {
  return __builtin_kvx_lws(p, ".u", false);
}

// CHECK-LABEL: @_Z3lwfPv(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = bitcast i8* [[P:%.*]] to float*
// CHECK-NEXT:    [[TMP1:%.*]] = addrspacecast float* [[TMP0]] to float addrspace(258)*
// CHECK-NEXT:    [[TMP2:%.*]] = load volatile float, float addrspace(258)* [[TMP1]], align 4
// CHECK-NEXT:    ret float [[TMP2]]
//
float lwf(void *p) {
  return __builtin_kvx_lwf(p, ".s", true);
}

// CHECK-LABEL: @_Z2ldPv(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = bitcast i8* [[P:%.*]] to i64*
// CHECK-NEXT:    [[TMP1:%.*]] = addrspacecast i64* [[TMP0]] to i64 addrspace(258)*
// CHECK-NEXT:    [[TMP2:%.*]] = load volatile i64, i64 addrspace(258)* [[TMP1]], align 8
// CHECK-NEXT:    ret i64 [[TMP2]]
//
long ld(void *p) {
  return __builtin_kvx_ld(p, ".s", true);
}

// CHECK-LABEL: @_Z3ldfPv(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = bitcast i8* [[P:%.*]] to double*
// CHECK-NEXT:    [[TMP1:%.*]] = addrspacecast double* [[TMP0]] to double addrspace(258)*
// CHECK-NEXT:    [[TMP2:%.*]] = load volatile double, double addrspace(258)* [[TMP1]], align 8
// CHECK-NEXT:    ret double [[TMP2]]
//
double ldf(void *p) {
  return __builtin_kvx_ldf(p, ".s", true);
}

typedef char int8x8_t __attribute__((__vector_size__(8 * sizeof(char))));

// CHECK-LABEL: @_Z4ldboPv(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = bitcast i8* [[P:%.*]] to <8 x i8>*
// CHECK-NEXT:    [[TMP1:%.*]] = addrspacecast <8 x i8>* [[TMP0]] to <8 x i8> addrspace(258)*
// CHECK-NEXT:    [[TMP2:%.*]] = load volatile <8 x i8>, <8 x i8> addrspace(258)* [[TMP1]], align 8
// CHECK-NEXT:    ret <8 x i8> [[TMP2]]
//
int8x8_t ldbo(void *p) {
  return __builtin_kvx_ldbo(p, ".s", true);
}

typedef short int16x4_t __attribute__((__vector_size__(4 * sizeof(short))));

// CHECK-LABEL: @_Z4ldhqPv(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = bitcast i8* [[P:%.*]] to <4 x i16>*
// CHECK-NEXT:    [[TMP1:%.*]] = addrspacecast <4 x i16>* [[TMP0]] to <4 x i16> addrspace(258)*
// CHECK-NEXT:    [[TMP2:%.*]] = load volatile <4 x i16>, <4 x i16> addrspace(258)* [[TMP1]], align 8
// CHECK-NEXT:    ret <4 x i16> [[TMP2]]
//
int16x4_t ldhq(void *p) {
  return __builtin_kvx_ldhq(p, ".s", true);
}

typedef int int32x2_t __attribute__((__vector_size__(2 * sizeof(int))));

// CHECK-LABEL: @_Z4ldwpPv(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = bitcast i8* [[P:%.*]] to <2 x i32>*
// CHECK-NEXT:    [[TMP1:%.*]] = addrspacecast <2 x i32>* [[TMP0]] to <2 x i32> addrspace(258)*
// CHECK-NEXT:    [[TMP2:%.*]] = load volatile <2 x i32>, <2 x i32> addrspace(258)* [[TMP1]], align 8
// CHECK-NEXT:    ret <2 x i32> [[TMP2]]
//
int32x2_t ldwp(void *p) {
  return __builtin_kvx_ldwp(p, ".s", true);
}

typedef float float32x2_t __attribute__((__vector_size__(2 * sizeof(float))));

// CHECK-LABEL: @_Z5ldfwpPv(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = bitcast i8* [[P:%.*]] to <2 x float>*
// CHECK-NEXT:    [[TMP1:%.*]] = addrspacecast <2 x float>* [[TMP0]] to <2 x float> addrspace(258)*
// CHECK-NEXT:    [[TMP2:%.*]] = load volatile <2 x float>, <2 x float> addrspace(258)* [[TMP1]], align 8
// CHECK-NEXT:    ret <2 x float> [[TMP2]]
//
float32x2_t ldfwp(void *p) {
  return __builtin_kvx_ldfwp(p, ".s", true);
}

// CHECK-LABEL: @_Z4sdboPvDv8_c(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = bitcast i8* [[P:%.*]] to <8 x i8>*
// CHECK-NEXT:    store volatile <8 x i8> [[V:%.*]], <8 x i8>* [[TMP0]], align 8
// CHECK-NEXT:    ret void
//
void sdbo(void *p, int8x8_t v) {
  __builtin_kvx_sdbo(p, v, true);
}

// CHECK-LABEL: @_Z4sdhqPvDv4_s(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = bitcast i8* [[P:%.*]] to <4 x i16>*
// CHECK-NEXT:    store volatile <4 x i16> [[V:%.*]], <4 x i16>* [[TMP0]], align 8
// CHECK-NEXT:    ret void
//
void sdhq(void *p, int16x4_t v) {
  __builtin_kvx_sdhq(p, v, true);
}

// CHECK-LABEL: @_Z4sdwpPvDv2_i(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = bitcast i8* [[P:%.*]] to <2 x i32>*
// CHECK-NEXT:    store volatile <2 x i32> [[V:%.*]], <2 x i32>* [[TMP0]], align 8
// CHECK-NEXT:    ret void
//
void sdwp(void *p, int32x2_t v) {
  __builtin_kvx_sdwp(p, v, true);
}

// CHECK-LABEL: @_Z5sdfwpPvDv2_f(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = bitcast i8* [[P:%.*]] to <4 x i16>*
// CHECK-NEXT:    [[TMP1:%.*]] = bitcast <2 x float> [[V:%.*]] to <4 x i16>
// CHECK-NEXT:    store volatile <4 x i16> [[TMP1]], <4 x i16>* [[TMP0]], align 8
// CHECK-NEXT:    ret void
//
void sdfwp(void *p, float32x2_t v) {
  __builtin_kvx_sdhq(p, v, true);
}
