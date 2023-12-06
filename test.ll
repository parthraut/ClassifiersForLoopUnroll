; ModuleID = 'dataset/fir.c'
source_filename = "dataset/fir.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@fir_lpf37 = dso_local global [37 x float] [float 0xBF4554FBE0000000, float 0xBF6E44FA00000000, float 0xBF44940BC0000000, float 0x3F799ED7C0000000, float 0x3F70A45D40000000, float 0xBF80C56500000000, float 0xBF84DC65C0000000, float 0x3F80121680000000, float 0x3F936C58E0000000, float 0xBF68FE6920000000, float 0xBF9E5FB720000000, float 0xBF8290ABC0000000, float 0x3FA4EB7880000000, float 0x3FA124D0A0000000, float 0xBFA9FC8F40000000, float 0xBFB60B1BC0000000, float 0x3FAD79AF20000000, float 0x3FD3EC6BC0000000, float 0x3FDC28F5C0000000, float 0x3FD3EC6BC0000000, float 0x3FAD79AF20000000, float 0xBFB60B1BC0000000, float 0xBFA9FC8F40000000, float 0x3FA124D0A0000000, float 0x3FA4EB7880000000, float 0xBF8290ABC0000000, float 0xBF9E5FB720000000, float 0xBF68FE6920000000, float 0x3F936C58E0000000, float 0x3F80121680000000, float 0xBF84DC65C0000000, float 0xBF80C56500000000, float 0x3F70A45D40000000, float 0x3F799ED7C0000000, float 0xBF44940BC0000000, float 0xBF6E44FA00000000, float 0xBF4554FBE0000000], align 16, !dbg !0
@rand.next = internal global i64 1, align 8, !dbg !8
@sigma = dso_local global float 0x3FC99999A0000000, align 4, !dbg !16
@main.hist = internal global [34 x float] zeroinitializer, align 16, !dbg !18
@Cnt1 = dso_local global i32 0, align 4, !dbg !24
@Cnt2 = dso_local global i32 0, align 4, !dbg !26
@Cnt3 = dso_local global i32 0, align 4, !dbg !28
@Cnt4 = dso_local global i32 0, align 4, !dbg !30
@gaussian.ready = internal global i32 0, align 4, !dbg !32
@gaussian.gstore = internal global float 0.000000e+00, align 4, !dbg !37
@gaussian.rconst1 = internal global float 0x3F10000000000000, align 4, !dbg !39
@gaussian.rconst2 = internal global float 1.638400e+04, align 4, !dbg !41

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @rand() #0 !dbg !10 {
  %1 = load i64, i64* @rand.next, align 8, !dbg !54
  %2 = mul i64 %1, 1103515245, !dbg !55
  %3 = add i64 %2, 12345, !dbg !56
  store i64 %3, i64* @rand.next, align 8, !dbg !57
  %4 = load i64, i64* @rand.next, align 8, !dbg !58
  %5 = udiv i64 %4, 65536, !dbg !59
  %6 = trunc i64 %5 to i32, !dbg !60
  %7 = urem i32 %6, 32768, !dbg !61
  ret i32 %7, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local float @fir_filter(float noundef %0, float* noundef %1, i32 noundef %2, float* noundef %3) #0 !dbg !63 {
  %5 = alloca float, align 4
  %6 = alloca float*, align 8
  %7 = alloca i32, align 4
  %8 = alloca float*, align 8
  %9 = alloca i32, align 4
  %10 = alloca float*, align 8
  %11 = alloca float*, align 8
  %12 = alloca float*, align 8
  %13 = alloca float, align 4
  store float %0, float* %5, align 4
  call void @llvm.dbg.declare(metadata float* %5, metadata !67, metadata !DIExpression()), !dbg !68
  store float* %1, float** %6, align 8
  call void @llvm.dbg.declare(metadata float** %6, metadata !69, metadata !DIExpression()), !dbg !70
  store i32 %2, i32* %7, align 4
  call void @llvm.dbg.declare(metadata i32* %7, metadata !71, metadata !DIExpression()), !dbg !72
  store float* %3, float** %8, align 8
  call void @llvm.dbg.declare(metadata float** %8, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i32* %9, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata float** %10, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata float** %11, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata float** %12, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata float* %13, metadata !83, metadata !DIExpression()), !dbg !84
  %14 = load float*, float** %8, align 8, !dbg !85
  store float* %14, float** %10, align 8, !dbg !86
  %15 = load float*, float** %10, align 8, !dbg !87
  store float* %15, float** %11, align 8, !dbg !88
  %16 = load float*, float** %6, align 8, !dbg !89
  %17 = load i32, i32* %7, align 4, !dbg !90
  %18 = sext i32 %17 to i64, !dbg !91
  %19 = getelementptr inbounds float, float* %16, i64 %18, !dbg !91
  %20 = getelementptr inbounds float, float* %19, i64 -1, !dbg !92
  store float* %20, float** %12, align 8, !dbg !93
  %21 = load float*, float** %10, align 8, !dbg !94
  %22 = getelementptr inbounds float, float* %21, i32 1, !dbg !94
  store float* %22, float** %10, align 8, !dbg !94
  %23 = load float, float* %21, align 4, !dbg !95
  %24 = load float*, float** %12, align 8, !dbg !96
  %25 = getelementptr inbounds float, float* %24, i32 -1, !dbg !96
  store float* %25, float** %12, align 8, !dbg !96
  %26 = load float, float* %24, align 4, !dbg !97
  %27 = fmul float %23, %26, !dbg !98
  store float %27, float* %13, align 4, !dbg !99
  store i32 2, i32* %9, align 4, !dbg !100
  br label %28, !dbg !102

28:                                               ; preds = %45, %4
  %29 = load i32, i32* %9, align 4, !dbg !103
  %30 = load i32, i32* %7, align 4, !dbg !105
  %31 = icmp slt i32 %29, %30, !dbg !106
  br i1 %31, label %32, label %48, !dbg !107

32:                                               ; preds = %28
  %33 = load float*, float** %10, align 8, !dbg !108
  %34 = load float, float* %33, align 4, !dbg !110
  %35 = load float*, float** %11, align 8, !dbg !111
  %36 = getelementptr inbounds float, float* %35, i32 1, !dbg !111
  store float* %36, float** %11, align 8, !dbg !111
  store float %34, float* %35, align 4, !dbg !112
  %37 = load float*, float** %10, align 8, !dbg !113
  %38 = getelementptr inbounds float, float* %37, i32 1, !dbg !113
  store float* %38, float** %10, align 8, !dbg !113
  %39 = load float, float* %37, align 4, !dbg !114
  %40 = load float*, float** %12, align 8, !dbg !115
  %41 = getelementptr inbounds float, float* %40, i32 -1, !dbg !115
  store float* %41, float** %12, align 8, !dbg !115
  %42 = load float, float* %40, align 4, !dbg !116
  %43 = load float, float* %13, align 4, !dbg !117
  %44 = call float @llvm.fmuladd.f32(float %39, float %42, float %43), !dbg !117
  store float %44, float* %13, align 4, !dbg !117
  br label %45, !dbg !118

45:                                               ; preds = %32
  %46 = load i32, i32* %9, align 4, !dbg !119
  %47 = add nsw i32 %46, 1, !dbg !119
  store i32 %47, i32* %9, align 4, !dbg !119
  br label %28, !dbg !120, !llvm.loop !121

