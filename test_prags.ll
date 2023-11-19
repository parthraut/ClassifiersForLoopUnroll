; ModuleID = 'test_no_nested.cpp'
source_filename = "test_no_nested.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1, !dbg !0

; Function Attrs: mustprogress noinline norecurse uwtable
define dso_local noundef i32 @main() #0 !dbg !18 {
entry:
  %retval = alloca i32, align 4
  %v = alloca [1000 x i32], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %sum = alloca i32, align 4
  %m = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  call void @llvm.dbg.declare(metadata ptr %v, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.memset.p0.i64(ptr align 16 %v, i8 0, i64 4000, i1 false), !dbg !27
  call void @llvm.dbg.declare(metadata ptr %i, metadata !28, metadata !DIExpression()), !dbg !30
  store i32 0, ptr %i, align 4, !dbg !30
  br label %for.cond, !dbg !31

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !32
  %cmp = icmp slt i32 %0, 100, !dbg !34
  br i1 %cmp, label %for.body, label %for.end, !dbg !35

for.body:                                         ; preds = %for.cond
  %1 = load i32, ptr %i, align 4, !dbg !36
  %2 = load i32, ptr %i, align 4, !dbg !38
  %idxprom = sext i32 %2 to i64, !dbg !39
  %arrayidx = getelementptr inbounds [1000 x i32], ptr %v, i64 0, i64 %idxprom, !dbg !39
  store i32 %1, ptr %arrayidx, align 4, !dbg !40
  br label %for.inc, !dbg !41

for.inc:                                          ; preds = %for.body
  %3 = load i32, ptr %i, align 4, !dbg !42
  %inc = add nsw i32 %3, 1, !dbg !42
  store i32 %inc, ptr %i, align 4, !dbg !42
  br label %for.cond, !dbg !43, !llvm.loop !44

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata ptr %j, metadata !48, metadata !DIExpression()), !dbg !50
  store i32 101, ptr %j, align 4, !dbg !50
  br label %for.cond1, !dbg !51

for.cond1:                                        ; preds = %for.inc8, %for.end
  %4 = load i32, ptr %j, align 4, !dbg !52
  %cmp2 = icmp slt i32 %4, 200, !dbg !54
  br i1 %cmp2, label %for.body3, label %for.end10, !dbg !55

for.body3:                                        ; preds = %for.cond1
  %5 = load i32, ptr %j, align 4, !dbg !56
  %sub = sub nsw i32 %5, 1, !dbg !58
  %idxprom4 = sext i32 %sub to i64, !dbg !59
  %arrayidx5 = getelementptr inbounds [1000 x i32], ptr %v, i64 0, i64 %idxprom4, !dbg !59
  %6 = load i32, ptr %arrayidx5, align 4, !dbg !59
  %7 = load i32, ptr %j, align 4, !dbg !60
  %add = add nsw i32 %6, %7, !dbg !61
  %8 = load i32, ptr %j, align 4, !dbg !62
  %idxprom6 = sext i32 %8 to i64, !dbg !63
  %arrayidx7 = getelementptr inbounds [1000 x i32], ptr %v, i64 0, i64 %idxprom6, !dbg !63
  store i32 %add, ptr %arrayidx7, align 4, !dbg !64
  br label %for.inc8, !dbg !65

for.inc8:                                         ; preds = %for.body3
  %9 = load i32, ptr %j, align 4, !dbg !66
  %inc9 = add nsw i32 %9, 1, !dbg !66
  store i32 %inc9, ptr %j, align 4, !dbg !66
  br label %for.cond1, !dbg !67, !llvm.loop !68

for.end10:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata ptr %k, metadata !70, metadata !DIExpression()), !dbg !72
  store i32 201, ptr %k, align 4, !dbg !72
  br label %for.cond11, !dbg !73

for.cond11:                                       ; preds = %for.inc25, %for.end10
  %10 = load i32, ptr %k, align 4, !dbg !74
  %cmp12 = icmp slt i32 %10, 300, !dbg !76
  br i1 %cmp12, label %for.body13, label %for.end27, !dbg !77

