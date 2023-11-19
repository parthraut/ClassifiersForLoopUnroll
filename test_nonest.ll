; ModuleID = 'test_no_nested.cpp'
source_filename = "test_no_nested.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: mustprogress nofree norecurse nounwind uwtable
define dso_local noundef i32 @main() local_unnamed_addr #0 !dbg !8 {
  %1 = alloca [1000 x i32], align 16
  %2 = bitcast [1000 x i32]* %1 to i8*, !dbg !11
  call void @llvm.lifetime.start.p0i8(i64 4000, i8* nonnull %2) #5, !dbg !11
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(4000) %2, i8 0, i64 4000, i1 false), !dbg !12
  br label %3, !dbg !13

3:                                                ; preds = %3, %0
  %4 = phi i64 [ 0, %0 ], [ %8, %3 ], !dbg !14
  %5 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %0 ], [ %9, %3 ], !dbg !15
  %6 = getelementptr inbounds [1000 x i32], [1000 x i32]* %1, i64 0, i64 %4, !dbg !14
  %7 = bitcast i32* %6 to <4 x i32>*, !dbg !15
  store <4 x i32> %5, <4 x i32>* %7, align 16, !dbg !15, !tbaa !16
  %8 = add nuw i64 %4, 4, !dbg !14
  %9 = add <4 x i32> %5, <i32 4, i32 4, i32 4, i32 4>, !dbg !15
  %10 = icmp eq i64 %8, 100, !dbg !14
  br i1 %10, label %11, label %3, !dbg !14, !llvm.loop !20

11:                                               ; preds = %3
  %12 = getelementptr inbounds [1000 x i32], [1000 x i32]* %1, i64 0, i64 100
  %13 = load i32, i32* %12, align 16, !dbg !25, !tbaa !16
  br label %18, !dbg !26

14:                                               ; preds = %18
  %15 = getelementptr inbounds [1000 x i32], [1000 x i32]* %1, i64 0, i64 22
  %16 = getelementptr inbounds [1000 x i32], [1000 x i32]* %1, i64 0, i64 200
  %17 = load i32, i32* %16, align 16, !dbg !27, !tbaa !16
  br label %26, !dbg !28

18:                                               ; preds = %11, %18
  %19 = phi i32 [ %13, %11 ], [ %22, %18 ], !dbg !25
  %20 = phi i64 [ 101, %11 ], [ %24, %18 ]
  %21 = trunc i64 %20 to i32, !dbg !29
  %22 = add nsw i32 %19, %21, !dbg !29
  %23 = getelementptr inbounds [1000 x i32], [1000 x i32]* %1, i64 0, i64 %20, !dbg !30
  store i32 %22, i32* %23, align 4, !dbg !31, !tbaa !16
  %24 = add nuw nsw i64 %20, 1, !dbg !32
  %25 = icmp eq i64 %24, 200, !dbg !33
  br i1 %25, label %14, label %18, !dbg !26, !llvm.loop !34

26:                                               ; preds = %14, %26
  %27 = phi i32 [ %17, %14 ], [ %34, %26 ], !dbg !27
  %28 = phi i64 [ 201, %14 ], [ %36, %26 ]
  %29 = add nsw i64 %28, -2, !dbg !36
  %30 = getelementptr inbounds [1000 x i32], [1000 x i32]* %1, i64 0, i64 %29, !dbg !37
  %31 = load i32, i32* %30, align 4, !dbg !37, !tbaa !16
  %32 = add nsw i32 %31, %27, !dbg !38
  %33 = load i32, i32* %15, align 8, !dbg !39, !tbaa !16
  %34 = sub i32 %32, %33, !dbg !40
  %35 = getelementptr inbounds [1000 x i32], [1000 x i32]* %1, i64 0, i64 %28, !dbg !41
  store i32 %34, i32* %35, align 4, !dbg !42, !tbaa !16
  %36 = add nuw nsw i64 %28, 1, !dbg !43
  %37 = icmp eq i64 %36, 300, !dbg !44
  br i1 %37, label %38, label %26, !dbg !28, !llvm.loop !45

38:                                               ; preds = %26, %38
  %39 = phi i64 [ %56, %38 ], [ 301, %26 ]
  %40 = lshr i64 %39, 1, !dbg !47
  %41 = and i64 %40, 2147483647, !dbg !48
  %42 = getelementptr inbounds [1000 x i32], [1000 x i32]* %1, i64 0, i64 %41, !dbg !48
  %43 = load i32, i32* %42, align 4, !dbg !48, !tbaa !16
  %44 = lshr i64 %39, 2, !dbg !49
  %45 = and i64 %44, 1073741823, !dbg !50
  %46 = getelementptr inbounds [1000 x i32], [1000 x i32]* %1, i64 0, i64 %45, !dbg !50
  %47 = load i32, i32* %46, align 4, !dbg !50, !tbaa !16
  %48 = mul nsw i32 %47, %43, !dbg !51
  %49 = trunc i64 %39 to i16, !dbg !52
  %50 = udiv i16 %49, 6, !dbg !52
  %51 = zext i16 %50 to i64, !dbg !53
  %52 = getelementptr inbounds [1000 x i32], [1000 x i32]* %1, i64 0, i64 %51, !dbg !53
  %53 = load i32, i32* %52, align 4, !dbg !53, !tbaa !16
  %54 = add nsw i32 %48, %53, !dbg !54
  %55 = getelementptr inbounds [1000 x i32], [1000 x i32]* %1, i64 0, i64 %39, !dbg !55
  store i32 %54, i32* %55, align 4, !dbg !56, !tbaa !16
  %56 = add nuw nsw i64 %39, 1, !dbg !57
  %57 = icmp eq i64 %56, 1000, !dbg !58
  br i1 %57, label %58, label %38, !dbg !59, !llvm.loop !60

