; RUN: llc -disable-kvx-hwloops=false -O2 -o - %s | FileCheck %s
target triple = "kvx-kalray-cos"

; The test ensures no regressions after T12896 bugfix:
; llvm: assertion error on `getNumber() >= 0 && "cannot get label for unreachable MBB"'
; from C source code:

; short a;
; b;
; c() {
;   int d, e;
;   d = 0;
;   for (; d < b; d++)
;     e >>= 6;
;   a = e;
; }

; For Release with no Assertions builds, check for illegal symbols:
; CHECK-NOT: {{LBB[0-9]+_-1}}

@b = common global i32 0, align 4
@a = common global i16 0, align 2

define i32 @c() #0 {

entry:
  %0 = load i32, i32* @b, align 4
  %cmp4 = icmp sgt i32 %0, 0
  br i1 %cmp4, label %for.body, label %for.end

for.body:
  %e.06 = phi i32 [ %shr, %for.body ], [ undef, %entry ]
  %d.05 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %shr = ashr i32 %e.06, 6
  %inc = add nuw nsw i32 %d.05, 1
  %cmp = icmp slt i32 %inc, %0
  br i1 %cmp, label %for.body, label %for.end.loopexit

for.end.loopexit:
  %phitmp = trunc i32 %shr to i16
  br label %for.end

for.end:
  %e.0.lcssa = phi i16 [ undef, %entry ], [ %phitmp, %for.end.loopexit ]
  store i16 %e.0.lcssa, i16* @a, align 2
  ret i32 undef
}