48:                                               ; preds = %28
  %49 = load float, float* %5, align 4, !dbg !124
  %50 = load float*, float** %12, align 8, !dbg !125
  %51 = load float, float* %50, align 4, !dbg !126
  %52 = load float, float* %13, align 4, !dbg !127
  %53 = call float @llvm.fmuladd.f32(float %49, float %51, float %52), !dbg !127
  store float %53, float* %13, align 4, !dbg !127
  %54 = load float, float* %5, align 4, !dbg !128
  %55 = load float*, float** %11, align 8, !dbg !129
  store float %54, float* %55, align 4, !dbg !130
  %56 = load float, float* %13, align 4, !dbg !131
  ret float %56, !dbg !132
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: noinline nounwind uwtable
define dso_local float @getRandomFloat() #0 !dbg !133 {
  %1 = call i32 @rand(), !dbg !134
  %2 = sitofp i32 %1 to float, !dbg !135
  %3 = fdiv float %2, 3.276800e+04, !dbg !136
  ret float %3, !dbg !137
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !20 {
  %1 = alloca i32, align 4
  %2 = alloca [1000000 x float], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca float, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata [1000000 x float]* %2, metadata !138, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata i32* %3, metadata !143, metadata !DIExpression()), !dbg !145
  store i32 0, i32* %3, align 4, !dbg !145
  br label %7, !dbg !146

7:                                                ; preds = %15, %0
  %8 = load i32, i32* %3, align 4, !dbg !147
  %9 = icmp slt i32 %8, 1000000, !dbg !149
  br i1 %9, label %10, label %18, !dbg !150

10:                                               ; preds = %7
  %11 = call float @getRandomFloat(), !dbg !151
  %12 = load i32, i32* %3, align 4, !dbg !153
  %13 = sext i32 %12 to i64, !dbg !154
  %14 = getelementptr inbounds [1000000 x float], [1000000 x float]* %2, i64 0, i64 %13, !dbg !154
  store float %11, float* %14, align 4, !dbg !155
  br label %15, !dbg !156

15:                                               ; preds = %10
  %16 = load i32, i32* %3, align 4, !dbg !157
  %17 = add nsw i32 %16, 1, !dbg !157
  store i32 %17, i32* %3, align 4, !dbg !157
  br label %7, !dbg !158, !llvm.loop !159

18:                                               ; preds = %7
  call void @llvm.dbg.declare(metadata i32* %4, metadata !161, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.declare(metadata i32* %5, metadata !163, metadata !DIExpression()), !dbg !164
  call void @llvm.dbg.declare(metadata float* %6, metadata !165, metadata !DIExpression()), !dbg !166
  store i32 0, i32* %4, align 4, !dbg !167
  br label %19, !dbg !169

19:                                               ; preds = %38, %18
  %20 = load i32, i32* %4, align 4, !dbg !170
  %21 = icmp slt i32 %20, 100000, !dbg !172
  br i1 %21, label %22, label %41, !dbg !173

22:                                               ; preds = %19
  %23 = load i32, i32* %4, align 4, !dbg !174
  %24 = sitofp i32 %23 to double, !dbg !174
  %25 = fmul double 0x3FD41B2F769CF0E0, %24, !dbg !176
  %26 = fptrunc double %25 to float, !dbg !177
  %27 = call float @sin(float noundef %26), !dbg !178
  %28 = load float, float* @sigma, align 4, !dbg !179
  %29 = call float @gaussian(), !dbg !180
  %30 = call float @llvm.fmuladd.f32(float %28, float %29, float %27), !dbg !181
  store float %30, float* %6, align 4, !dbg !182
  %31 = load float, float* %6, align 4, !dbg !183
  %32 = fpext float %31 to double, !dbg !183
  %33 = fmul double %32, 2.500000e+04, !dbg !183
  %34 = fptrunc double %33 to float, !dbg !183
  store float %34, float* %6, align 4, !dbg !183
  %35 = load float, float* %6, align 4, !dbg !184
  %36 = getelementptr inbounds [1000000 x float], [1000000 x float]* %2, i64 0, i64 0, !dbg !185
  %37 = call float @fir_filter(float noundef %35, float* noundef %36, i32 noundef 35, float* noundef getelementptr inbounds ([34 x float], [34 x float]* @main.hist, i64 0, i64 0)), !dbg !186
  br label %38, !dbg !187

38:                                               ; preds = %22
  %39 = load i32, i32* %4, align 4, !dbg !188
  %40 = add nsw i32 %39, 1, !dbg !188
  store i32 %40, i32* %4, align 4, !dbg !188
  br label %19, !dbg !189, !llvm.loop !190

41:                                               ; preds = %19
  store i32 0, i32* %4, align 4, !dbg !192
  br label %42, !dbg !194

42:                                               ; preds = %58, %41
  %43 = load i32, i32* %4, align 4, !dbg !195
  %44 = icmp slt i32 %43, 100000, !dbg !197
  br i1 %44, label %45, label %61, !dbg !198

45:                                               ; preds = %42
  %46 = load i32, i32* %4, align 4, !dbg !199
  %47 = sitofp i32 %46 to double, !dbg !199
  %48 = fmul double 0x3FD41B2F769CF0E0, %47, !dbg !201
  %49 = fptrunc double %48 to float, !dbg !202
  %50 = call float @sin(float noundef %49), !dbg !203
  %51 = load float, float* @sigma, align 4, !dbg !204
  %52 = call float @gaussian(), !dbg !205
  %53 = call float @llvm.fmuladd.f32(float %51, float %52, float %50), !dbg !206
  store float %53, float* %6, align 4, !dbg !207
  %54 = load float, float* %6, align 4, !dbg !208
  %55 = fpext float %54 to double, !dbg !208
  %56 = fmul double %55, 2.500000e+04, !dbg !208
  %57 = fptrunc double %56 to float, !dbg !208
  store float %57, float* %6, align 4, !dbg !208
  br label %58, !dbg !209

58:                                               ; preds = %45
  %59 = load i32, i32* %4, align 4, !dbg !210
  %60 = add nsw i32 %59, 1, !dbg !210
  store i32 %60, i32* %4, align 4, !dbg !210
  br label %42, !dbg !211, !llvm.loop !212

61:                                               ; preds = %42
  %62 = load i32, i32* %1, align 4, !dbg !214
  ret i32 %62, !dbg !214
}

