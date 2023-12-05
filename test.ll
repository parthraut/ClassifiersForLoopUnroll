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
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata [1000 x i32]* %2, metadata !40, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i32* %3, metadata !45, metadata !DIExpression()), !dbg !47
  store i32 1, i32* %3, align 4, !dbg !47
  br label %8, !dbg !48

8:                                                ; preds = %68, %0
  %9 = load i32, i32* %3, align 4, !dbg !49
  %10 = icmp slt i32 %9, 1000, !dbg !51
  br i1 %10, label %11, label %71, !dbg !52

11:                                               ; preds = %8
  call void @llvm.dbg.declare(metadata i32* %4, metadata !53, metadata !DIExpression()), !dbg !56
  store i32 0, i32* %4, align 4, !dbg !56
  br label %12, !dbg !57

12:                                               ; preds = %48, %11
  %13 = load i32, i32* %4, align 4, !dbg !58
  %14 = icmp slt i32 %13, 1000, !dbg !60
  br i1 %14, label %15, label %51, !dbg !61

15:                                               ; preds = %12
  call void @llvm.dbg.declare(metadata i32* %5, metadata !62, metadata !DIExpression()), !dbg !65
  store i32 0, i32* %5, align 4, !dbg !65
  br label %16, !dbg !66

16:                                               ; preds = %30, %15
  %17 = load i32, i32* %5, align 4, !dbg !67
  %18 = icmp slt i32 %17, 1000, !dbg !69
  br i1 %18, label %19, label %33, !dbg !70

19:                                               ; preds = %16
  %20 = load i32, i32* %4, align 4, !dbg !71
  %21 = add nsw i32 2, %20, !dbg !73
  %22 = load i32, i32* %5, align 4, !dbg !74
  %23 = add nsw i32 %21, %22, !dbg !75
  %24 = load i32, i32* %3, align 4, !dbg !76
  %25 = sub nsw i32 %24, 1, !dbg !77
  %26 = sext i32 %25 to i64, !dbg !78
  %27 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %26, !dbg !78
  %28 = load i32, i32* %27, align 4, !dbg !79
  %29 = mul nsw i32 %28, %23, !dbg !79
  store i32 %29, i32* %27, align 4, !dbg !79
  br label %30, !dbg !80

30:                                               ; preds = %19
  %31 = load i32, i32* %5, align 4, !dbg !81
  %32 = add nsw i32 %31, 1, !dbg !81
  store i32 %32, i32* %5, align 4, !dbg !81
  br label %16, !dbg !82, !llvm.loop !83

33:                                               ; preds = %16
  call void @llvm.dbg.declare(metadata i32* %6, metadata !85, metadata !DIExpression()), !dbg !87
  store i32 0, i32* %6, align 4, !dbg !87
  br label %34, !dbg !88

34:                                               ; preds = %44, %33
  %35 = load i32, i32* %6, align 4, !dbg !89
  %36 = icmp slt i32 %35, 345, !dbg !91
  br i1 %36, label %37, label %47, !dbg !92

37:                                               ; preds = %34
  %38 = load i32, i32* %3, align 4, !dbg !93
  %39 = sub nsw i32 %38, 1, !dbg !95
  %40 = sext i32 %39 to i64, !dbg !96
  %41 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %40, !dbg !96
  %42 = load i32, i32* %41, align 4, !dbg !97
  %43 = add nsw i32 %42, 1, !dbg !97
  store i32 %43, i32* %41, align 4, !dbg !97
  br label %44, !dbg !98

44:                                               ; preds = %37
  %45 = load i32, i32* %6, align 4, !dbg !99
  %46 = add nsw i32 %45, 1, !dbg !99
  store i32 %46, i32* %6, align 4, !dbg !99
  br label %34, !dbg !100, !llvm.loop !101

47:                                               ; preds = %34
  br label %48, !dbg !103

48:                                               ; preds = %47
  %49 = load i32, i32* %4, align 4, !dbg !104
  %50 = add nsw i32 %49, 1, !dbg !104
  store i32 %50, i32* %4, align 4, !dbg !104
  br label %12, !dbg !105, !llvm.loop !106

51:                                               ; preds = %12
  call void @llvm.dbg.declare(metadata i32* %7, metadata !108, metadata !DIExpression()), !dbg !110
  store i32 0, i32* %7, align 4, !dbg !110
  br label %52, !dbg !111

52:                                               ; preds = %63, %51
  %53 = load i32, i32* %7, align 4, !dbg !112
  %54 = icmp slt i32 %53, 384, !dbg !114
  br i1 %54, label %55, label %66, !dbg !115

55:                                               ; preds = %52
  %56 = load i32, i32* %7, align 4, !dbg !116
  %57 = load i32, i32* %3, align 4, !dbg !118
  %58 = sub nsw i32 %57, 1, !dbg !119
  %59 = sext i32 %58 to i64, !dbg !120
  %60 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %59, !dbg !120
  %61 = load i32, i32* %60, align 4, !dbg !121
  %62 = add nsw i32 %61, %56, !dbg !121
  store i32 %62, i32* %60, align 4, !dbg !121
  br label %63, !dbg !122

63:                                               ; preds = %55
  %64 = load i32, i32* %7, align 4, !dbg !123
  %65 = add nsw i32 %64, 1, !dbg !123
  store i32 %65, i32* %7, align 4, !dbg !123
  br label %52, !dbg !124, !llvm.loop !125

66:                                               ; preds = %52
  %67 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 0, !dbg !127
  call void @mehar_deep_singh(i32* noundef %67), !dbg !128
  br label %68, !dbg !129

68:                                               ; preds = %66
  %69 = load i32, i32* %3, align 4, !dbg !130
  %70 = add nsw i32 %69, 1, !dbg !130
  store i32 %70, i32* %3, align 4, !dbg !130
  br label %8, !dbg !131, !llvm.loop !132

71:                                               ; preds = %8
  ret i32 0, !dbg !134
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "dataset/mehar.c", directory: "/home/praut/CompilersFinalProject", checksumkind: CSK_MD5, checksum: "7959595949b69f4d720c28aa2d22a535")
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
!127 = !DILocation(line: 32, column: 26, scope: !55)
!128 = !DILocation(line: 32, column: 9, scope: !55)
!129 = !DILocation(line: 33, column: 5, scope: !55)
!130 = !DILocation(line: 16, column: 32, scope: !50)
!131 = !DILocation(line: 16, column: 5, scope: !50)
!132 = distinct !{!132, !52, !133, !35}
!133 = !DILocation(line: 33, column: 5, scope: !46)
!134 = !DILocation(line: 35, column: 5, scope: !37)
