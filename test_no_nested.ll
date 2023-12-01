; ModuleID = 'test_no_nested.cpp'
source_filename = "test_no_nested.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: mustprogress noinline norecurse optnone uwtable
define dso_local noundef i32 @main() #0 !dbg !10 {
  %1 = alloca i32, align 4
  %2 = alloca [1000 x i32], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata [1000 x i32]* %2, metadata !15, metadata !DIExpression()), !dbg !19
  %9 = bitcast [1000 x i32]* %2 to i8*, !dbg !19
  call void @llvm.memset.p0i8.i64(i8* align 16 %9, i8 0, i64 4000, i1 false), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %3, metadata !20, metadata !DIExpression()), !dbg !22
  store i32 0, i32* %3, align 4, !dbg !22
  br label %10, !dbg !23

10:                                               ; preds = %18, %0
  %11 = load i32, i32* %3, align 4, !dbg !24
  %12 = icmp slt i32 %11, 100, !dbg !26
  br i1 %12, label %13, label %21, !dbg !27

13:                                               ; preds = %10
  %14 = load i32, i32* %3, align 4, !dbg !28
  %15 = load i32, i32* %3, align 4, !dbg !30
  %16 = sext i32 %15 to i64, !dbg !31
  %17 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %16, !dbg !31
  store i32 %14, i32* %17, align 4, !dbg !32
  br label %18, !dbg !33

18:                                               ; preds = %13
  %19 = load i32, i32* %3, align 4, !dbg !34
  %20 = add nsw i32 %19, 1, !dbg !34
  store i32 %20, i32* %3, align 4, !dbg !34
  br label %10, !dbg !35, !llvm.loop !36

21:                                               ; preds = %10
  call void @llvm.dbg.declare(metadata i32* %4, metadata !39, metadata !DIExpression()), !dbg !41
  store i32 101, i32* %4, align 4, !dbg !41
  br label %22, !dbg !42

22:                                               ; preds = %36, %21
  %23 = load i32, i32* %4, align 4, !dbg !43
  %24 = icmp slt i32 %23, 200, !dbg !45
  br i1 %24, label %25, label %39, !dbg !46

25:                                               ; preds = %22
  %26 = load i32, i32* %4, align 4, !dbg !47
  %27 = sub nsw i32 %26, 1, !dbg !49
  %28 = sext i32 %27 to i64, !dbg !50
  %29 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %28, !dbg !50
  %30 = load i32, i32* %29, align 4, !dbg !50
  %31 = load i32, i32* %4, align 4, !dbg !51
  %32 = add nsw i32 %30, %31, !dbg !52
  %33 = load i32, i32* %4, align 4, !dbg !53
  %34 = sext i32 %33 to i64, !dbg !54
  %35 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %34, !dbg !54
  store i32 %32, i32* %35, align 4, !dbg !55
  br label %36, !dbg !56

36:                                               ; preds = %25
  %37 = load i32, i32* %4, align 4, !dbg !57
  %38 = add nsw i32 %37, 1, !dbg !57
  store i32 %38, i32* %4, align 4, !dbg !57
  br label %22, !dbg !58, !llvm.loop !59

39:                                               ; preds = %22
  call void @llvm.dbg.declare(metadata i32* %5, metadata !61, metadata !DIExpression()), !dbg !63
  store i32 201, i32* %5, align 4, !dbg !63
  br label %40, !dbg !64

40:                                               ; preds = %61, %39
  %41 = load i32, i32* %5, align 4, !dbg !65
  %42 = icmp slt i32 %41, 300, !dbg !67
  br i1 %42, label %43, label %64, !dbg !68

