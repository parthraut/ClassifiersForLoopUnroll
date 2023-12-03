; ModuleID = 'test_no_nested.cpp'
source_filename = "test_no_nested.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: mustprogress noinline norecurse uwtable
define dso_local noundef i32 @main() #0 !dbg !10 {
  %1 = alloca i32, align 4
  %2 = alloca [1000 x i32], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata [1000 x i32]* %2, metadata !15, metadata !DIExpression()), !dbg !19
  %10 = bitcast [1000 x i32]* %2 to i8*, !dbg !19
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 4000, i1 false), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %3, metadata !20, metadata !DIExpression()), !dbg !22
  store i32 0, i32* %3, align 4, !dbg !22
  br label %11, !dbg !23

11:                                               ; preds = %19, %0
  %12 = load i32, i32* %3, align 4, !dbg !24
  %13 = icmp slt i32 %12, 100, !dbg !26
  br i1 %13, label %14, label %22, !dbg !27

14:                                               ; preds = %11
  %15 = load i32, i32* %3, align 4, !dbg !28
  %16 = load i32, i32* %3, align 4, !dbg !30
  %17 = sext i32 %16 to i64, !dbg !31
  %18 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %17, !dbg !31
  store i32 %15, i32* %18, align 4, !dbg !32
  call void @llvm.dbg.declare(metadata i32* %4, metadata !33, metadata !DIExpression()), !dbg !34
  store i32 5, i32* %4, align 4, !dbg !34
  br label %19, !dbg !35

19:                                               ; preds = %14
  %20 = load i32, i32* %3, align 4, !dbg !36
  %21 = add nsw i32 %20, 1, !dbg !36
  store i32 %21, i32* %3, align 4, !dbg !36
  br label %11, !dbg !37, !llvm.loop !38

22:                                               ; preds = %11
  call void @llvm.dbg.declare(metadata i32* %5, metadata !42, metadata !DIExpression()), !dbg !44
  store i32 101, i32* %5, align 4, !dbg !44
  br label %23, !dbg !45

23:                                               ; preds = %37, %22
  %24 = load i32, i32* %5, align 4, !dbg !46
  %25 = icmp slt i32 %24, 200, !dbg !48
  br i1 %25, label %26, label %40, !dbg !49

26:                                               ; preds = %23
  %27 = load i32, i32* %5, align 4, !dbg !50
  %28 = sub nsw i32 %27, 1, !dbg !52
  %29 = sext i32 %28 to i64, !dbg !53
  %30 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %29, !dbg !53
  %31 = load i32, i32* %30, align 4, !dbg !53
  %32 = load i32, i32* %5, align 4, !dbg !54
  %33 = add nsw i32 %31, %32, !dbg !55
  %34 = load i32, i32* %5, align 4, !dbg !56
  %35 = sext i32 %34 to i64, !dbg !57
  %36 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %35, !dbg !57
  store i32 %33, i32* %36, align 4, !dbg !58
  br label %37, !dbg !59

37:                                               ; preds = %26
  %38 = load i32, i32* %5, align 4, !dbg !60
  %39 = add nsw i32 %38, 1, !dbg !60
  store i32 %39, i32* %5, align 4, !dbg !60
  br label %23, !dbg !61, !llvm.loop !62

40:                                               ; preds = %23
  call void @llvm.dbg.declare(metadata i32* %6, metadata !64, metadata !DIExpression()), !dbg !66
  store i32 201, i32* %6, align 4, !dbg !66
  br label %41, !dbg !67

41:                                               ; preds = %62, %40
  %42 = load i32, i32* %6, align 4, !dbg !68
  %43 = icmp slt i32 %42, 300, !dbg !70
  br i1 %43, label %44, label %65, !dbg !71

44:                                               ; preds = %41
  %45 = load i32, i32* %6, align 4, !dbg !72
  %46 = sub nsw i32 %45, 1, !dbg !74
  %47 = sext i32 %46 to i64, !dbg !75
  %48 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %47, !dbg !75
  %49 = load i32, i32* %48, align 4, !dbg !75
  %50 = load i32, i32* %6, align 4, !dbg !76
  %51 = sub nsw i32 %50, 2, !dbg !77
  %52 = sext i32 %51 to i64, !dbg !78
  %53 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %52, !dbg !78
  %54 = load i32, i32* %53, align 4, !dbg !78
  %55 = add nsw i32 %49, %54, !dbg !79
  %56 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 22, !dbg !80
  %57 = load i32, i32* %56, align 8, !dbg !80
  %58 = sub nsw i32 %55, %57, !dbg !81
  %59 = load i32, i32* %6, align 4, !dbg !82
  %60 = sext i32 %59 to i64, !dbg !83
  %61 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %60, !dbg !83
  store i32 %58, i32* %61, align 4, !dbg !84
  br label %62, !dbg !85

