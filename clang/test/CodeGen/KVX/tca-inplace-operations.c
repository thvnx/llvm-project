// NOTE: Assertions have been autogenerated by utils/update_cc_test_checks.py
// RUN: %clang_cc1 -triple kvx-kalray-cos  -S -emit-llvm -o - -O0 %s | FileCheck --check-prefix=O0 %s
// Ensure we emit final stores for these operations
// RUN: %clang_cc1 -triple kvx-kalray-cos  -S -emit-llvm -o - -O1 %s | FileCheck --check-prefix=O2 %s
// Ensure we emit final stores for these operations
// O0-LABEL: @convdhv(
// O0-NEXT:  entry:
// O0-NEXT:    [[V_ADDR:%.*]] = alloca <256 x i1>*, align 8
// O0-NEXT:    [[M_ADDR:%.*]] = alloca <1024 x i1>*, align 8
// O0-NEXT:    [[LOCAL:%.*]] = alloca <256 x i1>, align 32
// O0-NEXT:    store <256 x i1>* [[V:%.*]], <256 x i1>** [[V_ADDR]], align 8
// O0-NEXT:    store <1024 x i1>* [[M:%.*]], <1024 x i1>** [[M_ADDR]], align 8
// O0-NEXT:    [[TMP0:%.*]] = load <256 x i1>*, <256 x i1>** [[V_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[TMP0]], i64 0
// O0-NEXT:    [[TMP1:%.*]] = load <256 x i1>, <256 x i1>* [[ARRAYIDX]], align 32
// O0-NEXT:    [[TMP2:%.*]] = load <1024 x i1>*, <1024 x i1>** [[M_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX1:%.*]] = getelementptr inbounds <1024 x i1>, <1024 x i1>* [[TMP2]], i64 0
// O0-NEXT:    [[TMP3:%.*]] = load <1024 x i1>, <1024 x i1>* [[ARRAYIDX1]], align 128
// O0-NEXT:    [[TMP4:%.*]] = call <256 x i1> @llvm.kvx.convdhv1(<256 x i1> [[TMP1]], <1024 x i1> [[TMP3]], i32 0, i32 0)
// O0-NEXT:    store <256 x i1> [[TMP4]], <256 x i1>* [[LOCAL]], align 32
// O0-NEXT:    [[TMP5:%.*]] = load <256 x i1>, <256 x i1>* [[LOCAL]], align 32
// O0-NEXT:    [[TMP6:%.*]] = load <1024 x i1>*, <1024 x i1>** [[M_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX2:%.*]] = getelementptr inbounds <1024 x i1>, <1024 x i1>* [[TMP6]], i64 0
// O0-NEXT:    [[TMP7:%.*]] = load <1024 x i1>, <1024 x i1>* [[ARRAYIDX2]], align 128
// O0-NEXT:    [[TMP8:%.*]] = call <256 x i1> @llvm.kvx.convdhv0(<256 x i1> [[TMP5]], <1024 x i1> [[TMP7]], i32 0, i32 1)
// O0-NEXT:    store <256 x i1> [[TMP8]], <256 x i1>* [[LOCAL]], align 32
// O0-NEXT:    [[TMP9:%.*]] = load <256 x i1>, <256 x i1>* [[LOCAL]], align 32
// O0-NEXT:    [[TMP10:%.*]] = load <256 x i1>*, <256 x i1>** [[V_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX3:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[TMP10]], i64 1
// O0-NEXT:    store <256 x i1> [[TMP9]], <256 x i1>* [[ARRAYIDX3]], align 32
// O0-NEXT:    [[TMP11:%.*]] = load <1024 x i1>*, <1024 x i1>** [[M_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX4:%.*]] = getelementptr inbounds <1024 x i1>, <1024 x i1>* [[TMP11]], i64 1
// O0-NEXT:    [[TMP12:%.*]] = load <1024 x i1>, <1024 x i1>* [[ARRAYIDX4]], align 128
// O0-NEXT:    [[TMP13:%.*]] = call <256 x i1> @llvm.kvx.convdhv(<1024 x i1> [[TMP12]], i32 3, i32 0)
// O0-NEXT:    [[TMP14:%.*]] = load <256 x i1>*, <256 x i1>** [[V_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX5:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[TMP14]], i64 2
// O0-NEXT:    store <256 x i1> [[TMP13]], <256 x i1>* [[ARRAYIDX5]], align 32
// O0-NEXT:    ret void
//
// O2-LABEL: @convdhv(
// O2-NEXT:  entry:
// O2-NEXT:    [[TMP0:%.*]] = load <256 x i1>, <256 x i1>* [[V:%.*]], align 32, !tbaa !2
// O2-NEXT:    [[TMP1:%.*]] = load <1024 x i1>, <1024 x i1>* [[M:%.*]], align 128, !tbaa !6
// O2-NEXT:    [[TMP2:%.*]] = call <256 x i1> @llvm.kvx.convdhv1(<256 x i1> [[TMP0]], <1024 x i1> [[TMP1]], i32 0, i32 0)
// O2-NEXT:    [[TMP3:%.*]] = call <256 x i1> @llvm.kvx.convdhv0(<256 x i1> [[TMP2]], <1024 x i1> [[TMP1]], i32 0, i32 1)
// O2-NEXT:    [[ARRAYIDX3:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[V]], i64 1
// O2-NEXT:    store <256 x i1> [[TMP3]], <256 x i1>* [[ARRAYIDX3]], align 32, !tbaa !2
// O2-NEXT:    [[ARRAYIDX4:%.*]] = getelementptr inbounds <1024 x i1>, <1024 x i1>* [[M]], i64 1
// O2-NEXT:    [[TMP4:%.*]] = load <1024 x i1>, <1024 x i1>* [[ARRAYIDX4]], align 128, !tbaa !6
// O2-NEXT:    [[TMP5:%.*]] = call <256 x i1> @llvm.kvx.convdhv(<1024 x i1> [[TMP4]], i32 3, i32 0)
// O2-NEXT:    [[ARRAYIDX5:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[V]], i64 2
// O2-NEXT:    store <256 x i1> [[TMP5]], <256 x i1>* [[ARRAYIDX5]], align 32, !tbaa !2
// O2-NEXT:    ret void
//
void convdhv(__tca256 *v, __tca1024 *m) {
  __tca256 local;
  local = __builtin_kvx_convdhv1(v[0], m[0], ".rn.sat");
  local = __builtin_kvx_convdhv0(local, m[0], ".rn.satu");
  v[1] = local;
  v[2] = __builtin_kvx_convdhv(m[1], ".rz.sat");
}