43:                                               ; preds = %40
  %44 = load i32, i32* %5, align 4, !dbg !69
  %45 = sub nsw i32 %44, 1, !dbg !71
  %46 = sext i32 %45 to i64, !dbg !72
  %47 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %46, !dbg !72
  %48 = load i32, i32* %47, align 4, !dbg !72
  %49 = load i32, i32* %5, align 4, !dbg !73
  %50 = sub nsw i32 %49, 2, !dbg !74
  %51 = sext i32 %50 to i64, !dbg !75
  %52 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %51, !dbg !75
  %53 = load i32, i32* %52, align 4, !dbg !75
  %54 = add nsw i32 %48, %53, !dbg !76
  %55 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 22, !dbg !77
  %56 = load i32, i32* %55, align 8, !dbg !77
  %57 = sub nsw i32 %54, %56, !dbg !78
  %58 = load i32, i32* %5, align 4, !dbg !79
  %59 = sext i32 %58 to i64, !dbg !80
  %60 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %59, !dbg !80
  store i32 %57, i32* %60, align 4, !dbg !81
  br label %61, !dbg !82

61:                                               ; preds = %43
  %62 = load i32, i32* %5, align 4, !dbg !83
  %63 = add nsw i32 %62, 1, !dbg !83
  store i32 %63, i32* %5, align 4, !dbg !83
  br label %40, !dbg !84, !llvm.loop !85

64:                                               ; preds = %40
  call void @llvm.dbg.declare(metadata i32* %6, metadata !87, metadata !DIExpression()), !dbg !89
  store i32 301, i32* %6, align 4, !dbg !89
  br label %65, !dbg !90

65:                                               ; preds = %89, %64
  %66 = load i32, i32* %6, align 4, !dbg !91
  %67 = icmp slt i32 %66, 1000, !dbg !93
  br i1 %67, label %68, label %92, !dbg !94

68:                                               ; preds = %65
  %69 = load i32, i32* %6, align 4, !dbg !95
  %70 = sdiv i32 %69, 2, !dbg !97
  %71 = sext i32 %70 to i64, !dbg !98
  %72 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %71, !dbg !98
  %73 = load i32, i32* %72, align 4, !dbg !98
  %74 = load i32, i32* %6, align 4, !dbg !99
  %75 = sdiv i32 %74, 4, !dbg !100
  %76 = sext i32 %75 to i64, !dbg !101
  %77 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %76, !dbg !101
  %78 = load i32, i32* %77, align 4, !dbg !101
  %79 = mul nsw i32 %73, %78, !dbg !102
  %80 = load i32, i32* %6, align 4, !dbg !103
  %81 = sdiv i32 %80, 6, !dbg !104
  %82 = sext i32 %81 to i64, !dbg !105
  %83 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %82, !dbg !105
  %84 = load i32, i32* %83, align 4, !dbg !105
  %85 = add nsw i32 %79, %84, !dbg !106
  %86 = load i32, i32* %6, align 4, !dbg !107
  %87 = sext i32 %86 to i64, !dbg !108
  %88 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %87, !dbg !108
  store i32 %85, i32* %88, align 4, !dbg !109
  br label %89, !dbg !110

89:                                               ; preds = %68
  %90 = load i32, i32* %6, align 4, !dbg !111
  %91 = add nsw i32 %90, 1, !dbg !111
  store i32 %91, i32* %6, align 4, !dbg !111
  br label %65, !dbg !112, !llvm.loop !113

92:                                               ; preds = %65
  call void @llvm.dbg.declare(metadata i32* %7, metadata !115, metadata !DIExpression()), !dbg !116
  store i32 0, i32* %7, align 4, !dbg !116
  call void @llvm.dbg.declare(metadata i32* %8, metadata !117, metadata !DIExpression()), !dbg !119
  store i32 0, i32* %8, align 4, !dbg !119
  br label %93, !dbg !120

93:                                               ; preds = %103, %92
  %94 = load i32, i32* %8, align 4, !dbg !121
  %95 = icmp slt i32 %94, 1000, !dbg !123
  br i1 %95, label %96, label %106, !dbg !124