62:                                               ; preds = %44
  %63 = load i32, i32* %6, align 4, !dbg !86
  %64 = add nsw i32 %63, 1, !dbg !86
  store i32 %64, i32* %6, align 4, !dbg !86
  br label %41, !dbg !87, !llvm.loop !88

65:                                               ; preds = %41
  call void @llvm.dbg.declare(metadata i32* %7, metadata !90, metadata !DIExpression()), !dbg !92
  store i32 301, i32* %7, align 4, !dbg !92
  br label %66, !dbg !93

66:                                               ; preds = %90, %65
  %67 = load i32, i32* %7, align 4, !dbg !94
  %68 = icmp slt i32 %67, 1000, !dbg !96
  br i1 %68, label %69, label %93, !dbg !97

69:                                               ; preds = %66
  %70 = load i32, i32* %7, align 4, !dbg !98
  %71 = sdiv i32 %70, 2, !dbg !100
  %72 = sext i32 %71 to i64, !dbg !101
  %73 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %72, !dbg !101
  %74 = load i32, i32* %73, align 4, !dbg !101
  %75 = load i32, i32* %7, align 4, !dbg !102
  %76 = sdiv i32 %75, 4, !dbg !103
  %77 = sext i32 %76 to i64, !dbg !104
  %78 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %77, !dbg !104
  %79 = load i32, i32* %78, align 4, !dbg !104
  %80 = mul nsw i32 %74, %79, !dbg !105
  %81 = load i32, i32* %7, align 4, !dbg !106
  %82 = sdiv i32 %81, 6, !dbg !107
  %83 = sext i32 %82 to i64, !dbg !108
  %84 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %83, !dbg !108
  %85 = load i32, i32* %84, align 4, !dbg !108
  %86 = add nsw i32 %80, %85, !dbg !109
  %87 = load i32, i32* %7, align 4, !dbg !110
  %88 = sext i32 %87 to i64, !dbg !111
  %89 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %88, !dbg !111
  store i32 %86, i32* %89, align 4, !dbg !112
  br label %90, !dbg !113

90:                                               ; preds = %69
  %91 = load i32, i32* %7, align 4, !dbg !114
  %92 = add nsw i32 %91, 1, !dbg !114
  store i32 %92, i32* %7, align 4, !dbg !114
  br label %66, !dbg !115, !llvm.loop !116

93:                                               ; preds = %66
  call void @llvm.dbg.declare(metadata i32* %8, metadata !118, metadata !DIExpression()), !dbg !119
  store i32 0, i32* %8, align 4, !dbg !119
  call void @llvm.dbg.declare(metadata i32* %9, metadata !120, metadata !DIExpression()), !dbg !122
  store i32 0, i32* %9, align 4, !dbg !122
  br label %94, !dbg !123

94:                                               ; preds = %104, %93
  %95 = load i32, i32* %9, align 4, !dbg !124
  %96 = icmp slt i32 %95, 1000, !dbg !126
  br i1 %96, label %97, label %107, !dbg !127

97:                                               ; preds = %94
  %98 = load i32, i32* %9, align 4, !dbg !128
  %99 = sext i32 %98 to i64, !dbg !130
  %100 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %99, !dbg !130
  %101 = load i32, i32* %100, align 4, !dbg !130
  %102 = load i32, i32* %8, align 4, !dbg !131
  %103 = add nsw i32 %102, %101, !dbg !131
  store i32 %103, i32* %8, align 4, !dbg !131
  br label %104, !dbg !132

104:                                              ; preds = %97
  %105 = load i32, i32* %9, align 4, !dbg !133
  %106 = add nsw i32 %105, 1, !dbg !133
  store i32 %106, i32* %9, align 4, !dbg !133
  br label %94, !dbg !134, !llvm.loop !135

