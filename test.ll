; ModuleID = 'dataset/mehar.c'
source_filename = "dataset/mehar.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @mehar_deep_singh(i32* noundef %0) #0 !dbg !10 {
  %2 = alloca i32*, align 8
  %3 = alloca i32, align 4
  store i32* %0, i32** %2, align 8
  call void @llvm.dbg.declare(metadata i32** %2, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %3, metadata !18, metadata !DIExpression()), !dbg !20
  store i32 0, i32* %3, align 4, !dbg !20
  br label %4, !dbg !21

4:                                                ; preds = %14, %1
  %5 = load i32, i32* %3, align 4, !dbg !22
  %6 = icmp slt i32 %5, 1000, !dbg !24
  br i1 %6, label %7, label %17, !dbg !25

7:                                                ; preds = %4
  %8 = load i32*, i32** %2, align 8, !dbg !26
  %9 = load i32, i32* %3, align 4, !dbg !28
  %10 = sext i32 %9 to i64, !dbg !26
  %11 = getelementptr inbounds i32, i32* %8, i64 %10, !dbg !26
  %12 = load i32, i32* %11, align 4, !dbg !29
  %13 = add nsw i32 %12, 69, !dbg !29
  store i32 %13, i32* %11, align 4, !dbg !29
  br label %14, !dbg !30

14:                                               ; preds = %7
  %15 = load i32, i32* %3, align 4, !dbg !31
  %16 = add nsw i32 %15, 1, !dbg !31
  store i32 %16, i32* %3, align 4, !dbg !31
  br label %4, !dbg !32, !llvm.loop !33

17:                                               ; preds = %4
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !37 {
  %1 = alloca i32, align 4
  %2 = alloca [1000 x i32], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata [1000 x i32]* %2, metadata !40, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i32* %3, metadata !45, metadata !DIExpression()), !dbg !47
  store i32 1, i32* %3, align 4, !dbg !47
  br label %9, !dbg !48

9:                                                ; preds = %85, %0
  %10 = load i32, i32* %3, align 4, !dbg !49
  %11 = icmp slt i32 %10, 1000, !dbg !51
  br i1 %11, label %12, label %88, !dbg !52

12:                                               ; preds = %9
  call void @llvm.dbg.declare(metadata i32* %4, metadata !53, metadata !DIExpression()), !dbg !56
  store i32 0, i32* %4, align 4, !dbg !56
  br label %13, !dbg !57

13:                                               ; preds = %49, %12
  %14 = load i32, i32* %4, align 4, !dbg !58
  %15 = icmp slt i32 %14, 1000, !dbg !60
  br i1 %15, label %16, label %52, !dbg !61

16:                                               ; preds = %13
  call void @llvm.dbg.declare(metadata i32* %5, metadata !62, metadata !DIExpression()), !dbg !65
  store i32 0, i32* %5, align 4, !dbg !65
  br label %17, !dbg !66

17:                                               ; preds = %31, %16
  %18 = load i32, i32* %5, align 4, !dbg !67
  %19 = icmp slt i32 %18, 1000, !dbg !69
  br i1 %19, label %20, label %34, !dbg !70

20:                                               ; preds = %17
  %21 = load i32, i32* %4, align 4, !dbg !71
  %22 = add nsw i32 2, %21, !dbg !73
  %23 = load i32, i32* %5, align 4, !dbg !74
  %24 = add nsw i32 %22, %23, !dbg !75
  %25 = load i32, i32* %3, align 4, !dbg !76
  %26 = sub nsw i32 %25, 1, !dbg !77
  %27 = sext i32 %26 to i64, !dbg !78
  %28 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %27, !dbg !78
  %29 = load i32, i32* %28, align 4, !dbg !79
  %30 = mul nsw i32 %29, %24, !dbg !79
  store i32 %30, i32* %28, align 4, !dbg !79
  br label %31, !dbg !80

31:                                               ; preds = %20
  %32 = load i32, i32* %5, align 4, !dbg !81
  %33 = add nsw i32 %32, 1, !dbg !81
  store i32 %33, i32* %5, align 4, !dbg !81
  br label %17, !dbg !82, !llvm.loop !83

34:                                               ; preds = %17
  call void @llvm.dbg.declare(metadata i32* %6, metadata !85, metadata !DIExpression()), !dbg !87
  store i32 0, i32* %6, align 4, !dbg !87
  br label %35, !dbg !88

35:                                               ; preds = %45, %34
  %36 = load i32, i32* %6, align 4, !dbg !89
  %37 = icmp slt i32 %36, 345, !dbg !91
  br i1 %37, label %38, label %48, !dbg !92