58:                                               ; preds = %38, %58
  %59 = phi i64 [ %65, %58 ], [ 0, %38 ], !dbg !62
  %60 = phi <4 x i32> [ %64, %58 ], [ zeroinitializer, %38 ]
  %61 = getelementptr inbounds [1000 x i32], [1000 x i32]* %1, i64 0, i64 %59, !dbg !62
  %62 = bitcast i32* %61 to <4 x i32>*, !dbg !63
  %63 = load <4 x i32>, <4 x i32>* %62, align 16, !dbg !63, !tbaa !16
  %64 = add <4 x i32> %63, %60, !dbg !64
  %65 = add nuw i64 %59, 4, !dbg !62
  %66 = icmp eq i64 %65, 1000, !dbg !62
  br i1 %66, label %67, label %58, !dbg !62, !llvm.loop !65

67:                                               ; preds = %58
  %68 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %64), !dbg !66
  %69 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %68), !dbg !68
  call void @llvm.lifetime.end.p0i8(i64 4000, i8* nonnull %2) #5, !dbg !69
  ret i32 0, !dbg !69
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #3

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #4

attributes #0 = { mustprogress nofree norecurse nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nosync nounwind readnone willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test_no_nested.cpp", directory: "/home/praut/CompilersFinalProject")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{i32 7, !"PIC Level", i32 2}
!5 = !{i32 7, !"PIE Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!8 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !9, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !10)
!9 = !DISubroutineType(types: !10)
!10 = !{}
!11 = !DILocation(line: 4, column: 5, scope: !8)
!12 = !DILocation(line: 4, column: 9, scope: !8)
!13 = !DILocation(line: 6, column: 5, scope: !8)
!14 = !DILocation(line: 6, column: 29, scope: !8)
!15 = !DILocation(line: 7, column: 14, scope: !8)
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !13, !21, !22, !23, !24}
!21 = !DILocation(line: 8, column: 5, scope: !8)
!22 = !{!"llvm.loop.mustprogress"}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = !{!"llvm.loop.isvectorized", i32 1}
!25 = !DILocation(line: 11, column: 16, scope: !8)
!26 = !DILocation(line: 10, column: 5, scope: !8)
!27 = !DILocation(line: 15, column: 16, scope: !8)
!28 = !DILocation(line: 14, column: 5, scope: !8)
!29 = !DILocation(line: 11, column: 23, scope: !8)
!30 = !DILocation(line: 11, column: 9, scope: !8)
!31 = !DILocation(line: 11, column: 14, scope: !8)
!32 = !DILocation(line: 10, column: 31, scope: !8)
!33 = !DILocation(line: 10, column: 24, scope: !8)
!34 = distinct !{!34, !26, !35, !22, !23}
!35 = !DILocation(line: 12, column: 5, scope: !8)
!36 = !DILocation(line: 15, column: 28, scope: !8)
!37 = !DILocation(line: 15, column: 25, scope: !8)
!38 = !DILocation(line: 15, column: 23, scope: !8)
!39 = !DILocation(line: 15, column: 34, scope: !8)
!40 = !DILocation(line: 15, column: 32, scope: !8)
!41 = !DILocation(line: 15, column: 9, scope: !8)
!42 = !DILocation(line: 15, column: 14, scope: !8)
!43 = !DILocation(line: 14, column: 31, scope: !8)
!44 = !DILocation(line: 14, column: 24, scope: !8)
!45 = distinct !{!45, !28, !46, !22, !23}
!46 = !DILocation(line: 16, column: 5, scope: !8)
!47 = !DILocation(line: 19, column: 19, scope: !8)
!48 = !DILocation(line: 19, column: 16, scope: !8)
!49 = !DILocation(line: 19, column: 28, scope: !8)
!50 = !DILocation(line: 19, column: 25, scope: !8)
!51 = !DILocation(line: 19, column: 23, scope: !8)
!52 = !DILocation(line: 19, column: 37, scope: !8)
!53 = !DILocation(line: 19, column: 34, scope: !8)
!54 = !DILocation(line: 19, column: 32, scope: !8)
!55 = !DILocation(line: 19, column: 9, scope: !8)
!56 = !DILocation(line: 19, column: 14, scope: !8)
!57 = !DILocation(line: 18, column: 32, scope: !8)
!58 = !DILocation(line: 18, column: 24, scope: !8)
!59 = !DILocation(line: 18, column: 5, scope: !8)
!60 = distinct !{!60, !59, !61, !22, !23}
!61 = !DILocation(line: 20, column: 5, scope: !8)
!62 = !DILocation(line: 24, column: 30, scope: !8)
!63 = !DILocation(line: 25, column: 16, scope: !8)
!64 = !DILocation(line: 25, column: 13, scope: !8)
!65 = distinct !{!65, !66, !67, !22, !23, !24}
!66 = !DILocation(line: 24, column: 5, scope: !8)
!67 = !DILocation(line: 26, column: 5, scope: !8)
!68 = !DILocation(line: 28, column: 5, scope: !8)
!69 = !DILocation(line: 29, column: 1, scope: !8)