; Function Attrs: noinline nounwind uwtable
define internal float @sin(float noundef %0) #0 !dbg !215 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = alloca i32, align 4
  store float %0, float* %2, align 4
  call void @llvm.dbg.declare(metadata float* %2, metadata !218, metadata !DIExpression()), !dbg !219
  call void @llvm.dbg.declare(metadata float* %3, metadata !220, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.declare(metadata float* %4, metadata !222, metadata !DIExpression()), !dbg !223
  call void @llvm.dbg.declare(metadata i32* %5, metadata !224, metadata !DIExpression()), !dbg !225
  store i32 1, i32* %5, align 4, !dbg !225
  br label %6, !dbg !226

6:                                                ; preds = %10, %1
  %7 = load float, float* %2, align 4, !dbg !227
  %8 = fpext float %7 to double, !dbg !227
  %9 = fcmp ogt double %8, 0x401921FB54442D18, !dbg !228
  br i1 %9, label %10, label %15, !dbg !226

10:                                               ; preds = %6
  %11 = load float, float* %2, align 4, !dbg !229
  %12 = fpext float %11 to double, !dbg !229
  %13 = fsub double %12, 0x401921FB54442D18, !dbg !229
  %14 = fptrunc double %13 to float, !dbg !229
  store float %14, float* %2, align 4, !dbg !229
  br label %6, !dbg !226, !llvm.loop !230

15:                                               ; preds = %6
  br label %16, !dbg !232

16:                                               ; preds = %20, %15
  %17 = load float, float* %2, align 4, !dbg !233
  %18 = fpext float %17 to double, !dbg !233
  %19 = fcmp olt double %18, 0xC01921FB54442D18, !dbg !234
  br i1 %19, label %20, label %25, !dbg !232

20:                                               ; preds = %16
  %21 = load float, float* %2, align 4, !dbg !235
  %22 = fpext float %21 to double, !dbg !235
  %23 = fadd double %22, 0x401921FB54442D18, !dbg !235
  %24 = fptrunc double %23 to float, !dbg !235
  store float %24, float* %2, align 4, !dbg !235
  br label %16, !dbg !232, !llvm.loop !236

25:                                               ; preds = %16
  %26 = load float, float* %2, align 4, !dbg !238
  store float %26, float* %4, align 4, !dbg !239
  store float %26, float* %3, align 4, !dbg !240
  %27 = load float, float* %4, align 4, !dbg !241
  %28 = load float, float* %2, align 4, !dbg !242
  %29 = load float, float* %2, align 4, !dbg !243
  %30 = fmul float %28, %29, !dbg !244
  %31 = fneg float %30, !dbg !245
  %32 = fmul float %27, %31, !dbg !246
  %33 = fpext float %32 to double, !dbg !247
  %34 = load i32, i32* %5, align 4, !dbg !248
  %35 = sitofp i32 %34 to double, !dbg !248
  %36 = fmul double 2.000000e+00, %35, !dbg !249
  %37 = load i32, i32* %5, align 4, !dbg !250
  %38 = sitofp i32 %37 to double, !dbg !250
  %39 = call double @llvm.fmuladd.f64(double 2.000000e+00, double %38, double 1.000000e+00), !dbg !251
  %40 = fmul double %36, %39, !dbg !252
  %41 = fdiv double %33, %40, !dbg !253
  %42 = fptrunc double %41 to float, !dbg !247
  store float %42, float* %4, align 4, !dbg !254
  %43 = load float, float* %3, align 4, !dbg !255
  %44 = load float, float* %4, align 4, !dbg !256
  %45 = fadd float %43, %44, !dbg !257
  store float %45, float* %3, align 4, !dbg !258
  %46 = load i32, i32* %5, align 4, !dbg !259
  %47 = add nsw i32 %46, 1, !dbg !259
  store i32 %47, i32* %5, align 4, !dbg !259
  br label %48, !dbg !260

48:                                               ; preds = %53, %25
  %49 = load float, float* %4, align 4, !dbg !261
  %50 = call float @fabs(float noundef %49), !dbg !262
  %51 = fpext float %50 to double, !dbg !262
  %52 = fcmp oge double %51, 1.000000e-05, !dbg !263
  br i1 %52, label %53, label %75, !dbg !260

53:                                               ; preds = %48
  %54 = load float, float* %4, align 4, !dbg !264
  %55 = load float, float* %2, align 4, !dbg !266
  %56 = load float, float* %2, align 4, !dbg !267
  %57 = fmul float %55, %56, !dbg !268
  %58 = fneg float %57, !dbg !269
  %59 = fmul float %54, %58, !dbg !270
  %60 = fpext float %59 to double, !dbg !271
  %61 = load i32, i32* %5, align 4, !dbg !272
  %62 = sitofp i32 %61 to double, !dbg !272
  %63 = fmul double 2.000000e+00, %62, !dbg !273
  %64 = load i32, i32* %5, align 4, !dbg !274
  %65 = sitofp i32 %64 to double, !dbg !274
  %66 = call double @llvm.fmuladd.f64(double 2.000000e+00, double %65, double 1.000000e+00), !dbg !275
  %67 = fmul double %63, %66, !dbg !276
  %68 = fdiv double %60, %67, !dbg !277
  %69 = fptrunc double %68 to float, !dbg !271
  store float %69, float* %4, align 4, !dbg !278
  %70 = load float, float* %3, align 4, !dbg !279
  %71 = load float, float* %4, align 4, !dbg !280
  %72 = fadd float %70, %71, !dbg !281
  store float %72, float* %3, align 4, !dbg !282
  %73 = load i32, i32* %5, align 4, !dbg !283
  %74 = add nsw i32 %73, 1, !dbg !283
  store i32 %74, i32* %5, align 4, !dbg !283
  br label %48, !dbg !260, !llvm.loop !284

75:                                               ; preds = %48
  %76 = load float, float* %3, align 4, !dbg !286
  ret float %76, !dbg !287
}

; Function Attrs: noinline nounwind uwtable
define internal float @gaussian() #0 !dbg !34 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  call void @llvm.dbg.declare(metadata float* %1, metadata !288, metadata !DIExpression()), !dbg !289
  call void @llvm.dbg.declare(metadata float* %2, metadata !290, metadata !DIExpression()), !dbg !291
  call void @llvm.dbg.declare(metadata float* %3, metadata !292, metadata !DIExpression()), !dbg !293
  call void @llvm.dbg.declare(metadata float* %4, metadata !294, metadata !DIExpression()), !dbg !295
  call void @llvm.dbg.declare(metadata float* %5, metadata !296, metadata !DIExpression()), !dbg !297
  %6 = load i32, i32* @gaussian.ready, align 4, !dbg !298
  %7 = icmp eq i32 %6, 0, !dbg !300
  br i1 %7, label %8, label %61, !dbg !301

8:                                                ; preds = %0
  %9 = call i32 @rand(), !dbg !302
  %10 = sitofp i32 %9 to float, !dbg !304
  %11 = load float, float* @gaussian.rconst2, align 4, !dbg !305
  %12 = fsub float %10, %11, !dbg !306
  store float %12, float* %1, align 4, !dbg !307
  %13 = call i32 @rand(), !dbg !308
  %14 = sitofp i32 %13 to float, !dbg !309
  %15 = load float, float* @gaussian.rconst2, align 4, !dbg !310
  %16 = fsub float %14, %15, !dbg !311
  store float %16, float* %2, align 4, !dbg !312
  %17 = load float, float* @gaussian.rconst1, align 4, !dbg !313
  %18 = load float, float* %1, align 4, !dbg !314
  %19 = fmul float %18, %17, !dbg !314
  store float %19, float* %1, align 4, !dbg !314
  %20 = load float, float* @gaussian.rconst1, align 4, !dbg !315
  %21 = load float, float* %2, align 4, !dbg !316
  %22 = fmul float %21, %20, !dbg !316
  store float %22, float* %2, align 4, !dbg !316
  %23 = load float, float* %1, align 4, !dbg !317
  %24 = load float, float* %1, align 4, !dbg !318
  %25 = load float, float* %2, align 4, !dbg !319
  %26 = load float, float* %2, align 4, !dbg !320
  %27 = fmul float %25, %26, !dbg !321
  %28 = call float @llvm.fmuladd.f32(float %23, float %24, float %27), !dbg !322
  store float %28, float* %3, align 4, !dbg !323
  br label %29, !dbg !324

29:                                               ; preds = %32, %8
  %30 = load float, float* %3, align 4, !dbg !325
  %31 = fcmp ogt float %30, 1.000000e+00, !dbg !326
  br i1 %31, label %32, label %53, !dbg !324

32:                                               ; preds = %29
  %33 = call i32 @rand(), !dbg !327
  %34 = sitofp i32 %33 to float, !dbg !329
  %35 = load float, float* @gaussian.rconst2, align 4, !dbg !330
  %36 = fsub float %34, %35, !dbg !331
  store float %36, float* %1, align 4, !dbg !332
  %37 = call i32 @rand(), !dbg !333
  %38 = sitofp i32 %37 to float, !dbg !334
  %39 = load float, float* @gaussian.rconst2, align 4, !dbg !335
  %40 = fsub float %38, %39, !dbg !336
  store float %40, float* %2, align 4, !dbg !337
  %41 = load float, float* @gaussian.rconst1, align 4, !dbg !338
  %42 = load float, float* %1, align 4, !dbg !339
  %43 = fmul float %42, %41, !dbg !339
  store float %43, float* %1, align 4, !dbg !339
  %44 = load float, float* @gaussian.rconst1, align 4, !dbg !340
  %45 = load float, float* %2, align 4, !dbg !341
  %46 = fmul float %45, %44, !dbg !341
  store float %46, float* %2, align 4, !dbg !341
  %47 = load float, float* %1, align 4, !dbg !342
  %48 = load float, float* %1, align 4, !dbg !343
  %49 = load float, float* %2, align 4, !dbg !344
  %50 = load float, float* %2, align 4, !dbg !345
  %51 = fmul float %49, %50, !dbg !346
  %52 = call float @llvm.fmuladd.f32(float %47, float %48, float %51), !dbg !347
  store float %52, float* %3, align 4, !dbg !348
  br label %29, !dbg !324, !llvm.loop !349