38:                                               ; preds = %35
  %39 = load i32, i32* %3, align 4, !dbg !93
  %40 = sub nsw i32 %39, 1, !dbg !95
  %41 = sext i32 %40 to i64, !dbg !96
  %42 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %41, !dbg !96
  %43 = load i32, i32* %42, align 4, !dbg !97
  %44 = add nsw i32 %43, 1, !dbg !97
  store i32 %44, i32* %42, align 4, !dbg !97
  br label %45, !dbg !98

45:                                               ; preds = %38
  %46 = load i32, i32* %6, align 4, !dbg !99
  %47 = add nsw i32 %46, 1, !dbg !99
  store i32 %47, i32* %6, align 4, !dbg !99
  br label %35, !dbg !100, !llvm.loop !101

48:                                               ; preds = %35
  br label %49, !dbg !103

49:                                               ; preds = %48
  %50 = load i32, i32* %4, align 4, !dbg !104
  %51 = add nsw i32 %50, 1, !dbg !104
  store i32 %51, i32* %4, align 4, !dbg !104
  br label %13, !dbg !105, !llvm.loop !106

52:                                               ; preds = %13
  call void @llvm.dbg.declare(metadata i32* %7, metadata !108, metadata !DIExpression()), !dbg !110
  store i32 0, i32* %7, align 4, !dbg !110
  br label %53, !dbg !111

53:                                               ; preds = %64, %52
  %54 = load i32, i32* %7, align 4, !dbg !112
  %55 = icmp slt i32 %54, 384, !dbg !114
  br i1 %55, label %56, label %67, !dbg !115

56:                                               ; preds = %53
  %57 = load i32, i32* %7, align 4, !dbg !116
  %58 = load i32, i32* %3, align 4, !dbg !118
  %59 = sub nsw i32 %58, 1, !dbg !119
  %60 = sext i32 %59 to i64, !dbg !120
  %61 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %60, !dbg !120
  %62 = load i32, i32* %61, align 4, !dbg !121
  %63 = add nsw i32 %62, %57, !dbg !121
  store i32 %63, i32* %61, align 4, !dbg !121
  br label %64, !dbg !122

64:                                               ; preds = %56
  %65 = load i32, i32* %7, align 4, !dbg !123
  %66 = add nsw i32 %65, 1, !dbg !123
  store i32 %66, i32* %7, align 4, !dbg !123
  br label %53, !dbg !124, !llvm.loop !125

67:                                               ; preds = %53
  call void @llvm.dbg.declare(metadata i32* %8, metadata !127, metadata !DIExpression()), !dbg !129
  store i32 1, i32* %8, align 4, !dbg !129
  br label %68, !dbg !130

68:                                               ; preds = %81, %67
  %69 = load i32, i32* %8, align 4, !dbg !131
  %70 = icmp slt i32 %69, 500, !dbg !133
  br i1 %70, label %71, label %84, !dbg !134

71:                                               ; preds = %68
  %72 = load i32, i32* %8, align 4, !dbg !135
  %73 = sub nsw i32 %72, 1, !dbg !137
  %74 = sext i32 %73 to i64, !dbg !138
  %75 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %74, !dbg !138
  %76 = load i32, i32* %75, align 4, !dbg !138
  %77 = add nsw i32 %76, 69, !dbg !139
  %78 = load i32, i32* %8, align 4, !dbg !140
  %79 = sext i32 %78 to i64, !dbg !141
  %80 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %79, !dbg !141
  store i32 %77, i32* %80, align 4, !dbg !142
  br label %81, !dbg !143

81:                                               ; preds = %71
  %82 = load i32, i32* %8, align 4, !dbg !144
  %83 = add nsw i32 %82, 1, !dbg !144
  store i32 %83, i32* %8, align 4, !dbg !144
  br label %68, !dbg !145, !llvm.loop !146

84:                                               ; preds = %68
  br label %85, !dbg !148

85:                                               ; preds = %84
  %86 = load i32, i32* %3, align 4, !dbg !149
  %87 = add nsw i32 %86, 1, !dbg !149
  store i32 %87, i32* %3, align 4, !dbg !149
  br label %9, !dbg !150, !llvm.loop !151