// O0-LABEL: @convwbv(
// O0-NEXT:  entry:
// O0-NEXT:    [[V_ADDR:%.*]] = alloca <256 x i1>*, align 8
// O0-NEXT:    [[M_ADDR:%.*]] = alloca <1024 x i1>*, align 8
// O0-NEXT:    [[LOCAL:%.*]] = alloca <256 x i1>, align 32
// O0-NEXT:    store <256 x i1>* [[V:%.*]], <256 x i1>** [[V_ADDR]], align 8
// O0-NEXT:    store <1024 x i1>* [[M:%.*]], <1024 x i1>** [[M_ADDR]], align 8
// O0-NEXT:    [[TMP0:%.*]] = load <256 x i1>*, <256 x i1>** [[V_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[TMP0]], i64 0
// O0-NEXT:    [[TMP1:%.*]] = load <256 x i1>, <256 x i1>* [[ARRAYIDX]], align 32
// O0-NEXT:    [[TMP2:%.*]] = load <1024 x i1>*, <1024 x i1>** [[M_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX1:%.*]] = getelementptr inbounds <1024 x i1>, <1024 x i1>* [[TMP2]], i64 0
// O0-NEXT:    [[TMP3:%.*]] = load <1024 x i1>, <1024 x i1>* [[ARRAYIDX1]], align 128
// O0-NEXT:    [[TMP4:%.*]] = call <256 x i1> @llvm.kvx.convwbv1(<256 x i1> [[TMP1]], <1024 x i1> [[TMP3]], i32 0, i32 0)
// O0-NEXT:    store <256 x i1> [[TMP4]], <256 x i1>* [[LOCAL]], align 32
// O0-NEXT:    [[TMP5:%.*]] = load <256 x i1>, <256 x i1>* [[LOCAL]], align 32
// O0-NEXT:    [[TMP6:%.*]] = load <1024 x i1>*, <1024 x i1>** [[M_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX2:%.*]] = getelementptr inbounds <1024 x i1>, <1024 x i1>* [[TMP6]], i64 0
// O0-NEXT:    [[TMP7:%.*]] = load <1024 x i1>, <1024 x i1>* [[ARRAYIDX2]], align 128
// O0-NEXT:    [[TMP8:%.*]] = call <256 x i1> @llvm.kvx.convwbv0(<256 x i1> [[TMP5]], <1024 x i1> [[TMP7]], i32 0, i32 1)
// O0-NEXT:    store <256 x i1> [[TMP8]], <256 x i1>* [[LOCAL]], align 32
// O0-NEXT:    [[TMP9:%.*]] = load <256 x i1>, <256 x i1>* [[LOCAL]], align 32
// O0-NEXT:    [[TMP10:%.*]] = load <1024 x i1>*, <1024 x i1>** [[M_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX3:%.*]] = getelementptr inbounds <1024 x i1>, <1024 x i1>* [[TMP10]], i64 0
// O0-NEXT:    [[TMP11:%.*]] = load <1024 x i1>, <1024 x i1>* [[ARRAYIDX3]], align 128
// O0-NEXT:    [[TMP12:%.*]] = call <256 x i1> @llvm.kvx.convwbv2(<256 x i1> [[TMP9]], <1024 x i1> [[TMP11]], i32 2, i32 0)
// O0-NEXT:    store <256 x i1> [[TMP12]], <256 x i1>* [[LOCAL]], align 32
// O0-NEXT:    [[TMP13:%.*]] = load <256 x i1>, <256 x i1>* [[LOCAL]], align 32
// O0-NEXT:    [[TMP14:%.*]] = load <1024 x i1>*, <1024 x i1>** [[M_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX4:%.*]] = getelementptr inbounds <1024 x i1>, <1024 x i1>* [[TMP14]], i64 0
// O0-NEXT:    [[TMP15:%.*]] = load <1024 x i1>, <1024 x i1>* [[ARRAYIDX4]], align 128
// O0-NEXT:    [[TMP16:%.*]] = call <256 x i1> @llvm.kvx.convwbv3(<256 x i1> [[TMP13]], <1024 x i1> [[TMP15]], i32 4, i32 1)
// O0-NEXT:    [[TMP17:%.*]] = load <256 x i1>*, <256 x i1>** [[V_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX5:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[TMP17]], i64 1
// O0-NEXT:    store <256 x i1> [[TMP16]], <256 x i1>* [[ARRAYIDX5]], align 32
// O0-NEXT:    [[TMP18:%.*]] = load <256 x i1>, <256 x i1>* [[LOCAL]], align 32
// O0-NEXT:    [[TMP19:%.*]] = load <1024 x i1>*, <1024 x i1>** [[M_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX6:%.*]] = getelementptr inbounds <1024 x i1>, <1024 x i1>* [[TMP19]], i64 0
// O0-NEXT:    [[TMP20:%.*]] = load <1024 x i1>, <1024 x i1>* [[ARRAYIDX6]], align 128
// O0-NEXT:    [[TMP21:%.*]] = call <256 x i1> @llvm.kvx.convwbv3(<256 x i1> [[TMP18]], <1024 x i1> [[TMP20]], i32 0, i32 0)
// O0-NEXT:    [[TMP22:%.*]] = load <256 x i1>*, <256 x i1>** [[V_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX7:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[TMP22]], i64 0
// O0-NEXT:    store <256 x i1> [[TMP21]], <256 x i1>* [[ARRAYIDX7]], align 32
// O0-NEXT:    [[TMP23:%.*]] = load <1024 x i1>*, <1024 x i1>** [[M_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX8:%.*]] = getelementptr inbounds <1024 x i1>, <1024 x i1>* [[TMP23]], i64 1
// O0-NEXT:    [[TMP24:%.*]] = load <1024 x i1>, <1024 x i1>* [[ARRAYIDX8]], align 128
// O0-NEXT:    [[TMP25:%.*]] = call <256 x i1> @llvm.kvx.convwbv(<1024 x i1> [[TMP24]], i32 3, i32 1)
// O0-NEXT:    [[TMP26:%.*]] = load <256 x i1>*, <256 x i1>** [[V_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX9:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[TMP26]], i64 2
// O0-NEXT:    store <256 x i1> [[TMP25]], <256 x i1>* [[ARRAYIDX9]], align 32
// O0-NEXT:    ret void
//
// O2-LABEL: @convwbv(
// O2-NEXT:  entry:
// O2-NEXT:    [[TMP0:%.*]] = load <256 x i1>, <256 x i1>* [[V:%.*]], align 32, !tbaa !2
// O2-NEXT:    [[TMP1:%.*]] = load <1024 x i1>, <1024 x i1>* [[M:%.*]], align 128, !tbaa !6
// O2-NEXT:    [[TMP2:%.*]] = call <256 x i1> @llvm.kvx.convwbv1(<256 x i1> [[TMP0]], <1024 x i1> [[TMP1]], i32 0, i32 0)
// O2-NEXT:    [[TMP3:%.*]] = call <256 x i1> @llvm.kvx.convwbv0(<256 x i1> [[TMP2]], <1024 x i1> [[TMP1]], i32 0, i32 1)
// O2-NEXT:    [[TMP4:%.*]] = call <256 x i1> @llvm.kvx.convwbv2(<256 x i1> [[TMP3]], <1024 x i1> [[TMP1]], i32 2, i32 0)
// O2-NEXT:    [[TMP5:%.*]] = call <256 x i1> @llvm.kvx.convwbv3(<256 x i1> [[TMP4]], <1024 x i1> [[TMP1]], i32 4, i32 1)
// O2-NEXT:    [[ARRAYIDX5:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[V]], i64 1
// O2-NEXT:    store <256 x i1> [[TMP5]], <256 x i1>* [[ARRAYIDX5]], align 32, !tbaa !2
// O2-NEXT:    [[TMP6:%.*]] = call <256 x i1> @llvm.kvx.convwbv3(<256 x i1> [[TMP4]], <1024 x i1> [[TMP1]], i32 0, i32 0)
// O2-NEXT:    store <256 x i1> [[TMP6]], <256 x i1>* [[V]], align 32, !tbaa !2
// O2-NEXT:    [[ARRAYIDX8:%.*]] = getelementptr inbounds <1024 x i1>, <1024 x i1>* [[M]], i64 1
// O2-NEXT:    [[TMP7:%.*]] = load <1024 x i1>, <1024 x i1>* [[ARRAYIDX8]], align 128, !tbaa !6
// O2-NEXT:    [[TMP8:%.*]] = call <256 x i1> @llvm.kvx.convwbv(<1024 x i1> [[TMP7]], i32 3, i32 1)
// O2-NEXT:    [[ARRAYIDX9:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[V]], i64 2
// O2-NEXT:    store <256 x i1> [[TMP8]], <256 x i1>* [[ARRAYIDX9]], align 32, !tbaa !2
// O2-NEXT:    ret void
//
void convwbv(__tca256 *v, __tca1024 *m) {
  __tca256 local;
  local = __builtin_kvx_convwbv1(v[0], m[0], ".rn.sat");
  local = __builtin_kvx_convwbv0(local, m[0], ".rn.satu");
  local = __builtin_kvx_convwbv2(local, m[0], ".rd.sat");
  v[1] = __builtin_kvx_convwbv3(local, m[0], ".rhu.satu");
  v[0] = __builtin_kvx_convwbv3(local, m[0], ".rn.sat");
  v[2] = __builtin_kvx_convwbv(m[1], ".rz.satu");
}