53:                                               ; preds = %29
  %54 = call float @sqrt(float noundef 0xBFC99999A0000000), !dbg !351
  store float %54, float* %4, align 4, !dbg !352
  %55 = load float, float* %1, align 4, !dbg !353
  %56 = load float, float* %4, align 4, !dbg !354
  %57 = fmul float %55, %56, !dbg !355
  store float %57, float* @gaussian.gstore, align 4, !dbg !356
  %58 = load float, float* %2, align 4, !dbg !357
  %59 = load float, float* %4, align 4, !dbg !358
  %60 = fmul float %58, %59, !dbg !359
  store float %60, float* %5, align 4, !dbg !360
  store i32 1, i32* @gaussian.ready, align 4, !dbg !361
  br label %63, !dbg !362

61:                                               ; preds = %0
  store i32 0, i32* @gaussian.ready, align 4, !dbg !363
  %62 = load float, float* @gaussian.gstore, align 4, !dbg !365
  store float %62, float* %5, align 4, !dbg !366
  br label %63

63:                                               ; preds = %61, %53
  %64 = load float, float* %5, align 4, !dbg !367
  ret float %64, !dbg !368
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: noinline nounwind uwtable
define internal float @fabs(float noundef %0) #0 !dbg !369 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  store float %0, float* %2, align 4
  call void @llvm.dbg.declare(metadata float* %2, metadata !370, metadata !DIExpression()), !dbg !371
  call void @llvm.dbg.declare(metadata float* %3, metadata !372, metadata !DIExpression()), !dbg !373
  %4 = load float, float* %2, align 4, !dbg !374
  %5 = fcmp oge float %4, 0.000000e+00, !dbg !376
  br i1 %5, label %6, label %8, !dbg !377

6:                                                ; preds = %1
  %7 = load float, float* %2, align 4, !dbg !378
  store float %7, float* %3, align 4, !dbg !379
  br label %11, !dbg !380

8:                                                ; preds = %1
  %9 = load float, float* %2, align 4, !dbg !381
  %10 = fneg float %9, !dbg !382
  store float %10, float* %3, align 4, !dbg !383
  br label %11

11:                                               ; preds = %8, %6
  %12 = load float, float* %3, align 4, !dbg !384
  ret float %12, !dbg !385
}

