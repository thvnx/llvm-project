; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -disable-kvx-hwloops=false -O3 -o - %s | FileCheck %s
target triple = "kvx-kalray-cos"

define void @f32(float* nocapture %0) {
; CHECK-LABEL: f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    make $r2 = 20
; CHECK-NEXT:    make $r1 = 0x3f000000
; CHECK-NEXT:    ;;
; CHECK-NEXT:    loopdo $r2, .__LOOPDO_0_END_
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB0_2: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    fixedw.rz $r2 = $r1, 0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sxwd $r2 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw.xs $r2[$r0] = $r1
; CHECK-NEXT:    faddw $r1 = $r1, 0x3f800000
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fixedw.rz $r2 = $r1, 0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sxwd $r2 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw.xs $r2[$r0] = $r1
; CHECK-NEXT:    faddw $r1 = $r1, 0x3f800000
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fixedw.rz $r2 = $r1, 0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sxwd $r2 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw.xs $r2[$r0] = $r1
; CHECK-NEXT:    faddw $r1 = $r1, 0x3f800000
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fixedw.rz $r2 = $r1, 0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sxwd $r2 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw.xs $r2[$r0] = $r1
; CHECK-NEXT:    faddw $r1 = $r1, 0x3f800000
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fixedw.rz $r2 = $r1, 0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sxwd $r2 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sw.xs $r2[$r0] = $r1
; CHECK-NEXT:    faddw $r1 = $r1, 0x3f800000
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .__LOOPDO_0_END_:
; CHECK-NEXT:  # %bb.1:
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  br label %3

2:
  ret void

3:
  %4 = phi float [ 5.000000e-01, %1 ], [ %24, %3 ]
  %5 = fptosi float %4 to i32
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds float, float* %0, i64 %6
  store float %4, float* %7, align 4
  %8 = fadd float %4, 1.000000e+00
  %9 = fptosi float %8 to i32
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds float, float* %0, i64 %10
  store float %8, float* %11, align 4
  %12 = fadd float %8, 1.000000e+00
  %13 = fptosi float %12 to i32
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds float, float* %0, i64 %14
  store float %12, float* %15, align 4
  %16 = fadd float %12, 1.000000e+00
  %17 = fptosi float %16 to i32
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds float, float* %0, i64 %18
  store float %16, float* %19, align 4
  %20 = fadd float %16, 1.000000e+00
  %21 = fptosi float %20 to i32
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds float, float* %0, i64 %22
  store float %20, float* %23, align 4
  %24 = fadd float %20, 1.000000e+00
  %25 = fcmp olt float %24, 1.000000e+02
  br i1 %25, label %3, label %2
}

define void @f64(double* nocapture %0) {
; CHECK-LABEL: f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    make $r2 = 20
; CHECK-NEXT:    make $r1 = 0x3fe0000000000000
; CHECK-NEXT:    ;;
; CHECK-NEXT:    loopdo $r2, .__LOOPDO_1_END_
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .LBB1_2: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    fixedd.rz $r2 = $r1, 0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sxwd $r2 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sd.xs $r2[$r0] = $r1
; CHECK-NEXT:    faddd $r1 = $r1, 0x3ff0000000000000
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fixedd.rz $r2 = $r1, 0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sxwd $r2 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sd.xs $r2[$r0] = $r1
; CHECK-NEXT:    faddd $r1 = $r1, 0x3ff0000000000000
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fixedd.rz $r2 = $r1, 0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sxwd $r2 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sd.xs $r2[$r0] = $r1
; CHECK-NEXT:    faddd $r1 = $r1, 0x3ff0000000000000
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fixedd.rz $r2 = $r1, 0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sxwd $r2 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sd.xs $r2[$r0] = $r1
; CHECK-NEXT:    faddd $r1 = $r1, 0x3ff0000000000000
; CHECK-NEXT:    ;;
; CHECK-NEXT:    fixedd.rz $r2 = $r1, 0
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sxwd $r2 = $r2
; CHECK-NEXT:    ;;
; CHECK-NEXT:    sd.xs $r2[$r0] = $r1
; CHECK-NEXT:    faddd $r1 = $r1, 0x3ff0000000000000
; CHECK-NEXT:    ;;
; CHECK-NEXT:  .__LOOPDO_1_END_:
; CHECK-NEXT:  # %bb.1:
; CHECK-NEXT:    ret
; CHECK-NEXT:    ;;
  br label %3

2:
  ret void

3:
  %4 = phi double [ 5.000000e-01, %1 ], [ %24, %3 ]
  %5 = fptosi double %4 to i32
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds double, double* %0, i64 %6
  store double %4, double* %7, align 8
  %8 = fadd double %4, 1.000000e+00
  %9 = fptosi double %8 to i32
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds double, double* %0, i64 %10
  store double %8, double* %11, align 8
  %12 = fadd double %8, 1.000000e+00
  %13 = fptosi double %12 to i32
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds double, double* %0, i64 %14
  store double %12, double* %15, align 8
  %16 = fadd double %12, 1.000000e+00
  %17 = fptosi double %16 to i32
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds double, double* %0, i64 %18
  store double %16, double* %19, align 8
  %20 = fadd double %16, 1.000000e+00
  %21 = fptosi double %20 to i32
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds double, double* %0, i64 %22
  store double %20, double* %23, align 8
  %24 = fadd double %20, 1.000000e+00
  %25 = fcmp olt double %24, 1.000000e+02
  br i1 %25, label %3, label %2
}