// O0-LABEL: @fmma242hw(
// O0-NEXT:  entry:
// O0-NEXT:    [[V_ADDR:%.*]] = alloca <256 x i1>*, align 8
// O0-NEXT:    [[W_ADDR:%.*]] = alloca <512 x i1>*, align 8
// O0-NEXT:    [[LOCAL:%.*]] = alloca <256 x i1>, align 32
// O0-NEXT:    store <256 x i1>* [[V:%.*]], <256 x i1>** [[V_ADDR]], align 8
// O0-NEXT:    store <512 x i1>* [[W:%.*]], <512 x i1>** [[W_ADDR]], align 8
// O0-NEXT:    [[TMP0:%.*]] = load <256 x i1>*, <256 x i1>** [[V_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[TMP0]], i64 0
// O0-NEXT:    [[TMP1:%.*]] = load <256 x i1>, <256 x i1>* [[ARRAYIDX]], align 32
// O0-NEXT:    store <256 x i1> [[TMP1]], <256 x i1>* [[LOCAL]], align 32
// O0-NEXT:    [[TMP2:%.*]] = load <256 x i1>, <256 x i1>* [[LOCAL]], align 32
// O0-NEXT:    [[TMP3:%.*]] = load <512 x i1>*, <512 x i1>** [[W_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX1:%.*]] = getelementptr inbounds <512 x i1>, <512 x i1>* [[TMP3]], i64 0
// O0-NEXT:    [[TMP4:%.*]] = load <512 x i1>, <512 x i1>* [[ARRAYIDX1]], align 64
// O0-NEXT:    [[TMP5:%.*]] = load <256 x i1>*, <256 x i1>** [[V_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX2:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[TMP5]], i64 1
// O0-NEXT:    [[TMP6:%.*]] = load <256 x i1>, <256 x i1>* [[ARRAYIDX2]], align 32
// O0-NEXT:    [[TMP7:%.*]] = load <256 x i1>*, <256 x i1>** [[V_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX3:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[TMP7]], i64 2
// O0-NEXT:    [[TMP8:%.*]] = load <256 x i1>, <256 x i1>* [[ARRAYIDX3]], align 32
// O0-NEXT:    [[TMP9:%.*]] = call <256 x i1> @llvm.kvx.fmma242hw0(<256 x i1> [[TMP2]], <512 x i1> [[TMP4]], <256 x i1> [[TMP6]], <256 x i1> [[TMP8]])
// O0-NEXT:    store <256 x i1> [[TMP9]], <256 x i1>* [[LOCAL]], align 32
// O0-NEXT:    [[TMP10:%.*]] = load <256 x i1>, <256 x i1>* [[LOCAL]], align 32
// O0-NEXT:    [[TMP11:%.*]] = load <512 x i1>*, <512 x i1>** [[W_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX4:%.*]] = getelementptr inbounds <512 x i1>, <512 x i1>* [[TMP11]], i64 0
// O0-NEXT:    [[TMP12:%.*]] = load <512 x i1>, <512 x i1>* [[ARRAYIDX4]], align 64
// O0-NEXT:    [[TMP13:%.*]] = load <256 x i1>*, <256 x i1>** [[V_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX5:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[TMP13]], i64 1
// O0-NEXT:    [[TMP14:%.*]] = load <256 x i1>, <256 x i1>* [[ARRAYIDX5]], align 32
// O0-NEXT:    [[TMP15:%.*]] = load <256 x i1>*, <256 x i1>** [[V_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX6:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[TMP15]], i64 2
// O0-NEXT:    [[TMP16:%.*]] = load <256 x i1>, <256 x i1>* [[ARRAYIDX6]], align 32
// O0-NEXT:    [[TMP17:%.*]] = call <256 x i1> @llvm.kvx.fmma242hw1(<256 x i1> [[TMP10]], <512 x i1> [[TMP12]], <256 x i1> [[TMP14]], <256 x i1> [[TMP16]])
// O0-NEXT:    store <256 x i1> [[TMP17]], <256 x i1>* [[LOCAL]], align 32
// O0-NEXT:    [[TMP18:%.*]] = load <256 x i1>, <256 x i1>* [[LOCAL]], align 32
// O0-NEXT:    [[TMP19:%.*]] = load <512 x i1>*, <512 x i1>** [[W_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX7:%.*]] = getelementptr inbounds <512 x i1>, <512 x i1>* [[TMP19]], i64 0
// O0-NEXT:    [[TMP20:%.*]] = load <512 x i1>, <512 x i1>* [[ARRAYIDX7]], align 64
// O0-NEXT:    [[TMP21:%.*]] = load <256 x i1>*, <256 x i1>** [[V_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX8:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[TMP21]], i64 1
// O0-NEXT:    [[TMP22:%.*]] = load <256 x i1>, <256 x i1>* [[ARRAYIDX8]], align 32
// O0-NEXT:    [[TMP23:%.*]] = load <256 x i1>*, <256 x i1>** [[V_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX9:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[TMP23]], i64 2
// O0-NEXT:    [[TMP24:%.*]] = load <256 x i1>, <256 x i1>* [[ARRAYIDX9]], align 32
// O0-NEXT:    [[TMP25:%.*]] = call <256 x i1> @llvm.kvx.fmma242hw2(<256 x i1> [[TMP18]], <512 x i1> [[TMP20]], <256 x i1> [[TMP22]], <256 x i1> [[TMP24]])
// O0-NEXT:    [[TMP26:%.*]] = load <256 x i1>*, <256 x i1>** [[V_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX10:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[TMP26]], i64 1
// O0-NEXT:    store <256 x i1> [[TMP25]], <256 x i1>* [[ARRAYIDX10]], align 32
// O0-NEXT:    [[TMP27:%.*]] = load <256 x i1>, <256 x i1>* [[LOCAL]], align 32
// O0-NEXT:    [[TMP28:%.*]] = load <512 x i1>*, <512 x i1>** [[W_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX11:%.*]] = getelementptr inbounds <512 x i1>, <512 x i1>* [[TMP28]], i64 0
// O0-NEXT:    [[TMP29:%.*]] = load <512 x i1>, <512 x i1>* [[ARRAYIDX11]], align 64
// O0-NEXT:    [[TMP30:%.*]] = load <256 x i1>*, <256 x i1>** [[V_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX12:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[TMP30]], i64 1
// O0-NEXT:    [[TMP31:%.*]] = load <256 x i1>, <256 x i1>* [[ARRAYIDX12]], align 32
// O0-NEXT:    [[TMP32:%.*]] = load <256 x i1>*, <256 x i1>** [[V_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX13:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[TMP32]], i64 2
// O0-NEXT:    [[TMP33:%.*]] = load <256 x i1>, <256 x i1>* [[ARRAYIDX13]], align 32
// O0-NEXT:    [[TMP34:%.*]] = call <256 x i1> @llvm.kvx.fmma242hw3(<256 x i1> [[TMP27]], <512 x i1> [[TMP29]], <256 x i1> [[TMP31]], <256 x i1> [[TMP33]])
// O0-NEXT:    [[TMP35:%.*]] = load <256 x i1>*, <256 x i1>** [[V_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX14:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[TMP35]], i64 2
// O0-NEXT:    store <256 x i1> [[TMP34]], <256 x i1>* [[ARRAYIDX14]], align 32
// O0-NEXT:    [[TMP36:%.*]] = load <256 x i1>, <256 x i1>* [[LOCAL]], align 32
// O0-NEXT:    [[TMP37:%.*]] = load <256 x i1>*, <256 x i1>** [[V_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX15:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[TMP37]], i64 0
// O0-NEXT:    store <256 x i1> [[TMP36]], <256 x i1>* [[ARRAYIDX15]], align 32
// O0-NEXT:    [[TMP38:%.*]] = load <512 x i1>*, <512 x i1>** [[W_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX16:%.*]] = getelementptr inbounds <512 x i1>, <512 x i1>* [[TMP38]], i64 1
// O0-NEXT:    [[TMP39:%.*]] = load <512 x i1>, <512 x i1>* [[ARRAYIDX16]], align 64
// O0-NEXT:    [[TMP40:%.*]] = load <256 x i1>*, <256 x i1>** [[V_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX17:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[TMP40]], i64 2
// O0-NEXT:    [[TMP41:%.*]] = load <256 x i1>, <256 x i1>* [[ARRAYIDX17]], align 32
// O0-NEXT:    [[TMP42:%.*]] = load <256 x i1>*, <256 x i1>** [[V_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX18:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[TMP42]], i64 1
// O0-NEXT:    [[TMP43:%.*]] = load <256 x i1>, <256 x i1>* [[ARRAYIDX18]], align 32
// O0-NEXT:    [[TMP44:%.*]] = call <512 x i1> @llvm.kvx.fmma242hw(<512 x i1> [[TMP39]], <256 x i1> [[TMP41]], <256 x i1> [[TMP43]])
// O0-NEXT:    [[TMP45:%.*]] = load <512 x i1>*, <512 x i1>** [[W_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX19:%.*]] = getelementptr inbounds <512 x i1>, <512 x i1>* [[TMP45]], i64 3
// O0-NEXT:    store <512 x i1> [[TMP44]], <512 x i1>* [[ARRAYIDX19]], align 64
// O0-NEXT:    ret void
//
// O2-LABEL: @fmma242hw(
// O2-NEXT:  entry:
// O2-NEXT:    [[TMP0:%.*]] = load <256 x i1>, <256 x i1>* [[V:%.*]], align 32, !tbaa !2
// O2-NEXT:    [[TMP1:%.*]] = load <512 x i1>, <512 x i1>* [[W:%.*]], align 64, !tbaa !8
// O2-NEXT:    [[ARRAYIDX2:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[V]], i64 1
// O2-NEXT:    [[TMP2:%.*]] = load <256 x i1>, <256 x i1>* [[ARRAYIDX2]], align 32, !tbaa !2
// O2-NEXT:    [[ARRAYIDX3:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[V]], i64 2
// O2-NEXT:    [[TMP3:%.*]] = load <256 x i1>, <256 x i1>* [[ARRAYIDX3]], align 32, !tbaa !2
// O2-NEXT:    [[TMP4:%.*]] = call <256 x i1> @llvm.kvx.fmma242hw0(<256 x i1> [[TMP0]], <512 x i1> [[TMP1]], <256 x i1> [[TMP2]], <256 x i1> [[TMP3]])
// O2-NEXT:    [[TMP5:%.*]] = call <256 x i1> @llvm.kvx.fmma242hw1(<256 x i1> [[TMP4]], <512 x i1> [[TMP1]], <256 x i1> [[TMP2]], <256 x i1> [[TMP3]])
// O2-NEXT:    [[TMP6:%.*]] = call <256 x i1> @llvm.kvx.fmma242hw2(<256 x i1> [[TMP5]], <512 x i1> [[TMP1]], <256 x i1> [[TMP2]], <256 x i1> [[TMP3]])
// O2-NEXT:    store <256 x i1> [[TMP6]], <256 x i1>* [[ARRAYIDX2]], align 32, !tbaa !2
// O2-NEXT:    [[TMP7:%.*]] = call <256 x i1> @llvm.kvx.fmma242hw3(<256 x i1> [[TMP5]], <512 x i1> [[TMP1]], <256 x i1> [[TMP6]], <256 x i1> [[TMP3]])
// O2-NEXT:    store <256 x i1> [[TMP7]], <256 x i1>* [[ARRAYIDX3]], align 32, !tbaa !2
// O2-NEXT:    store <256 x i1> [[TMP5]], <256 x i1>* [[V]], align 32, !tbaa !2
// O2-NEXT:    [[ARRAYIDX16:%.*]] = getelementptr inbounds <512 x i1>, <512 x i1>* [[W]], i64 1
// O2-NEXT:    [[TMP8:%.*]] = load <512 x i1>, <512 x i1>* [[ARRAYIDX16]], align 64, !tbaa !8
// O2-NEXT:    [[TMP9:%.*]] = call <512 x i1> @llvm.kvx.fmma242hw(<512 x i1> [[TMP8]], <256 x i1> [[TMP7]], <256 x i1> [[TMP6]])
// O2-NEXT:    [[ARRAYIDX19:%.*]] = getelementptr inbounds <512 x i1>, <512 x i1>* [[W]], i64 3
// O2-NEXT:    store <512 x i1> [[TMP9]], <512 x i1>* [[ARRAYIDX19]], align 64, !tbaa !8
// O2-NEXT:    ret void
//
void fmma242hw(__tca256 *v, __tca512 *w) {
  __tca256 local = v[0];
  local = __builtin_kvx_fmma242hw0(local, w[0], v[1], v[2]);
  local = __builtin_kvx_fmma242hw1(local, w[0], v[1], v[2]);
  v[1] = __builtin_kvx_fmma242hw2(local, w[0], v[1], v[2]);
  v[2] = __builtin_kvx_fmma242hw3(local, w[0], v[1], v[2]);
  v[0] = local;
  w[3] = __builtin_kvx_fmma242hw(w[1], v[2], v[1]);
}