96:                                               ; preds = %93
  %97 = load i32, i32* %8, align 4, !dbg !125
  %98 = sext i32 %97 to i64, !dbg !127
  %99 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %98, !dbg !127
  %100 = load i32, i32* %99, align 4, !dbg !127
  %101 = load i32, i32* %7, align 4, !dbg !128
  %102 = add nsw i32 %101, %100, !dbg !128
  store i32 %102, i32* %7, align 4, !dbg !128
  br label %103, !dbg !129

103:                                              ; preds = %96
  %104 = load i32, i32* %8, align 4, !dbg !130
  %105 = add nsw i32 %104, 1, !dbg !130
  store i32 %105, i32* %8, align 4, !dbg !130
  br label %93, !dbg !131, !llvm.loop !132

106:                                              ; preds = %93
  %107 = load i32, i32* %7, align 4, !dbg !134
  %108 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %107), !dbg !135
  %109 = load i32, i32* %1, align 4, !dbg !136
  ret i32 %109, !dbg !136
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare i32 @printf(i8* noundef, ...) #3

attributes #0 = { mustprogress noinline norecurse optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test_no_nested.cpp", directory: "/home/praut/CompilersFinalProject", checksumkind: CSK_MD5, checksum: "cf5653d707242871e61c3be12638ff63")
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
!33 = !DILocation(line: 9, column: 5, scope: !29)
!34 = !DILocation(line: 7, column: 29, scope: !25)
!35 = !DILocation(line: 7, column: 5, scope: !25)
!36 = distinct !{!36, !27, !37, !38}
!37 = !DILocation(line: 9, column: 5, scope: !21)
!38 = !{!"llvm.loop.mustprogress"}
!39 = !DILocalVariable(name: "j", scope: !40, file: !1, line: 12, type: !13)
!40 = distinct !DILexicalBlock(scope: !10, file: !1, line: 12, column: 5)
!41 = !DILocation(line: 12, column: 13, scope: !40)
!42 = !DILocation(line: 12, column: 9, scope: !40)
!43 = !DILocation(line: 12, column: 22, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !1, line: 12, column: 5)
!45 = !DILocation(line: 12, column: 24, scope: !44)
!46 = !DILocation(line: 12, column: 5, scope: !40)
!47 = !DILocation(line: 13, column: 18, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !1, line: 12, column: 35)
!49 = !DILocation(line: 13, column: 19, scope: !48)
!50 = !DILocation(line: 13, column: 16, scope: !48)
!51 = !DILocation(line: 13, column: 25, scope: !48)
!52 = !DILocation(line: 13, column: 23, scope: !48)
!53 = !DILocation(line: 13, column: 11, scope: !48)
!54 = !DILocation(line: 13, column: 9, scope: !48)
!55 = !DILocation(line: 13, column: 14, scope: !48)
!56 = !DILocation(line: 14, column: 5, scope: !48)
!57 = !DILocation(line: 12, column: 31, scope: !44)
!58 = !DILocation(line: 12, column: 5, scope: !44)
!59 = distinct !{!59, !46, !60, !38}
!60 = !DILocation(line: 14, column: 5, scope: !40)
!61 = !DILocalVariable(name: "k", scope: !62, file: !1, line: 17, type: !13)
!62 = distinct !DILexicalBlock(scope: !10, file: !1, line: 17, column: 5)
!63 = !DILocation(line: 17, column: 13, scope: !62)
!64 = !DILocation(line: 17, column: 9, scope: !62)
!65 = !DILocation(line: 17, column: 22, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !1, line: 17, column: 5)
!67 = !DILocation(line: 17, column: 24, scope: !66)
!68 = !DILocation(line: 17, column: 5, scope: !62)
!69 = !DILocation(line: 18, column: 18, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !1, line: 17, column: 35)
!71 = !DILocation(line: 18, column: 19, scope: !70)
!72 = !DILocation(line: 18, column: 16, scope: !70)
!73 = !DILocation(line: 18, column: 27, scope: !70)
!74 = !DILocation(line: 18, column: 28, scope: !70)
!75 = !DILocation(line: 18, column: 25, scope: !70)
!76 = !DILocation(line: 18, column: 23, scope: !70)
!77 = !DILocation(line: 18, column: 34, scope: !70)
!78 = !DILocation(line: 18, column: 32, scope: !70)
!79 = !DILocation(line: 18, column: 11, scope: !70)
!80 = !DILocation(line: 18, column: 9, scope: !70)
!81 = !DILocation(line: 18, column: 14, scope: !70)
!82 = !DILocation(line: 19, column: 5, scope: !70)
!83 = !DILocation(line: 17, column: 31, scope: !66)
!84 = !DILocation(line: 17, column: 5, scope: !66)
!85 = distinct !{!85, !68, !86, !38}
!86 = !DILocation(line: 19, column: 5, scope: !62)
!87 = !DILocalVariable(name: "l", scope: !88, file: !1, line: 22, type: !13)
!88 = distinct !DILexicalBlock(scope: !10, file: !1, line: 22, column: 5)
!89 = !DILocation(line: 22, column: 13, scope: !88)
!90 = !DILocation(line: 22, column: 9, scope: !88)
!91 = !DILocation(line: 22, column: 22, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !1, line: 22, column: 5)
!93 = !DILocation(line: 22, column: 24, scope: !92)
!94 = !DILocation(line: 22, column: 5, scope: !88)
!95 = !DILocation(line: 23, column: 18, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !1, line: 22, column: 36)
!97 = !DILocation(line: 23, column: 19, scope: !96)
!98 = !DILocation(line: 23, column: 16, scope: !96)
!99 = !DILocation(line: 23, column: 27, scope: !96)
!100 = !DILocation(line: 23, column: 28, scope: !96)
!101 = !DILocation(line: 23, column: 25, scope: !96)
!102 = !DILocation(line: 23, column: 23, scope: !96)
!103 = !DILocation(line: 23, column: 36, scope: !96)
!104 = !DILocation(line: 23, column: 37, scope: !96)
!105 = !DILocation(line: 23, column: 34, scope: !96)
!106 = !DILocation(line: 23, column: 32, scope: !96)
!107 = !DILocation(line: 23, column: 11, scope: !96)
!108 = !DILocation(line: 23, column: 9, scope: !96)
!109 = !DILocation(line: 23, column: 14, scope: !96)
!110 = !DILocation(line: 24, column: 5, scope: !96)
!111 = !DILocation(line: 22, column: 32, scope: !92)
!112 = !DILocation(line: 22, column: 5, scope: !92)
!113 = distinct !{!113, !94, !114, !38}
!114 = !DILocation(line: 24, column: 5, scope: !88)
!115 = !DILocalVariable(name: "sum", scope: !10, file: !1, line: 26, type: !13)
!116 = !DILocation(line: 26, column: 9, scope: !10)
!117 = !DILocalVariable(name: "m", scope: !118, file: !1, line: 29, type: !13)
!118 = distinct !DILexicalBlock(scope: !10, file: !1, line: 29, column: 5)
!119 = !DILocation(line: 29, column: 13, scope: !118)
!120 = !DILocation(line: 29, column: 9, scope: !118)
!121 = !DILocation(line: 29, column: 20, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !1, line: 29, column: 5)
!123 = !DILocation(line: 29, column: 22, scope: !122)
!124 = !DILocation(line: 29, column: 5, scope: !118)
!125 = !DILocation(line: 30, column: 18, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !1, line: 29, column: 34)
!127 = !DILocation(line: 30, column: 16, scope: !126)
!128 = !DILocation(line: 30, column: 13, scope: !126)
!129 = !DILocation(line: 31, column: 5, scope: !126)
!130 = !DILocation(line: 29, column: 30, scope: !122)
!131 = !DILocation(line: 29, column: 5, scope: !122)
!132 = distinct !{!132, !124, !133, !38}
!133 = !DILocation(line: 31, column: 5, scope: !118)
!134 = !DILocation(line: 33, column: 18, scope: !10)
!135 = !DILocation(line: 33, column: 5, scope: !10)
!136 = !DILocation(line: 34, column: 1, scope: !10)