for.body13:                                       ; preds = %for.cond11
  %11 = load i32, ptr %k, align 4, !dbg !78
  %sub14 = sub nsw i32 %11, 1, !dbg !80
  %idxprom15 = sext i32 %sub14 to i64, !dbg !81
  %arrayidx16 = getelementptr inbounds [1000 x i32], ptr %v, i64 0, i64 %idxprom15, !dbg !81
  %12 = load i32, ptr %arrayidx16, align 4, !dbg !81
  %13 = load i32, ptr %k, align 4, !dbg !82
  %sub17 = sub nsw i32 %13, 2, !dbg !83
  %idxprom18 = sext i32 %sub17 to i64, !dbg !84
  %arrayidx19 = getelementptr inbounds [1000 x i32], ptr %v, i64 0, i64 %idxprom18, !dbg !84
  %14 = load i32, ptr %arrayidx19, align 4, !dbg !84
  %add20 = add nsw i32 %12, %14, !dbg !85
  %arrayidx21 = getelementptr inbounds [1000 x i32], ptr %v, i64 0, i64 22, !dbg !86
  %15 = load i32, ptr %arrayidx21, align 8, !dbg !86
  %sub22 = sub nsw i32 %add20, %15, !dbg !87
  %16 = load i32, ptr %k, align 4, !dbg !88
  %idxprom23 = sext i32 %16 to i64, !dbg !89
  %arrayidx24 = getelementptr inbounds [1000 x i32], ptr %v, i64 0, i64 %idxprom23, !dbg !89
  store i32 %sub22, ptr %arrayidx24, align 4, !dbg !90
  br label %for.inc25, !dbg !91

for.inc25:                                        ; preds = %for.body13
  %17 = load i32, ptr %k, align 4, !dbg !92
  %inc26 = add nsw i32 %17, 1, !dbg !92
  store i32 %inc26, ptr %k, align 4, !dbg !92
  br label %for.cond11, !dbg !93, !llvm.loop !94

for.end27:                                        ; preds = %for.cond11
  call void @llvm.dbg.declare(metadata ptr %l, metadata !96, metadata !DIExpression()), !dbg !98
  store i32 301, ptr %l, align 4, !dbg !98
  br label %for.cond28, !dbg !99

for.cond28:                                       ; preds = %for.inc42, %for.end27
  %18 = load i32, ptr %l, align 4, !dbg !100
  %cmp29 = icmp slt i32 %18, 1000, !dbg !102
  br i1 %cmp29, label %for.body30, label %for.end44, !dbg !103

for.body30:                                       ; preds = %for.cond28
  %19 = load i32, ptr %l, align 4, !dbg !104
  %div = sdiv i32 %19, 2, !dbg !106
  %idxprom31 = sext i32 %div to i64, !dbg !107
  %arrayidx32 = getelementptr inbounds [1000 x i32], ptr %v, i64 0, i64 %idxprom31, !dbg !107
  %20 = load i32, ptr %arrayidx32, align 4, !dbg !107
  %21 = load i32, ptr %l, align 4, !dbg !108
  %div33 = sdiv i32 %21, 4, !dbg !109
  %idxprom34 = sext i32 %div33 to i64, !dbg !110
  %arrayidx35 = getelementptr inbounds [1000 x i32], ptr %v, i64 0, i64 %idxprom34, !dbg !110
  %22 = load i32, ptr %arrayidx35, align 4, !dbg !110
  %mul = mul nsw i32 %20, %22, !dbg !111
  %23 = load i32, ptr %l, align 4, !dbg !112
  %div36 = sdiv i32 %23, 6, !dbg !113
  %idxprom37 = sext i32 %div36 to i64, !dbg !114
  %arrayidx38 = getelementptr inbounds [1000 x i32], ptr %v, i64 0, i64 %idxprom37, !dbg !114
  %24 = load i32, ptr %arrayidx38, align 4, !dbg !114
  %add39 = add nsw i32 %mul, %24, !dbg !115
  %25 = load i32, ptr %l, align 4, !dbg !116
  %idxprom40 = sext i32 %25 to i64, !dbg !117
  %arrayidx41 = getelementptr inbounds [1000 x i32], ptr %v, i64 0, i64 %idxprom40, !dbg !117
  store i32 %add39, ptr %arrayidx41, align 4, !dbg !118
  br label %for.inc42, !dbg !119