// O0-LABEL: @test(
// O0-NEXT:  entry:
// O0-NEXT:    [[V_ADDR:%.*]] = alloca <256 x i1>*, align 8
// O0-NEXT:    [[J:%.*]] = alloca [2 x i64], align 8
// O0-NEXT:    store <256 x i1>* [[V:%.*]], <256 x i1>** [[V_ADDR]], align 8
// O0-NEXT:    [[TMP0:%.*]] = bitcast [2 x i64]* [[J]] to i8*
// O0-NEXT:    call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 [[TMP0]], i8* align 8 bitcast ([2 x i64]* @__const.test.j to i8*), i64 16, i1 false)
// O0-NEXT:    [[TMP1:%.*]] = load <256 x i1>*, <256 x i1>** [[V_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[TMP1]], i64 0
// O0-NEXT:    [[TMP2:%.*]] = load <256 x i1>, <256 x i1>* [[ARRAYIDX]], align 32
// O0-NEXT:    [[ARRAYIDX1:%.*]] = getelementptr inbounds [2 x i64], [2 x i64]* [[J]], i64 0, i64 1
// O0-NEXT:    [[TMP3:%.*]] = load i64, i64* [[ARRAYIDX1]], align 8
// O0-NEXT:    [[ARRAYIDX2:%.*]] = getelementptr inbounds [2 x i64], [2 x i64]* [[J]], i64 0, i64 0
// O0-NEXT:    [[TMP4:%.*]] = load i64, i64* [[ARRAYIDX2]], align 8
// O0-NEXT:    [[TMP5:%.*]] = call <256 x i1> @llvm.kvx.movetohi(<256 x i1> [[TMP2]], i64 [[TMP3]], i64 [[TMP4]])
// O0-NEXT:    [[TMP6:%.*]] = load <256 x i1>*, <256 x i1>** [[V_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX3:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[TMP6]], i64 0
// O0-NEXT:    store <256 x i1> [[TMP5]], <256 x i1>* [[ARRAYIDX3]], align 32
// O0-NEXT:    [[TMP7:%.*]] = load <256 x i1>*, <256 x i1>** [[V_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX4:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[TMP7]], i64 0
// O0-NEXT:    [[TMP8:%.*]] = load <256 x i1>, <256 x i1>* [[ARRAYIDX4]], align 32
// O0-NEXT:    [[ARRAYIDX5:%.*]] = getelementptr inbounds [2 x i64], [2 x i64]* [[J]], i64 0, i64 1
// O0-NEXT:    [[TMP9:%.*]] = load i64, i64* [[ARRAYIDX5]], align 8
// O0-NEXT:    [[ARRAYIDX6:%.*]] = getelementptr inbounds [2 x i64], [2 x i64]* [[J]], i64 0, i64 0
// O0-NEXT:    [[TMP10:%.*]] = load i64, i64* [[ARRAYIDX6]], align 8
// O0-NEXT:    [[TMP11:%.*]] = call <256 x i1> @llvm.kvx.movetolo(<256 x i1> [[TMP8]], i64 [[TMP9]], i64 [[TMP10]])
// O0-NEXT:    [[TMP12:%.*]] = load <256 x i1>*, <256 x i1>** [[V_ADDR]], align 8
// O0-NEXT:    [[ARRAYIDX7:%.*]] = getelementptr inbounds <256 x i1>, <256 x i1>* [[TMP12]], i64 0
// O0-NEXT:    store <256 x i1> [[TMP11]], <256 x i1>* [[ARRAYIDX7]], align 32
// O0-NEXT:    ret void
//
// O2-LABEL: @test(
// O2-NEXT:  entry:
// O2-NEXT:    [[TMP0:%.*]] = load <256 x i1>, <256 x i1>* [[V:%.*]], align 32, !tbaa !2
// O2-NEXT:    [[TMP1:%.*]] = call <256 x i1> @llvm.kvx.movetohi(<256 x i1> [[TMP0]], i64 1, i64 0)
// O2-NEXT:    [[TMP2:%.*]] = call <256 x i1> @llvm.kvx.movetolo(<256 x i1> [[TMP1]], i64 1, i64 0)
// O2-NEXT:    store <256 x i1> [[TMP2]], <256 x i1>* [[V]], align 32, !tbaa !2
// O2-NEXT:    ret void
//
void test(__tca256 *v) {
  long j[2] = {0, 1};
  v[0] = __builtin_kvx_movetohi(v[0], j[1], j[0]);
  v[0] = __builtin_kvx_movetolo(v[0], j[1], j[0]);
}