; Function Attrs: noinline nounwind uwtable
define internal float @sqrt(float noundef %0) #0 !dbg !386 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store float %0, float* %2, align 4
  call void @llvm.dbg.declare(metadata float* %2, metadata !387, metadata !DIExpression()), !dbg !388
  call void @llvm.dbg.declare(metadata float* %3, metadata !389, metadata !DIExpression()), !dbg !390
  %9 = load float, float* %2, align 4, !dbg !391
  %10 = fdiv float %9, 1.000000e+01, !dbg !392
  store float %10, float* %3, align 4, !dbg !390
  call void @llvm.dbg.declare(metadata float* %4, metadata !393, metadata !DIExpression()), !dbg !394
  call void @llvm.dbg.declare(metadata double* %5, metadata !395, metadata !DIExpression()), !dbg !397
  call void @llvm.dbg.declare(metadata double* %6, metadata !398, metadata !DIExpression()), !dbg !399
  store double 1.000000e-05, double* %6, align 8, !dbg !399
  call void @llvm.dbg.declare(metadata i32* %7, metadata !400, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.declare(metadata i32* %8, metadata !402, metadata !DIExpression()), !dbg !403
  store i32 0, i32* %8, align 4, !dbg !404
  %11 = load float, float* %2, align 4, !dbg !405
  %12 = fcmp oeq float %11, 0.000000e+00, !dbg !407
  br i1 %12, label %13, label %14, !dbg !408

13:                                               ; preds = %1
  store float 0.000000e+00, float* %3, align 4, !dbg !409
  br label %57, !dbg !410

14:                                               ; preds = %1
  store i32 1, i32* %7, align 4, !dbg !411
  br label %15, !dbg !414

15:                                               ; preds = %53, %14
  %16 = load i32, i32* %7, align 4, !dbg !415
  %17 = icmp slt i32 %16, 20, !dbg !417
  br i1 %17, label %18, label %56, !dbg !418

18:                                               ; preds = %15
  %19 = load i32, i32* %8, align 4, !dbg !419
  %20 = icmp ne i32 %19, 0, !dbg !419
  br i1 %20, label %50, label %21, !dbg !422

21:                                               ; preds = %18
  %22 = load float, float* %2, align 4, !dbg !423
  %23 = load float, float* %3, align 4, !dbg !425
  %24 = load float, float* %3, align 4, !dbg !426
  %25 = fneg float %23, !dbg !427
  %26 = call float @llvm.fmuladd.f32(float %25, float %24, float %22), !dbg !427
  %27 = fpext float %26 to double, !dbg !428
  %28 = load float, float* %3, align 4, !dbg !429
  %29 = fpext float %28 to double, !dbg !429
  %30 = fmul double 2.000000e+00, %29, !dbg !430
  %31 = fdiv double %27, %30, !dbg !431
  %32 = fptrunc double %31 to float, !dbg !428
  store float %32, float* %4, align 4, !dbg !432
  %33 = load float, float* %3, align 4, !dbg !433
  %34 = load float, float* %4, align 4, !dbg !434
  %35 = fadd float %33, %34, !dbg !435
  store float %35, float* %3, align 4, !dbg !436
  %36 = load float, float* %2, align 4, !dbg !437
  %37 = load float, float* %3, align 4, !dbg !438
  %38 = load float, float* %3, align 4, !dbg !439
  %39 = fneg float %37, !dbg !440
  %40 = call float @llvm.fmuladd.f32(float %39, float %38, float %36), !dbg !440
  %41 = fpext float %40 to double, !dbg !437
  store double %41, double* %5, align 8, !dbg !441
  %42 = load double, double* %5, align 8, !dbg !442
  %43 = fptrunc double %42 to float, !dbg !442
  %44 = call float @fabs(float noundef %43), !dbg !444
  %45 = fpext float %44 to double, !dbg !444
  %46 = load double, double* %6, align 8, !dbg !445
  %47 = fcmp ole double %45, %46, !dbg !446
  br i1 %47, label %48, label %49, !dbg !447

48:                                               ; preds = %21
  store i32 1, i32* %8, align 4, !dbg !448
  br label %49, !dbg !449

49:                                               ; preds = %48, %21
  br label %52, !dbg !450

50:                                               ; preds = %18
  %51 = load float, float* %3, align 4, !dbg !451
  store float %51, float* %3, align 4, !dbg !452
  br label %52

52:                                               ; preds = %50, %49
  br label %53, !dbg !453

53:                                               ; preds = %52
  %54 = load i32, i32* %7, align 4, !dbg !454
  %55 = add nsw i32 %54, 1, !dbg !454
  store i32 %55, i32* %7, align 4, !dbg !454
  br label %15, !dbg !455, !llvm.loop !456

56:                                               ; preds = %15
  br label %57

57:                                               ; preds = %56, %13
  %58 = load float, float* %3, align 4, !dbg !458
  ret float %58, !dbg !459
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!46, !47, !48, !49, !50, !51, !52}
!llvm.ident = !{!53}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "fir_lpf37", scope: !2, file: !3, line: 79, type: !43, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "dataset/fir.c", directory: "/home/praut/CompilersFinalProject", checksumkind: CSK_MD5, checksum: "1bf11b04134ce57eca20241032e261b2")
!4 = !{!5, !6}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!7 = !{!0, !8, !16, !18, !24, !26, !28, !30, !32, !37, !39, !41}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "next", scope: !10, file: !3, line: 114, type: !15, isLocal: true, isDefinition: true)
!10 = distinct !DISubprogram(name: "rand", scope: !3, file: !3, line: 112, type: !11, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !14)
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "sigma", scope: !2, file: !3, line: 288, type: !6, isLocal: false, isDefinition: true)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "hist", scope: !20, file: !3, line: 313, type: !21, isLocal: true, isDefinition: true)
!20 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 294, type: !11, scopeLine: 295, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !14)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 1088, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 34)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "Cnt1", scope: !2, file: !3, line: 109, type: !13, isLocal: false, isDefinition: true)
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "Cnt2", scope: !2, file: !3, line: 109, type: !13, isLocal: false, isDefinition: true)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(name: "Cnt3", scope: !2, file: !3, line: 109, type: !13, isLocal: false, isDefinition: true)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(name: "Cnt4", scope: !2, file: !3, line: 109, type: !13, isLocal: false, isDefinition: true)
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression())
!33 = distinct !DIGlobalVariable(name: "ready", scope: !34, file: !3, line: 234, type: !13, isLocal: true, isDefinition: true)
!34 = distinct !DISubprogram(name: "gaussian", scope: !3, file: !3, line: 232, type: !35, scopeLine: 233, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !14)
!35 = !DISubroutineType(types: !36)
!36 = !{!6}
!37 = !DIGlobalVariableExpression(var: !38, expr: !DIExpression())
!38 = distinct !DIGlobalVariable(name: "gstore", scope: !34, file: !3, line: 235, type: !6, isLocal: true, isDefinition: true)
!39 = !DIGlobalVariableExpression(var: !40, expr: !DIExpression())
!40 = distinct !DIGlobalVariable(name: "rconst1", scope: !34, file: !3, line: 236, type: !6, isLocal: true, isDefinition: true)
!41 = !DIGlobalVariableExpression(var: !42, expr: !DIExpression())
!42 = distinct !DIGlobalVariable(name: "rconst2", scope: !34, file: !3, line: 237, type: !6, isLocal: true, isDefinition: true)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 1184, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 37)
!46 = !{i32 7, !"Dwarf Version", i32 5}
!47 = !{i32 2, !"Debug Info Version", i32 3}
!48 = !{i32 1, !"wchar_size", i32 4}
!49 = !{i32 7, !"PIC Level", i32 2}
!50 = !{i32 7, !"PIE Level", i32 2}
!51 = !{i32 7, !"uwtable", i32 1}
!52 = !{i32 7, !"frame-pointer", i32 2}
!53 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!54 = !DILocation(line: 116, column: 10, scope: !10)
!55 = !DILocation(line: 116, column: 15, scope: !10)
!56 = !DILocation(line: 116, column: 28, scope: !10)
!57 = !DILocation(line: 116, column: 8, scope: !10)
!58 = !DILocation(line: 117, column: 25, scope: !10)
!59 = !DILocation(line: 117, column: 29, scope: !10)
!60 = !DILocation(line: 117, column: 10, scope: !10)
!61 = !DILocation(line: 117, column: 37, scope: !10)
!62 = !DILocation(line: 117, column: 3, scope: !10)
!63 = distinct !DISubprogram(name: "fir_filter", scope: !3, file: !3, line: 194, type: !64, scopeLine: 195, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !14)
!64 = !DISubroutineType(types: !65)
!65 = !{!6, !6, !66, !13, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!67 = !DILocalVariable(name: "input", arg: 1, scope: !63, file: !3, line: 194, type: !6)
!68 = !DILocation(line: 194, column: 24, scope: !63)
!69 = !DILocalVariable(name: "coef", arg: 2, scope: !63, file: !3, line: 194, type: !66)
!70 = !DILocation(line: 194, column: 37, scope: !63)
!71 = !DILocalVariable(name: "n", arg: 3, scope: !63, file: !3, line: 194, type: !13)
!72 = !DILocation(line: 194, column: 46, scope: !63)
!73 = !DILocalVariable(name: "history", arg: 4, scope: !63, file: !3, line: 194, type: !66)
!74 = !DILocation(line: 194, column: 55, scope: !63)
!75 = !DILocalVariable(name: "i", scope: !63, file: !3, line: 196, type: !13)
!76 = !DILocation(line: 196, column: 9, scope: !63)
!77 = !DILocalVariable(name: "hist_ptr", scope: !63, file: !3, line: 197, type: !66)
!78 = !DILocation(line: 197, column: 12, scope: !63)
!79 = !DILocalVariable(name: "hist1_ptr", scope: !63, file: !3, line: 197, type: !66)
!80 = !DILocation(line: 197, column: 22, scope: !63)
!81 = !DILocalVariable(name: "coef_ptr", scope: !63, file: !3, line: 197, type: !66)
!82 = !DILocation(line: 197, column: 33, scope: !63)
!83 = !DILocalVariable(name: "output", scope: !63, file: !3, line: 198, type: !6)
!84 = !DILocation(line: 198, column: 11, scope: !63)
!85 = !DILocation(line: 200, column: 16, scope: !63)
!86 = !DILocation(line: 200, column: 14, scope: !63)
!87 = !DILocation(line: 201, column: 17, scope: !63)
!88 = !DILocation(line: 201, column: 15, scope: !63)
!89 = !DILocation(line: 202, column: 16, scope: !63)
!90 = !DILocation(line: 202, column: 23, scope: !63)
!91 = !DILocation(line: 202, column: 21, scope: !63)
!92 = !DILocation(line: 202, column: 25, scope: !63)
!93 = !DILocation(line: 202, column: 14, scope: !63)
!94 = !DILocation(line: 205, column: 23, scope: !63)
!95 = !DILocation(line: 205, column: 14, scope: !63)
!96 = !DILocation(line: 205, column: 38, scope: !63)
!97 = !DILocation(line: 205, column: 29, scope: !63)
!98 = !DILocation(line: 205, column: 26, scope: !63)
!99 = !DILocation(line: 205, column: 12, scope: !63)
!100 = !DILocation(line: 209, column: 11, scope: !101)
!101 = distinct !DILexicalBlock(scope: !63, file: !3, line: 209, column: 5)
!102 = !DILocation(line: 209, column: 9, scope: !101)
!103 = !DILocation(line: 209, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !101, file: !3, line: 209, column: 5)
!105 = !DILocation(line: 209, column: 21, scope: !104)
!106 = !DILocation(line: 209, column: 19, scope: !104)
!107 = !DILocation(line: 209, column: 5, scope: !101)
!108 = !DILocation(line: 210, column: 25, scope: !109)
!109 = distinct !DILexicalBlock(scope: !104, file: !3, line: 209, column: 30)
!110 = !DILocation(line: 210, column: 24, scope: !109)
!111 = !DILocation(line: 210, column: 19, scope: !109)
!112 = !DILocation(line: 210, column: 22, scope: !109)
!113 = !DILocation(line: 211, column: 29, scope: !109)
!114 = !DILocation(line: 211, column: 20, scope: !109)
!115 = !DILocation(line: 211, column: 45, scope: !109)
!116 = !DILocation(line: 211, column: 36, scope: !109)
!117 = !DILocation(line: 211, column: 16, scope: !109)
!118 = !DILocation(line: 212, column: 5, scope: !109)
!119 = !DILocation(line: 209, column: 26, scope: !104)
!120 = !DILocation(line: 209, column: 5, scope: !104)
!121 = distinct !{!121, !107, !122, !123}
!122 = !DILocation(line: 212, column: 5, scope: !101)
!123 = !{!"llvm.loop.mustprogress"}
!124 = !DILocation(line: 213, column: 15, scope: !63)
!125 = !DILocation(line: 213, column: 25, scope: !63)
!126 = !DILocation(line: 213, column: 24, scope: !63)
!127 = !DILocation(line: 213, column: 12, scope: !63)
!128 = !DILocation(line: 214, column: 18, scope: !63)
!129 = !DILocation(line: 214, column: 6, scope: !63)
!130 = !DILocation(line: 214, column: 16, scope: !63)
!131 = !DILocation(line: 216, column: 12, scope: !63)
!132 = !DILocation(line: 216, column: 5, scope: !63)
!133 = distinct !DISubprogram(name: "getRandomFloat", scope: !3, file: !3, line: 290, type: !35, scopeLine: 290, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !14)
!134 = !DILocation(line: 291, column: 19, scope: !133)
!135 = !DILocation(line: 291, column: 12, scope: !133)
!136 = !DILocation(line: 291, column: 26, scope: !133)
!137 = !DILocation(line: 291, column: 5, scope: !133)
!138 = !DILocalVariable(name: "fir_lpf35", scope: !20, file: !3, line: 306, type: !139)
!139 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 32000000, elements: !140)
!140 = !{!141}
!141 = !DISubrange(count: 1000000)
!142 = !DILocation(line: 306, column: 9, scope: !20)
!143 = !DILocalVariable(name: "i", scope: !144, file: !3, line: 307, type: !13)
!144 = distinct !DILexicalBlock(scope: !20, file: !3, line: 307, column: 3)
!145 = !DILocation(line: 307, column: 12, scope: !144)
!146 = !DILocation(line: 307, column: 8, scope: !144)
!147 = !DILocation(line: 307, column: 19, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !3, line: 307, column: 3)
!149 = !DILocation(line: 307, column: 21, scope: !148)
!150 = !DILocation(line: 307, column: 3, scope: !144)
!151 = !DILocation(line: 308, column: 22, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !3, line: 307, column: 37)
!153 = !DILocation(line: 308, column: 17, scope: !152)
!154 = !DILocation(line: 308, column: 7, scope: !152)
!155 = !DILocation(line: 308, column: 20, scope: !152)
!156 = !DILocation(line: 309, column: 3, scope: !152)
!157 = !DILocation(line: 307, column: 32, scope: !148)
!158 = !DILocation(line: 307, column: 3, scope: !148)
!159 = distinct !{!159, !150, !160, !123}
!160 = !DILocation(line: 309, column: 3, scope: !144)
!161 = !DILocalVariable(name: "i", scope: !20, file: !3, line: 311, type: !13)
!162 = !DILocation(line: 311, column: 16, scope: !20)
!163 = !DILocalVariable(name: "j", scope: !20, file: !3, line: 311, type: !13)
!164 = !DILocation(line: 311, column: 19, scope: !20)
!165 = !DILocalVariable(name: "x", scope: !20, file: !3, line: 312, type: !6)
!166 = !DILocation(line: 312, column: 9, scope: !20)
!167 = !DILocation(line: 315, column: 9, scope: !168)
!168 = distinct !DILexicalBlock(scope: !20, file: !3, line: 315, column: 3)
!169 = !DILocation(line: 315, column: 7, scope: !168)
!170 = !DILocation(line: 315, column: 15, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !3, line: 315, column: 3)
!172 = !DILocation(line: 315, column: 17, scope: !171)
!173 = !DILocation(line: 315, column: 3, scope: !168)
!174 = !DILocation(line: 316, column: 25, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !3, line: 315, column: 33)
!176 = !DILocation(line: 316, column: 24, scope: !175)
!177 = !DILocation(line: 316, column: 15, scope: !175)
!178 = !DILocation(line: 316, column: 11, scope: !175)
!179 = !DILocation(line: 316, column: 30, scope: !175)
!180 = !DILocation(line: 316, column: 36, scope: !175)
!181 = !DILocation(line: 316, column: 28, scope: !175)
!182 = !DILocation(line: 316, column: 9, scope: !175)
!183 = !DILocation(line: 317, column: 9, scope: !175)
!184 = !DILocation(line: 318, column: 18, scope: !175)
!185 = !DILocation(line: 318, column: 20, scope: !175)
!186 = !DILocation(line: 318, column: 7, scope: !175)
!187 = !DILocation(line: 319, column: 3, scope: !175)
!188 = !DILocation(line: 315, column: 29, scope: !171)
!189 = !DILocation(line: 315, column: 3, scope: !171)
!190 = distinct !{!190, !173, !191, !123}
!191 = !DILocation(line: 319, column: 3, scope: !168)
!192 = !DILocation(line: 321, column: 9, scope: !193)
!193 = distinct !DILexicalBlock(scope: !20, file: !3, line: 321, column: 3)
!194 = !DILocation(line: 321, column: 7, scope: !193)
!195 = !DILocation(line: 321, column: 15, scope: !196)
!196 = distinct !DILexicalBlock(scope: !193, file: !3, line: 321, column: 3)
!197 = !DILocation(line: 321, column: 17, scope: !196)
!198 = !DILocation(line: 321, column: 3, scope: !193)
!199 = !DILocation(line: 322, column: 25, scope: !200)
!200 = distinct !DILexicalBlock(scope: !196, file: !3, line: 321, column: 33)
!201 = !DILocation(line: 322, column: 24, scope: !200)
!202 = !DILocation(line: 322, column: 15, scope: !200)
!203 = !DILocation(line: 322, column: 11, scope: !200)
!204 = !DILocation(line: 322, column: 30, scope: !200)
!205 = !DILocation(line: 322, column: 36, scope: !200)
!206 = !DILocation(line: 322, column: 28, scope: !200)
!207 = !DILocation(line: 322, column: 9, scope: !200)
!208 = !DILocation(line: 323, column: 9, scope: !200)
!209 = !DILocation(line: 324, column: 3, scope: !200)
!210 = !DILocation(line: 321, column: 29, scope: !196)
!211 = !DILocation(line: 321, column: 3, scope: !196)
!212 = distinct !{!212, !198, !213, !123}
!213 = !DILocation(line: 324, column: 3, scope: !193)
!214 = !DILocation(line: 329, column: 1, scope: !20)
!215 = distinct !DISubprogram(name: "sin", scope: !3, file: !3, line: 131, type: !216, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !14)
!216 = !DISubroutineType(types: !217)
!217 = !{!6, !6}
!218 = !DILocalVariable(name: "rad", arg: 1, scope: !215, file: !3, line: 131, type: !6)
!219 = !DILocation(line: 131, column: 24, scope: !215)
!220 = !DILocalVariable(name: "app", scope: !215, file: !3, line: 133, type: !6)
!221 = !DILocation(line: 133, column: 9, scope: !215)
!222 = !DILocalVariable(name: "diff", scope: !215, file: !3, line: 135, type: !6)
!223 = !DILocation(line: 135, column: 9, scope: !215)
!224 = !DILocalVariable(name: "inc", scope: !215, file: !3, line: 136, type: !13)
!225 = !DILocation(line: 136, column: 7, scope: !215)
!226 = !DILocation(line: 138, column: 3, scope: !215)
!227 = !DILocation(line: 138, column: 10, scope: !215)
!228 = !DILocation(line: 138, column: 14, scope: !215)
!229 = !DILocation(line: 139, column: 6, scope: !215)
!230 = distinct !{!230, !226, !231, !123}
!231 = !DILocation(line: 139, column: 11, scope: !215)
!232 = !DILocation(line: 140, column: 3, scope: !215)
!233 = !DILocation(line: 140, column: 10, scope: !215)
!234 = !DILocation(line: 140, column: 14, scope: !215)
!235 = !DILocation(line: 141, column: 9, scope: !215)
!236 = distinct !{!236, !232, !237, !123}
!237 = !DILocation(line: 141, column: 14, scope: !215)
!238 = !DILocation(line: 142, column: 16, scope: !215)
!239 = !DILocation(line: 142, column: 14, scope: !215)
!240 = !DILocation(line: 142, column: 7, scope: !215)
!241 = !DILocation(line: 143, column: 12, scope: !215)
!242 = !DILocation(line: 143, column: 22, scope: !215)
!243 = !DILocation(line: 143, column: 26, scope: !215)
!244 = !DILocation(line: 143, column: 25, scope: !215)
!245 = !DILocation(line: 143, column: 20, scope: !215)
!246 = !DILocation(line: 143, column: 17, scope: !215)
!247 = !DILocation(line: 143, column: 11, scope: !215)
!248 = !DILocation(line: 144, column: 15, scope: !215)
!249 = !DILocation(line: 144, column: 13, scope: !215)
!250 = !DILocation(line: 144, column: 29, scope: !215)
!251 = !DILocation(line: 144, column: 33, scope: !215)
!252 = !DILocation(line: 144, column: 20, scope: !215)
!253 = !DILocation(line: 143, column: 33, scope: !215)
!254 = !DILocation(line: 143, column: 9, scope: !215)
!255 = !DILocation(line: 145, column: 11, scope: !215)
!256 = !DILocation(line: 145, column: 17, scope: !215)
!257 = !DILocation(line: 145, column: 15, scope: !215)
!258 = !DILocation(line: 145, column: 9, scope: !215)
!259 = !DILocation(line: 146, column: 8, scope: !215)
!260 = !DILocation(line: 147, column: 3, scope: !215)
!261 = !DILocation(line: 147, column: 14, scope: !215)
!262 = !DILocation(line: 147, column: 9, scope: !215)
!263 = !DILocation(line: 147, column: 20, scope: !215)
!264 = !DILocation(line: 148, column: 13, scope: !265)
!265 = distinct !DILexicalBlock(scope: !215, file: !3, line: 147, column: 32)
!266 = !DILocation(line: 148, column: 23, scope: !265)
!267 = !DILocation(line: 148, column: 27, scope: !265)
!268 = !DILocation(line: 148, column: 26, scope: !265)
!269 = !DILocation(line: 148, column: 21, scope: !265)
!270 = !DILocation(line: 148, column: 18, scope: !265)
!271 = !DILocation(line: 148, column: 12, scope: !265)
!272 = !DILocation(line: 149, column: 15, scope: !265)
!273 = !DILocation(line: 149, column: 13, scope: !265)
!274 = !DILocation(line: 149, column: 29, scope: !265)
!275 = !DILocation(line: 149, column: 33, scope: !265)
!276 = !DILocation(line: 149, column: 20, scope: !265)
!277 = !DILocation(line: 148, column: 34, scope: !265)
!278 = !DILocation(line: 148, column: 10, scope: !265)
!279 = !DILocation(line: 150, column: 11, scope: !265)
!280 = !DILocation(line: 150, column: 17, scope: !265)
!281 = !DILocation(line: 150, column: 15, scope: !265)
!282 = !DILocation(line: 150, column: 9, scope: !265)
!283 = !DILocation(line: 151, column: 8, scope: !265)
!284 = distinct !{!284, !260, !285, !123}
!285 = !DILocation(line: 152, column: 3, scope: !215)
!286 = !DILocation(line: 154, column: 10, scope: !215)
!287 = !DILocation(line: 154, column: 3, scope: !215)
!288 = !DILocalVariable(name: "v1", scope: !34, file: !3, line: 238, type: !6)
!289 = !DILocation(line: 238, column: 11, scope: !34)
!290 = !DILocalVariable(name: "v2", scope: !34, file: !3, line: 238, type: !6)
!291 = !DILocation(line: 238, column: 14, scope: !34)
!292 = !DILocalVariable(name: "r", scope: !34, file: !3, line: 238, type: !6)
!293 = !DILocation(line: 238, column: 17, scope: !34)
!294 = !DILocalVariable(name: "fac", scope: !34, file: !3, line: 238, type: !6)
!295 = !DILocation(line: 238, column: 19, scope: !34)
!296 = !DILocalVariable(name: "gaus", scope: !34, file: !3, line: 239, type: !6)
!297 = !DILocation(line: 239, column: 11, scope: !34)
!298 = !DILocation(line: 242, column: 8, scope: !299)
!299 = distinct !DILexicalBlock(scope: !34, file: !3, line: 242, column: 8)
!300 = !DILocation(line: 242, column: 14, scope: !299)
!301 = !DILocation(line: 242, column: 8, scope: !34)
!302 = !DILocation(line: 243, column: 19, scope: !303)
!303 = distinct !DILexicalBlock(scope: !299, file: !3, line: 242, column: 20)
!304 = !DILocation(line: 243, column: 12, scope: !303)
!305 = !DILocation(line: 243, column: 28, scope: !303)
!306 = !DILocation(line: 243, column: 26, scope: !303)
!307 = !DILocation(line: 243, column: 10, scope: !303)
!308 = !DILocation(line: 244, column: 19, scope: !303)
!309 = !DILocation(line: 244, column: 12, scope: !303)
!310 = !DILocation(line: 244, column: 28, scope: !303)
!311 = !DILocation(line: 244, column: 26, scope: !303)
!312 = !DILocation(line: 244, column: 10, scope: !303)
!313 = !DILocation(line: 245, column: 13, scope: !303)
!314 = !DILocation(line: 245, column: 10, scope: !303)
!315 = !DILocation(line: 246, column: 13, scope: !303)
!316 = !DILocation(line: 246, column: 10, scope: !303)
!317 = !DILocation(line: 247, column: 11, scope: !303)
!318 = !DILocation(line: 247, column: 14, scope: !303)
!319 = !DILocation(line: 247, column: 19, scope: !303)
!320 = !DILocation(line: 247, column: 22, scope: !303)
!321 = !DILocation(line: 247, column: 21, scope: !303)
!322 = !DILocation(line: 247, column: 17, scope: !303)
!323 = !DILocation(line: 247, column: 9, scope: !303)
!324 = !DILocation(line: 248, column: 7, scope: !303)
!325 = !DILocation(line: 248, column: 13, scope: !303)
!326 = !DILocation(line: 248, column: 15, scope: !303)
!327 = !DILocation(line: 249, column: 14, scope: !328)
!328 = distinct !DILexicalBlock(scope: !303, file: !3, line: 248, column: 23)
!329 = !DILocation(line: 249, column: 7, scope: !328)
!330 = !DILocation(line: 249, column: 23, scope: !328)
!331 = !DILocation(line: 249, column: 21, scope: !328)
!332 = !DILocation(line: 249, column: 5, scope: !328)
!333 = !DILocation(line: 250, column: 14, scope: !328)
!334 = !DILocation(line: 250, column: 7, scope: !328)
!335 = !DILocation(line: 250, column: 23, scope: !328)
!336 = !DILocation(line: 250, column: 21, scope: !328)
!337 = !DILocation(line: 250, column: 5, scope: !328)
!338 = !DILocation(line: 251, column: 8, scope: !328)
!339 = !DILocation(line: 251, column: 5, scope: !328)
!340 = !DILocation(line: 252, column: 8, scope: !328)
!341 = !DILocation(line: 252, column: 5, scope: !328)
!342 = !DILocation(line: 253, column: 6, scope: !328)
!343 = !DILocation(line: 253, column: 9, scope: !328)
!344 = !DILocation(line: 253, column: 14, scope: !328)
!345 = !DILocation(line: 253, column: 17, scope: !328)
!346 = !DILocation(line: 253, column: 16, scope: !328)
!347 = !DILocation(line: 253, column: 12, scope: !328)
!348 = !DILocation(line: 253, column: 4, scope: !328)
!349 = distinct !{!349, !324, !350, !123}
!350 = !DILocation(line: 257, column: 7, scope: !303)
!351 = !DILocation(line: 261, column: 15, scope: !303)
!352 = !DILocation(line: 261, column: 13, scope: !303)
!353 = !DILocation(line: 262, column: 18, scope: !303)
!354 = !DILocation(line: 262, column: 21, scope: !303)
!355 = !DILocation(line: 262, column: 20, scope: !303)
!356 = !DILocation(line: 262, column: 16, scope: !303)
!357 = !DILocation(line: 263, column: 16, scope: !303)
!358 = !DILocation(line: 263, column: 19, scope: !303)
!359 = !DILocation(line: 263, column: 18, scope: !303)
!360 = !DILocation(line: 263, column: 14, scope: !303)
!361 = !DILocation(line: 264, column: 15, scope: !303)
!362 = !DILocation(line: 265, column: 5, scope: !303)
!363 = !DILocation(line: 268, column: 15, scope: !364)
!364 = distinct !DILexicalBlock(scope: !299, file: !3, line: 267, column: 10)
!365 = !DILocation(line: 269, column: 16, scope: !364)
!366 = !DILocation(line: 269, column: 14, scope: !364)
!367 = !DILocation(line: 272, column: 12, scope: !34)
!368 = !DILocation(line: 272, column: 5, scope: !34)
!369 = distinct !DISubprogram(name: "fabs", scope: !3, file: !3, line: 121, type: !216, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !14)
!370 = !DILocalVariable(name: "n", arg: 1, scope: !369, file: !3, line: 121, type: !6)
!371 = !DILocation(line: 121, column: 25, scope: !369)
!372 = !DILocalVariable(name: "f", scope: !369, file: !3, line: 123, type: !6)
!373 = !DILocation(line: 123, column: 9, scope: !369)
!374 = !DILocation(line: 125, column: 7, scope: !375)
!375 = distinct !DILexicalBlock(scope: !369, file: !3, line: 125, column: 7)
!376 = !DILocation(line: 125, column: 9, scope: !375)
!377 = !DILocation(line: 125, column: 7, scope: !369)
!378 = !DILocation(line: 125, column: 19, scope: !375)
!379 = !DILocation(line: 125, column: 17, scope: !375)
!380 = !DILocation(line: 125, column: 15, scope: !375)
!381 = !DILocation(line: 126, column: 13, scope: !375)
!382 = !DILocation(line: 126, column: 12, scope: !375)
!383 = !DILocation(line: 126, column: 10, scope: !375)
!384 = !DILocation(line: 127, column: 10, scope: !369)
!385 = !DILocation(line: 127, column: 3, scope: !369)
!386 = distinct !DISubprogram(name: "sqrt", scope: !3, file: !3, line: 164, type: !216, scopeLine: 165, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !14)
!387 = !DILocalVariable(name: "val", arg: 1, scope: !386, file: !3, line: 164, type: !6)
!388 = !DILocation(line: 164, column: 25, scope: !386)
!389 = !DILocalVariable(name: "x", scope: !386, file: !3, line: 166, type: !6)
!390 = !DILocation(line: 166, column: 9, scope: !386)
!391 = !DILocation(line: 166, column: 13, scope: !386)
!392 = !DILocation(line: 166, column: 16, scope: !386)
!393 = !DILocalVariable(name: "dx", scope: !386, file: !3, line: 168, type: !6)
!394 = !DILocation(line: 168, column: 9, scope: !386)
!395 = !DILocalVariable(name: "diff", scope: !386, file: !3, line: 170, type: !396)
!396 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!397 = !DILocation(line: 170, column: 10, scope: !386)
!398 = !DILocalVariable(name: "min_tol", scope: !386, file: !3, line: 171, type: !396)
!399 = !DILocation(line: 171, column: 10, scope: !386)
!400 = !DILocalVariable(name: "i", scope: !386, file: !3, line: 173, type: !13)
!401 = !DILocation(line: 173, column: 7, scope: !386)
!402 = !DILocalVariable(name: "flag", scope: !386, file: !3, line: 173, type: !13)
!403 = !DILocation(line: 173, column: 10, scope: !386)
!404 = !DILocation(line: 175, column: 8, scope: !386)
!405 = !DILocation(line: 176, column: 7, scope: !406)
!406 = distinct !DILexicalBlock(scope: !386, file: !3, line: 176, column: 7)
!407 = !DILocation(line: 176, column: 11, scope: !406)
!408 = !DILocation(line: 176, column: 7, scope: !386)
!409 = !DILocation(line: 176, column: 20, scope: !406)
!410 = !DILocation(line: 176, column: 18, scope: !406)
!411 = !DILocation(line: 178, column: 11, scope: !412)
!412 = distinct !DILexicalBlock(scope: !413, file: !3, line: 178, column: 5)
!413 = distinct !DILexicalBlock(scope: !406, file: !3, line: 177, column: 8)
!414 = !DILocation(line: 178, column: 10, scope: !412)
!415 = !DILocation(line: 178, column: 14, scope: !416)
!416 = distinct !DILexicalBlock(scope: !412, file: !3, line: 178, column: 5)
!417 = !DILocation(line: 178, column: 15, scope: !416)
!418 = !DILocation(line: 178, column: 5, scope: !412)
!419 = !DILocation(line: 180, column: 7, scope: !420)
!420 = distinct !DILexicalBlock(scope: !421, file: !3, line: 180, column: 6)
!421 = distinct !DILexicalBlock(scope: !416, file: !3, line: 179, column: 7)
!422 = !DILocation(line: 180, column: 6, scope: !421)
!423 = !DILocation(line: 181, column: 10, scope: !424)
!424 = distinct !DILexicalBlock(scope: !420, file: !3, line: 180, column: 13)
!425 = !DILocation(line: 181, column: 17, scope: !424)
!426 = !DILocation(line: 181, column: 19, scope: !424)
!427 = !DILocation(line: 181, column: 14, scope: !424)
!428 = !DILocation(line: 181, column: 9, scope: !424)
!429 = !DILocation(line: 181, column: 32, scope: !424)
!430 = !DILocation(line: 181, column: 30, scope: !424)
!431 = !DILocation(line: 181, column: 23, scope: !424)
!432 = !DILocation(line: 181, column: 7, scope: !424)
!433 = !DILocation(line: 182, column: 8, scope: !424)
!434 = !DILocation(line: 182, column: 12, scope: !424)
!435 = !DILocation(line: 182, column: 10, scope: !424)
!436 = !DILocation(line: 182, column: 6, scope: !424)
!437 = !DILocation(line: 183, column: 11, scope: !424)
!438 = !DILocation(line: 183, column: 18, scope: !424)
!439 = !DILocation(line: 183, column: 20, scope: !424)
!440 = !DILocation(line: 183, column: 15, scope: !424)
!441 = !DILocation(line: 183, column: 9, scope: !424)
!442 = !DILocation(line: 184, column: 13, scope: !443)
!443 = distinct !DILexicalBlock(scope: !424, file: !3, line: 184, column: 8)
!444 = !DILocation(line: 184, column: 8, scope: !443)
!445 = !DILocation(line: 184, column: 22, scope: !443)
!446 = !DILocation(line: 184, column: 19, scope: !443)
!447 = !DILocation(line: 184, column: 8, scope: !424)
!448 = !DILocation(line: 184, column: 36, scope: !443)
!449 = !DILocation(line: 184, column: 31, scope: !443)
!450 = !DILocation(line: 185, column: 2, scope: !424)
!451 = !DILocation(line: 187, column: 7, scope: !420)
!452 = !DILocation(line: 187, column: 6, scope: !420)
!453 = !DILocation(line: 188, column: 7, scope: !421)
!454 = !DILocation(line: 178, column: 20, scope: !416)
!455 = !DILocation(line: 178, column: 5, scope: !416)
!456 = distinct !{!456, !418, !457, !123}
!457 = !DILocation(line: 188, column: 7, scope: !412)
!458 = !DILocation(line: 190, column: 11, scope: !386)
!459 = !DILocation(line: 190, column: 3, scope: !386)
