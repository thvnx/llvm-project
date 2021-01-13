// NOTE: Assertions have been autogenerated by utils/update_cc_test_checks.py
// RUN: %clang_cc1 -triple kvx-kalray-cos  -S -emit-llvm -O1 -o - %s | FileCheck %s
// CHECK-LABEL: @alignofV(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    ret i32 32
//
unsigned alignofV(){
	return __alignof__(__tca256);
}

// CHECK-LABEL: @sizeofV(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    ret i32 32
//
unsigned sizeofV(){
	return sizeof(__tca256);
}

// CHECK-LABEL: @alignofW(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    ret i32 32
//
unsigned alignofW(){
	return __alignof__(__tca512);
}

// CHECK-LABEL: @sizeofW(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    ret i32 64
//
unsigned sizeofW(){
	return sizeof(__tca512);
}

// CHECK-LABEL: @alignofM(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    ret i32 32
//
unsigned alignofM(){
	return __alignof__(__tca1024);
}

// CHECK-LABEL: @sizeofM(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    ret i32 128
//
unsigned sizeofM(){
	return sizeof(__tca1024);
}