for.inc42:                                        ; preds = %for.body30
  %26 = load i32, ptr %l, align 4, !dbg !120
  %inc43 = add nsw i32 %26, 1, !dbg !120
  store i32 %inc43, ptr %l, align 4, !dbg !120
  br label %for.cond28, !dbg !121, !llvm.loop !122

for.end44:                                        ; preds = %for.cond28
  call void @llvm.dbg.declare(metadata ptr %sum, metadata !124, metadata !DIExpression()), !dbg !125
  store i32 0, ptr %sum, align 4, !dbg !125
  call void @llvm.dbg.declare(metadata ptr %m, metadata !126, metadata !DIExpression()), !dbg !128
  store i32 0, ptr %m, align 4, !dbg !128
  br label %for.cond45, !dbg !129

for.cond45:                                       ; preds = %for.inc51, %for.end44
  %27 = load i32, ptr %m, align 4, !dbg !130
  %cmp46 = icmp slt i32 %27, 1000, !dbg !132
  br i1 %cmp46, label %for.body47, label %for.end53, !dbg !133

for.body47:                                       ; preds = %for.cond45
  %28 = load i32, ptr %m, align 4, !dbg !134
  %idxprom48 = sext i32 %28 to i64, !dbg !136
  %arrayidx49 = getelementptr inbounds [1000 x i32], ptr %v, i64 0, i64 %idxprom48, !dbg !136
  %29 = load i32, ptr %arrayidx49, align 4, !dbg !136
  %30 = load i32, ptr %sum, align 4, !dbg !137
  %add50 = add nsw i32 %30, %29, !dbg !137
  store i32 %add50, ptr %sum, align 4, !dbg !137
  br label %for.inc51, !dbg !138

for.inc51:                                        ; preds = %for.body47
  %31 = load i32, ptr %m, align 4, !dbg !139
  %inc52 = add nsw i32 %31, 1, !dbg !139
  store i32 %inc52, ptr %m, align 4, !dbg !139
  br label %for.cond45, !dbg !140, !llvm.loop !141

for.end53:                                        ; preds = %for.cond45
  %32 = load i32, ptr %sum, align 4, !dbg !143
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %32), !dbg !144
  %33 = load i32, ptr %retval, align 4, !dbg !145
  ret i32 %33, !dbg !145
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

declare i32 @printf(ptr noundef, ...) #3

