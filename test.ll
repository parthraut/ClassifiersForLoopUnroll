; ModuleID = 'dataset/insertsort.c'
source_filename = "dataset/insertsort.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !10 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca [100000 x i32], align 16
  %6 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %3, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %4, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100000 x i32]* %5, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32* %6, metadata !26, metadata !DIExpression()), !dbg !28
  store i32 0, i32* %6, align 4, !dbg !28
  br label %7, !dbg !29

7:                                                ; preds = %16, %0
  %8 = load i32, i32* %6, align 4, !dbg !30
  %9 = icmp slt i32 %8, 100000, !dbg !32
  br i1 %9, label %10, label %19, !dbg !33

10:                                               ; preds = %7
  %11 = call i32 (...) @rand(), !dbg !34
  %12 = srem i32 %11, 100000, !dbg !36
  %13 = load i32, i32* %6, align 4, !dbg !37
  %14 = sext i32 %13 to i64, !dbg !38
  %15 = getelementptr inbounds [100000 x i32], [100000 x i32]* %5, i64 0, i64 %14, !dbg !38
  store i32 %12, i32* %15, align 4, !dbg !39
  br label %16, !dbg !40

16:                                               ; preds = %10
  %17 = load i32, i32* %6, align 4, !dbg !41
  %18 = add nsw i32 %17, 1, !dbg !41
  store i32 %18, i32* %6, align 4, !dbg !41
  br label %7, !dbg !42, !llvm.loop !43

19:                                               ; preds = %7
  store i32 2, i32* %2, align 4, !dbg !46
  br label %20, !dbg !47

20:                                               ; preds = %56, %19
  %21 = load i32, i32* %2, align 4, !dbg !48
  %22 = icmp sle i32 %21, 100000, !dbg !49
  br i1 %22, label %23, label %59, !dbg !47

23:                                               ; preds = %20
  %24 = load i32, i32* %2, align 4, !dbg !50
  store i32 %24, i32* %3, align 4, !dbg !52
  br label %25, !dbg !53

25:                                               ; preds = %36, %23
  %26 = load i32, i32* %3, align 4, !dbg !54
  %27 = sext i32 %26 to i64, !dbg !55
  %28 = getelementptr inbounds [100000 x i32], [100000 x i32]* %5, i64 0, i64 %27, !dbg !55
  %29 = load i32, i32* %28, align 4, !dbg !55
  %30 = load i32, i32* %3, align 4, !dbg !56
  %31 = sub nsw i32 %30, 1, !dbg !57
  %32 = sext i32 %31 to i64, !dbg !58
  %33 = getelementptr inbounds [100000 x i32], [100000 x i32]* %5, i64 0, i64 %32, !dbg !58
  %34 = load i32, i32* %33, align 4, !dbg !58
  %35 = icmp slt i32 %29, %34, !dbg !59
  br i1 %35, label %36, label %56, !dbg !53

36:                                               ; preds = %25
  %37 = load i32, i32* %3, align 4, !dbg !60
  %38 = sext i32 %37 to i64, !dbg !62
  %39 = getelementptr inbounds [100000 x i32], [100000 x i32]* %5, i64 0, i64 %38, !dbg !62
  %40 = load i32, i32* %39, align 4, !dbg !62
  store i32 %40, i32* %4, align 4, !dbg !63
  %41 = load i32, i32* %3, align 4, !dbg !64
  %42 = sub nsw i32 %41, 1, !dbg !65
  %43 = sext i32 %42 to i64, !dbg !66
  %44 = getelementptr inbounds [100000 x i32], [100000 x i32]* %5, i64 0, i64 %43, !dbg !66
  %45 = load i32, i32* %44, align 4, !dbg !66
  %46 = load i32, i32* %3, align 4, !dbg !67
  %47 = sext i32 %46 to i64, !dbg !68
  %48 = getelementptr inbounds [100000 x i32], [100000 x i32]* %5, i64 0, i64 %47, !dbg !68
  store i32 %45, i32* %48, align 4, !dbg !69
  %49 = load i32, i32* %4, align 4, !dbg !70
  %50 = load i32, i32* %3, align 4, !dbg !71
  %51 = sub nsw i32 %50, 1, !dbg !72
  %52 = sext i32 %51 to i64, !dbg !73
  %53 = getelementptr inbounds [100000 x i32], [100000 x i32]* %5, i64 0, i64 %52, !dbg !73
  store i32 %49, i32* %53, align 4, !dbg !74
  %54 = load i32, i32* %3, align 4, !dbg !75
  %55 = add nsw i32 %54, -1, !dbg !75
  store i32 %55, i32* %3, align 4, !dbg !75
  br label %25, !dbg !53, !llvm.loop !76

56:                                               ; preds = %25
  %57 = load i32, i32* %2, align 4, !dbg !78
  %58 = add nsw i32 %57, 1, !dbg !78
  store i32 %58, i32* %2, align 4, !dbg !78
  br label %20, !dbg !47, !llvm.loop !79