88:                                               ; preds = %9
  ret i32 0, !dbg !153
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "dataset/mehar.c", directory: "/home/praut/CompilersFinalProject", checksumkind: CSK_MD5, checksum: "cb887eb2ff6905036cb0d5494d6c1ced")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!10 = distinct !DISubprogram(name: "mehar_deep_singh", scope: !1, file: !1, line: 5, type: !11, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{}
!16 = !DILocalVariable(name: "mehar_is_cool", arg: 1, scope: !10, file: !1, line: 5, type: !13)
!17 = !DILocation(line: 5, column: 28, scope: !10)
!18 = !DILocalVariable(name: "i", scope: !19, file: !1, line: 6, type: !14)
!19 = distinct !DILexicalBlock(scope: !10, file: !1, line: 6, column: 5)
!20 = !DILocation(line: 6, column: 13, scope: !19)
!21 = !DILocation(line: 6, column: 9, scope: !19)
!22 = !DILocation(line: 6, column: 20, scope: !23)
!23 = distinct !DILexicalBlock(scope: !19, file: !1, line: 6, column: 5)
!24 = !DILocation(line: 6, column: 22, scope: !23)
!25 = !DILocation(line: 6, column: 5, scope: !19)
!26 = !DILocation(line: 7, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !1, line: 6, column: 34)
!28 = !DILocation(line: 7, column: 23, scope: !27)
!29 = !DILocation(line: 7, column: 26, scope: !27)
!30 = !DILocation(line: 8, column: 5, scope: !27)
!31 = !DILocation(line: 6, column: 30, scope: !23)
!32 = !DILocation(line: 6, column: 5, scope: !23)
!33 = distinct !{!33, !25, !34, !35}
!34 = !DILocation(line: 8, column: 5, scope: !19)
!35 = !{!"llvm.loop.mustprogress"}
!36 = !DILocation(line: 9, column: 1, scope: !10)
!37 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 11, type: !38, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!38 = !DISubroutineType(types: !39)
!39 = !{!14}
!40 = !DILocalVariable(name: "v", scope: !37, file: !1, line: 12, type: !41)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 32000, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 1000)
!44 = !DILocation(line: 12, column: 9, scope: !37)
!45 = !DILocalVariable(name: "i", scope: !46, file: !1, line: 16, type: !14)
!46 = distinct !DILexicalBlock(scope: !37, file: !1, line: 16, column: 5)
!47 = !DILocation(line: 16, column: 14, scope: !46)
!48 = !DILocation(line: 16, column: 10, scope: !46)
!49 = !DILocation(line: 16, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !1, line: 16, column: 5)
!51 = !DILocation(line: 16, column: 23, scope: !50)
!52 = !DILocation(line: 16, column: 5, scope: !46)
!53 = !DILocalVariable(name: "j", scope: !54, file: !1, line: 18, type: !14)
!54 = distinct !DILexicalBlock(scope: !55, file: !1, line: 18, column: 9)
!55 = distinct !DILexicalBlock(scope: !50, file: !1, line: 16, column: 36)
!56 = !DILocation(line: 18, column: 17, scope: !54)
!57 = !DILocation(line: 18, column: 13, scope: !54)
!58 = !DILocation(line: 18, column: 24, scope: !59)
!59 = distinct !DILexicalBlock(scope: !54, file: !1, line: 18, column: 9)
!60 = !DILocation(line: 18, column: 26, scope: !59)
!61 = !DILocation(line: 18, column: 9, scope: !54)
!62 = !DILocalVariable(name: "k", scope: !63, file: !1, line: 20, type: !14)
!63 = distinct !DILexicalBlock(scope: !64, file: !1, line: 20, column: 13)
!64 = distinct !DILexicalBlock(scope: !59, file: !1, line: 18, column: 38)
!65 = !DILocation(line: 20, column: 21, scope: !63)
!66 = !DILocation(line: 20, column: 17, scope: !63)
!67 = !DILocation(line: 20, column: 28, scope: !68)
!68 = distinct !DILexicalBlock(scope: !63, file: !1, line: 20, column: 13)
!69 = !DILocation(line: 20, column: 30, scope: !68)
!70 = !DILocation(line: 20, column: 13, scope: !63)
!71 = !DILocation(line: 21, column: 31, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !1, line: 20, column: 42)
!73 = !DILocation(line: 21, column: 29, scope: !72)
!74 = !DILocation(line: 21, column: 35, scope: !72)
!75 = !DILocation(line: 21, column: 33, scope: !72)
!76 = !DILocation(line: 21, column: 19, scope: !72)
!77 = !DILocation(line: 21, column: 20, scope: !72)
!78 = !DILocation(line: 21, column: 17, scope: !72)
!79 = !DILocation(line: 21, column: 24, scope: !72)
!80 = !DILocation(line: 22, column: 13, scope: !72)
!81 = !DILocation(line: 20, column: 39, scope: !68)
!82 = !DILocation(line: 20, column: 13, scope: !68)
!83 = distinct !{!83, !70, !84, !35}
!84 = !DILocation(line: 22, column: 13, scope: !63)
!85 = !DILocalVariable(name: "z", scope: !86, file: !1, line: 24, type: !14)
!86 = distinct !DILexicalBlock(scope: !64, file: !1, line: 24, column: 13)
!87 = !DILocation(line: 24, column: 21, scope: !86)
!88 = !DILocation(line: 24, column: 17, scope: !86)
!89 = !DILocation(line: 24, column: 28, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !1, line: 24, column: 13)
!91 = !DILocation(line: 24, column: 30, scope: !90)
!92 = !DILocation(line: 24, column: 13, scope: !86)
!93 = !DILocation(line: 25, column: 19, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !1, line: 24, column: 41)
!95 = !DILocation(line: 25, column: 20, scope: !94)
!96 = !DILocation(line: 25, column: 17, scope: !94)
!97 = !DILocation(line: 25, column: 23, scope: !94)
!98 = !DILocation(line: 26, column: 13, scope: !94)
!99 = !DILocation(line: 24, column: 37, scope: !90)
!100 = !DILocation(line: 24, column: 13, scope: !90)
!101 = distinct !{!101, !92, !102, !35}
!102 = !DILocation(line: 26, column: 13, scope: !86)
!103 = !DILocation(line: 27, column: 9, scope: !64)
!104 = !DILocation(line: 18, column: 35, scope: !59)
!105 = !DILocation(line: 18, column: 9, scope: !59)
!106 = distinct !{!106, !61, !107, !35}
!107 = !DILocation(line: 27, column: 9, scope: !54)
!108 = !DILocalVariable(name: "mehar", scope: !109, file: !1, line: 29, type: !14)
!109 = distinct !DILexicalBlock(scope: !55, file: !1, line: 29, column: 9)
!110 = !DILocation(line: 29, column: 17, scope: !109)
!111 = !DILocation(line: 29, column: 13, scope: !109)
!112 = !DILocation(line: 29, column: 28, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !1, line: 29, column: 9)
!114 = !DILocation(line: 29, column: 34, scope: !113)
!115 = !DILocation(line: 29, column: 9, scope: !109)
!116 = !DILocation(line: 30, column: 23, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !1, line: 29, column: 49)
!118 = !DILocation(line: 30, column: 15, scope: !117)
!119 = !DILocation(line: 30, column: 16, scope: !117)
!120 = !DILocation(line: 30, column: 13, scope: !117)
!121 = !DILocation(line: 30, column: 20, scope: !117)
!122 = !DILocation(line: 31, column: 9, scope: !117)
!123 = !DILocation(line: 29, column: 41, scope: !113)
!124 = !DILocation(line: 29, column: 9, scope: !113)
!125 = distinct !{!125, !115, !126, !35}
!126 = !DILocation(line: 31, column: 9, scope: !109)
!127 = !DILocalVariable(name: "mehar", scope: !128, file: !1, line: 35, type: !14)
!128 = distinct !DILexicalBlock(scope: !55, file: !1, line: 35, column: 9)
!129 = !DILocation(line: 35, column: 17, scope: !128)
!130 = !DILocation(line: 35, column: 13, scope: !128)
!131 = !DILocation(line: 35, column: 28, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !1, line: 35, column: 9)
!133 = !DILocation(line: 35, column: 34, scope: !132)
!134 = !DILocation(line: 35, column: 9, scope: !128)
!135 = !DILocation(line: 36, column: 26, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !1, line: 35, column: 49)
!137 = !DILocation(line: 36, column: 31, scope: !136)
!138 = !DILocation(line: 36, column: 24, scope: !136)
!139 = !DILocation(line: 36, column: 35, scope: !136)
!140 = !DILocation(line: 36, column: 15, scope: !136)
!141 = !DILocation(line: 36, column: 13, scope: !136)
!142 = !DILocation(line: 36, column: 22, scope: !136)
!143 = !DILocation(line: 37, column: 9, scope: !136)
!144 = !DILocation(line: 35, column: 41, scope: !132)
!145 = !DILocation(line: 35, column: 9, scope: !132)
!146 = distinct !{!146, !134, !147, !35}
!147 = !DILocation(line: 37, column: 9, scope: !128)
!148 = !DILocation(line: 38, column: 5, scope: !55)
!149 = !DILocation(line: 16, column: 32, scope: !50)
!150 = !DILocation(line: 16, column: 5, scope: !50)
!151 = distinct !{!151, !52, !152, !35}
!152 = !DILocation(line: 38, column: 5, scope: !46)
!153 = !DILocation(line: 40, column: 5, scope: !37)