attributes #0 = { mustprogress noinline norecurse uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!8}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 33, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "test_no_nested.cpp", directory: "/home/praut/CompilersFinalProject", checksumkind: CSK_MD5, checksum: "237ee9d5a9f5a5b81483684c5c9f20a3")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 24, elements: !6)
!4 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !{!7}
!7 = !DISubrange(count: 3)
!8 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !2, producer: "clang version 18.0.0 (https://github.com/parthraut/llvm-project.git 233971b475a48d9ad8c61632660a1b45186897cc)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !9, splitDebugInlining: false, nameTableKind: None)
!9 = !{!0}
!10 = !{i32 7, !"Dwarf Version", i32 5}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 8, !"PIC Level", i32 2}
!14 = !{i32 7, !"PIE Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 2}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 18.0.0 (https://github.com/parthraut/llvm-project.git 233971b475a48d9ad8c61632660a1b45186897cc)"}
!18 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 3, type: !19, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !8, retainedNodes: !22)
!19 = !DISubroutineType(types: !20)
!20 = !{!21}
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !{}
!23 = !DILocalVariable(name: "v", scope: !18, file: !2, line: 4, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 32000, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 1000)
!27 = !DILocation(line: 4, column: 9, scope: !18)
!28 = !DILocalVariable(name: "i", scope: !29, file: !2, line: 7, type: !21)
!29 = distinct !DILexicalBlock(scope: !18, file: !2, line: 7, column: 5)
!30 = !DILocation(line: 7, column: 13, scope: !29)
!31 = !DILocation(line: 7, column: 9, scope: !29)
!32 = !DILocation(line: 7, column: 20, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !2, line: 7, column: 5)
!34 = !DILocation(line: 7, column: 22, scope: !33)
!35 = !DILocation(line: 7, column: 5, scope: !29)
!36 = !DILocation(line: 8, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !2, line: 7, column: 33)
!38 = !DILocation(line: 8, column: 11, scope: !37)
!39 = !DILocation(line: 8, column: 9, scope: !37)
!40 = !DILocation(line: 8, column: 14, scope: !37)
!41 = !DILocation(line: 9, column: 5, scope: !37)
!42 = !DILocation(line: 7, column: 29, scope: !33)
!43 = !DILocation(line: 7, column: 5, scope: !33)
!44 = distinct !{!44, !35, !45, !46, !47}
!45 = !DILocation(line: 9, column: 5, scope: !29)
!46 = !{!"llvm.loop.mustprogress"}
!47 = !{!"llvm.loop.unroll.count", i32 10}
!48 = !DILocalVariable(name: "j", scope: !49, file: !2, line: 12, type: !21)
!49 = distinct !DILexicalBlock(scope: !18, file: !2, line: 12, column: 5)
!50 = !DILocation(line: 12, column: 13, scope: !49)
!51 = !DILocation(line: 12, column: 9, scope: !49)
!52 = !DILocation(line: 12, column: 22, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !2, line: 12, column: 5)
!54 = !DILocation(line: 12, column: 24, scope: !53)
!55 = !DILocation(line: 12, column: 5, scope: !49)
!56 = !DILocation(line: 13, column: 18, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !2, line: 12, column: 35)
!58 = !DILocation(line: 13, column: 19, scope: !57)
!59 = !DILocation(line: 13, column: 16, scope: !57)
!60 = !DILocation(line: 13, column: 25, scope: !57)
!61 = !DILocation(line: 13, column: 23, scope: !57)
!62 = !DILocation(line: 13, column: 11, scope: !57)
!63 = !DILocation(line: 13, column: 9, scope: !57)
!64 = !DILocation(line: 13, column: 14, scope: !57)
!65 = !DILocation(line: 14, column: 5, scope: !57)
!66 = !DILocation(line: 12, column: 31, scope: !53)
!67 = !DILocation(line: 12, column: 5, scope: !53)
!68 = distinct !{!68, !55, !69, !46, !47}
!69 = !DILocation(line: 14, column: 5, scope: !49)
!70 = !DILocalVariable(name: "k", scope: !71, file: !2, line: 17, type: !21)
!71 = distinct !DILexicalBlock(scope: !18, file: !2, line: 17, column: 5)
!72 = !DILocation(line: 17, column: 13, scope: !71)
!73 = !DILocation(line: 17, column: 9, scope: !71)
!74 = !DILocation(line: 17, column: 22, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !2, line: 17, column: 5)
!76 = !DILocation(line: 17, column: 24, scope: !75)
!77 = !DILocation(line: 17, column: 5, scope: !71)
!78 = !DILocation(line: 18, column: 18, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !2, line: 17, column: 35)
!80 = !DILocation(line: 18, column: 19, scope: !79)
!81 = !DILocation(line: 18, column: 16, scope: !79)
!82 = !DILocation(line: 18, column: 27, scope: !79)
!83 = !DILocation(line: 18, column: 28, scope: !79)
!84 = !DILocation(line: 18, column: 25, scope: !79)
!85 = !DILocation(line: 18, column: 23, scope: !79)
!86 = !DILocation(line: 18, column: 34, scope: !79)
!87 = !DILocation(line: 18, column: 32, scope: !79)
!88 = !DILocation(line: 18, column: 11, scope: !79)
!89 = !DILocation(line: 18, column: 9, scope: !79)
!90 = !DILocation(line: 18, column: 14, scope: !79)
!91 = !DILocation(line: 19, column: 5, scope: !79)
!92 = !DILocation(line: 17, column: 31, scope: !75)
!93 = !DILocation(line: 17, column: 5, scope: !75)
!94 = distinct !{!94, !77, !95, !46, !47}
!95 = !DILocation(line: 19, column: 5, scope: !71)
!96 = !DILocalVariable(name: "l", scope: !97, file: !2, line: 22, type: !21)
!97 = distinct !DILexicalBlock(scope: !18, file: !2, line: 22, column: 5)
!98 = !DILocation(line: 22, column: 13, scope: !97)
!99 = !DILocation(line: 22, column: 9, scope: !97)
!100 = !DILocation(line: 22, column: 22, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !2, line: 22, column: 5)
!102 = !DILocation(line: 22, column: 24, scope: !101)
!103 = !DILocation(line: 22, column: 5, scope: !97)
!104 = !DILocation(line: 23, column: 18, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !2, line: 22, column: 36)
!106 = !DILocation(line: 23, column: 19, scope: !105)
!107 = !DILocation(line: 23, column: 16, scope: !105)
!108 = !DILocation(line: 23, column: 27, scope: !105)
!109 = !DILocation(line: 23, column: 28, scope: !105)
!110 = !DILocation(line: 23, column: 25, scope: !105)
!111 = !DILocation(line: 23, column: 23, scope: !105)
!112 = !DILocation(line: 23, column: 36, scope: !105)
!113 = !DILocation(line: 23, column: 37, scope: !105)
!114 = !DILocation(line: 23, column: 34, scope: !105)
!115 = !DILocation(line: 23, column: 32, scope: !105)
!116 = !DILocation(line: 23, column: 11, scope: !105)
!117 = !DILocation(line: 23, column: 9, scope: !105)
!118 = !DILocation(line: 23, column: 14, scope: !105)
!119 = !DILocation(line: 24, column: 5, scope: !105)
!120 = !DILocation(line: 22, column: 32, scope: !101)
!121 = !DILocation(line: 22, column: 5, scope: !101)
!122 = distinct !{!122, !103, !123, !46, !47}
!123 = !DILocation(line: 24, column: 5, scope: !97)
!124 = !DILocalVariable(name: "sum", scope: !18, file: !2, line: 26, type: !21)
!125 = !DILocation(line: 26, column: 9, scope: !18)
!126 = !DILocalVariable(name: "m", scope: !127, file: !2, line: 29, type: !21)
!127 = distinct !DILexicalBlock(scope: !18, file: !2, line: 29, column: 5)
!128 = !DILocation(line: 29, column: 13, scope: !127)
!129 = !DILocation(line: 29, column: 9, scope: !127)
!130 = !DILocation(line: 29, column: 20, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !2, line: 29, column: 5)
!132 = !DILocation(line: 29, column: 22, scope: !131)
!133 = !DILocation(line: 29, column: 5, scope: !127)
!134 = !DILocation(line: 30, column: 18, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !2, line: 29, column: 34)
!136 = !DILocation(line: 30, column: 16, scope: !135)
!137 = !DILocation(line: 30, column: 13, scope: !135)
!138 = !DILocation(line: 31, column: 5, scope: !135)
!139 = !DILocation(line: 29, column: 30, scope: !131)
!140 = !DILocation(line: 29, column: 5, scope: !131)
!141 = distinct !{!141, !133, !142, !46, !47}
!142 = !DILocation(line: 31, column: 5, scope: !127)
!143 = !DILocation(line: 33, column: 18, scope: !18)
!144 = !DILocation(line: 33, column: 5, scope: !18)
!145 = !DILocation(line: 34, column: 1, scope: !18)