59:                                               ; preds = %20
  %60 = load i32, i32* %1, align 4, !dbg !81
  ret i32 %60, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @rand(...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "dataset/insertsort.c", directory: "/home/praut/CompilersFinalProject", checksumkind: CSK_MD5, checksum: "2cb2576069ade01f86e2c1ba4abcaf8b")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!10 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 48, type: !11, scopeLine: 49, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "i", scope: !10, file: !1, line: 50, type: !13)
!16 = !DILocation(line: 50, column: 8, scope: !10)
!17 = !DILocalVariable(name: "j", scope: !10, file: !1, line: 50, type: !13)
!18 = !DILocation(line: 50, column: 10, scope: !10)
!19 = !DILocalVariable(name: "temp", scope: !10, file: !1, line: 50, type: !13)
!20 = !DILocation(line: 50, column: 13, scope: !10)
!21 = !DILocalVariable(name: "a", scope: !10, file: !1, line: 50, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 3200000, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100000)
!25 = !DILocation(line: 50, column: 19, scope: !10)
!26 = !DILocalVariable(name: "i", scope: !27, file: !1, line: 51, type: !13)
!27 = distinct !DILexicalBlock(scope: !10, file: !1, line: 51, column: 3)
!28 = !DILocation(line: 51, column: 12, scope: !27)
!29 = !DILocation(line: 51, column: 8, scope: !27)
!30 = !DILocation(line: 51, column: 19, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !1, line: 51, column: 3)
!32 = !DILocation(line: 51, column: 21, scope: !31)
!33 = !DILocation(line: 51, column: 3, scope: !27)
!34 = !DILocation(line: 52, column: 14, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !1, line: 51, column: 36)
!36 = !DILocation(line: 52, column: 21, scope: !35)
!37 = !DILocation(line: 52, column: 9, scope: !35)
!38 = !DILocation(line: 52, column: 7, scope: !35)
!39 = !DILocation(line: 52, column: 12, scope: !35)
!40 = !DILocation(line: 53, column: 3, scope: !35)
!41 = !DILocation(line: 51, column: 31, scope: !31)
!42 = !DILocation(line: 51, column: 3, scope: !31)
!43 = distinct !{!43, !33, !44, !45}
!44 = !DILocation(line: 53, column: 3, scope: !27)
!45 = !{!"llvm.loop.mustprogress"}
!46 = !DILocation(line: 58, column: 5, scope: !10)
!47 = !DILocation(line: 59, column: 3, scope: !10)
!48 = !DILocation(line: 59, column: 9, scope: !10)
!49 = !DILocation(line: 59, column: 11, scope: !10)
!50 = !DILocation(line: 63, column: 11, scope: !51)
!51 = distinct !DILexicalBlock(scope: !10, file: !1, line: 59, column: 21)
!52 = !DILocation(line: 63, column: 9, scope: !51)
!53 = !DILocation(line: 67, column: 7, scope: !51)
!54 = !DILocation(line: 67, column: 16, scope: !51)
!55 = !DILocation(line: 67, column: 14, scope: !51)
!56 = !DILocation(line: 67, column: 23, scope: !51)
!57 = !DILocation(line: 67, column: 24, scope: !51)
!58 = !DILocation(line: 67, column: 21, scope: !51)
!59 = !DILocation(line: 67, column: 19, scope: !51)
!60 = !DILocation(line: 72, column: 11, scope: !61)
!61 = distinct !DILexicalBlock(scope: !51, file: !1, line: 68, column: 7)
!62 = !DILocation(line: 72, column: 9, scope: !61)
!63 = !DILocation(line: 72, column: 7, scope: !61)
!64 = !DILocation(line: 73, column: 11, scope: !61)
!65 = !DILocation(line: 73, column: 12, scope: !61)
!66 = !DILocation(line: 73, column: 9, scope: !61)
!67 = !DILocation(line: 73, column: 4, scope: !61)
!68 = !DILocation(line: 73, column: 2, scope: !61)
!69 = !DILocation(line: 73, column: 7, scope: !61)
!70 = !DILocation(line: 74, column: 11, scope: !61)
!71 = !DILocation(line: 74, column: 4, scope: !61)
!72 = !DILocation(line: 74, column: 5, scope: !61)
!73 = !DILocation(line: 74, column: 2, scope: !61)
!74 = !DILocation(line: 74, column: 9, scope: !61)
!75 = !DILocation(line: 75, column: 3, scope: !61)
!76 = distinct !{!76, !53, !77, !45}
!77 = !DILocation(line: 76, column: 7, scope: !51)
!78 = !DILocation(line: 80, column: 8, scope: !51)
!79 = distinct !{!79, !47, !80, !45}
!80 = !DILocation(line: 81, column: 5, scope: !10)
!81 = !DILocation(line: 86, column: 1, scope: !10)