107:                                              ; preds = %94
  %108 = load i32, i32* %8, align 4, !dbg !137
  %109 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %108), !dbg !138
  %110 = load i32, i32* %1, align 4, !dbg !139
  ret i32 %110, !dbg !139
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare i32 @printf(i8* noundef, ...) #3

attributes #0 = { mustprogress noinline norecurse uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test_no_nested.cpp", directory: "/home/praut/CompilersFinalProject", checksumkind: CSK_MD5, checksum: "faa1a06f7b4af027c5426883e574a1de")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!10 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !11, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "v", scope: !10, file: !1, line: 4, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 32000, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 1000)
!19 = !DILocation(line: 4, column: 9, scope: !10)
!20 = !DILocalVariable(name: "i", scope: !21, file: !1, line: 7, type: !13)
!21 = distinct !DILexicalBlock(scope: !10, file: !1, line: 7, column: 5)
!22 = !DILocation(line: 7, column: 13, scope: !21)
!23 = !DILocation(line: 7, column: 9, scope: !21)
!24 = !DILocation(line: 7, column: 20, scope: !25)
!25 = distinct !DILexicalBlock(scope: !21, file: !1, line: 7, column: 5)
!26 = !DILocation(line: 7, column: 22, scope: !25)
!27 = !DILocation(line: 7, column: 5, scope: !21)
!28 = !DILocation(line: 8, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !1, line: 7, column: 33)
!30 = !DILocation(line: 8, column: 11, scope: !29)
!31 = !DILocation(line: 8, column: 9, scope: !29)
!32 = !DILocation(line: 8, column: 14, scope: !29)
!33 = !DILocalVariable(name: "a", scope: !29, file: !1, line: 9, type: !13)
!34 = !DILocation(line: 9, column: 13, scope: !29)
!35 = !DILocation(line: 10, column: 5, scope: !29)
!36 = !DILocation(line: 7, column: 29, scope: !25)
!37 = !DILocation(line: 7, column: 5, scope: !25)
!38 = distinct !{!38, !27, !39, !40, !41}
!39 = !DILocation(line: 10, column: 5, scope: !21)
!40 = !{!"llvm.loop.mustprogress"}
!41 = !{!"llvm.loop.unroll.count", i32 69}
!42 = !DILocalVariable(name: "j", scope: !43, file: !1, line: 13, type: !13)
!43 = distinct !DILexicalBlock(scope: !10, file: !1, line: 13, column: 5)
!44 = !DILocation(line: 13, column: 13, scope: !43)
!45 = !DILocation(line: 13, column: 9, scope: !43)
!46 = !DILocation(line: 13, column: 22, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !1, line: 13, column: 5)
!48 = !DILocation(line: 13, column: 24, scope: !47)
!49 = !DILocation(line: 13, column: 5, scope: !43)
!50 = !DILocation(line: 14, column: 18, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !1, line: 13, column: 35)
!52 = !DILocation(line: 14, column: 19, scope: !51)
!53 = !DILocation(line: 14, column: 16, scope: !51)
!54 = !DILocation(line: 14, column: 25, scope: !51)
!55 = !DILocation(line: 14, column: 23, scope: !51)
!56 = !DILocation(line: 14, column: 11, scope: !51)
!57 = !DILocation(line: 14, column: 9, scope: !51)
!58 = !DILocation(line: 14, column: 14, scope: !51)
!59 = !DILocation(line: 15, column: 5, scope: !51)
!60 = !DILocation(line: 13, column: 31, scope: !47)
!61 = !DILocation(line: 13, column: 5, scope: !47)
!62 = distinct !{!62, !49, !63, !40, !41}
!63 = !DILocation(line: 15, column: 5, scope: !43)
!64 = !DILocalVariable(name: "k", scope: !65, file: !1, line: 18, type: !13)
!65 = distinct !DILexicalBlock(scope: !10, file: !1, line: 18, column: 5)
!66 = !DILocation(line: 18, column: 13, scope: !65)
!67 = !DILocation(line: 18, column: 9, scope: !65)
!68 = !DILocation(line: 18, column: 22, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !1, line: 18, column: 5)
!70 = !DILocation(line: 18, column: 24, scope: !69)
!71 = !DILocation(line: 18, column: 5, scope: !65)
!72 = !DILocation(line: 19, column: 18, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !1, line: 18, column: 35)
!74 = !DILocation(line: 19, column: 19, scope: !73)
!75 = !DILocation(line: 19, column: 16, scope: !73)
!76 = !DILocation(line: 19, column: 27, scope: !73)
!77 = !DILocation(line: 19, column: 28, scope: !73)
!78 = !DILocation(line: 19, column: 25, scope: !73)
!79 = !DILocation(line: 19, column: 23, scope: !73)
!80 = !DILocation(line: 19, column: 34, scope: !73)
!81 = !DILocation(line: 19, column: 32, scope: !73)
!82 = !DILocation(line: 19, column: 11, scope: !73)
!83 = !DILocation(line: 19, column: 9, scope: !73)
!84 = !DILocation(line: 19, column: 14, scope: !73)
!85 = !DILocation(line: 20, column: 5, scope: !73)
!86 = !DILocation(line: 18, column: 31, scope: !69)
!87 = !DILocation(line: 18, column: 5, scope: !69)
!88 = distinct !{!88, !71, !89, !40, !41}
!89 = !DILocation(line: 20, column: 5, scope: !65)
!90 = !DILocalVariable(name: "l", scope: !91, file: !1, line: 23, type: !13)
!91 = distinct !DILexicalBlock(scope: !10, file: !1, line: 23, column: 5)
!92 = !DILocation(line: 23, column: 13, scope: !91)
!93 = !DILocation(line: 23, column: 9, scope: !91)
!94 = !DILocation(line: 23, column: 22, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !1, line: 23, column: 5)
!96 = !DILocation(line: 23, column: 24, scope: !95)
!97 = !DILocation(line: 23, column: 5, scope: !91)
!98 = !DILocation(line: 24, column: 18, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !1, line: 23, column: 36)
!100 = !DILocation(line: 24, column: 19, scope: !99)
!101 = !DILocation(line: 24, column: 16, scope: !99)
!102 = !DILocation(line: 24, column: 27, scope: !99)
!103 = !DILocation(line: 24, column: 28, scope: !99)
!104 = !DILocation(line: 24, column: 25, scope: !99)
!105 = !DILocation(line: 24, column: 23, scope: !99)
!106 = !DILocation(line: 24, column: 36, scope: !99)
!107 = !DILocation(line: 24, column: 37, scope: !99)
!108 = !DILocation(line: 24, column: 34, scope: !99)
!109 = !DILocation(line: 24, column: 32, scope: !99)
!110 = !DILocation(line: 24, column: 11, scope: !99)
!111 = !DILocation(line: 24, column: 9, scope: !99)
!112 = !DILocation(line: 24, column: 14, scope: !99)
!113 = !DILocation(line: 25, column: 5, scope: !99)
!114 = !DILocation(line: 23, column: 32, scope: !95)
!115 = !DILocation(line: 23, column: 5, scope: !95)
!116 = distinct !{!116, !97, !117, !40, !41}
!117 = !DILocation(line: 25, column: 5, scope: !91)
!118 = !DILocalVariable(name: "sum", scope: !10, file: !1, line: 27, type: !13)
!119 = !DILocation(line: 27, column: 9, scope: !10)
!120 = !DILocalVariable(name: "m", scope: !121, file: !1, line: 30, type: !13)
!121 = distinct !DILexicalBlock(scope: !10, file: !1, line: 30, column: 5)
!122 = !DILocation(line: 30, column: 13, scope: !121)
!123 = !DILocation(line: 30, column: 9, scope: !121)
!124 = !DILocation(line: 30, column: 20, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !1, line: 30, column: 5)
!126 = !DILocation(line: 30, column: 22, scope: !125)
!127 = !DILocation(line: 30, column: 5, scope: !121)
!128 = !DILocation(line: 31, column: 18, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !1, line: 30, column: 34)
!130 = !DILocation(line: 31, column: 16, scope: !129)
!131 = !DILocation(line: 31, column: 13, scope: !129)
!132 = !DILocation(line: 32, column: 5, scope: !129)
!133 = !DILocation(line: 30, column: 30, scope: !125)
!134 = !DILocation(line: 30, column: 5, scope: !125)
!135 = distinct !{!135, !127, !136, !40}
!136 = !DILocation(line: 32, column: 5, scope: !121)
!137 = !DILocation(line: 34, column: 18, scope: !10)
!138 = !DILocation(line: 34, column: 5, scope: !10)
!139 = !DILocation(line: 35, column: 1, scope: !10)
