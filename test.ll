; ModuleID = 'test.cpp'
source_filename = "test.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone uwtable willreturn
define dso_local noundef i32 @main() local_unnamed_addr #0 !dbg !8 {
  %1 = alloca [1000 x i32], align 16
  %2 = bitcast [1000 x i32]* %1 to i8*, !dbg !11
  call void @llvm.lifetime.start.p0i8(i64 4000, i8* nonnull %2) #4, !dbg !11
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
  %10 = icmp eq i64 %8, 1000, !dbg !14
  br i1 %10, label %11, label %3, !dbg !14, !llvm.loop !20

11:                                               ; preds = %3, %36
  %12 = phi i64 [ %37, %36 ], [ 0, %3 ]
  %13 = getelementptr inbounds [1000 x i32], [1000 x i32]* %1, i64 0, i64 %12
  %14 = load i32, i32* %13, align 4, !tbaa !16
  br label %16, !dbg !25

15:                                               ; preds = %36
  call void @llvm.lifetime.end.p0i8(i64 4000, i8* nonnull %2) #4, !dbg !26
  ret i32 0, !dbg !26

16:                                               ; preds = %32, %11
  %17 = phi i32 [ 0, %11 ], [ %34, %32 ]
  %18 = phi i32 [ %14, %11 ], [ %33, %32 ]
  %19 = add nuw nsw i32 %17, 2
  %20 = insertelement <4 x i32> <i32 poison, i32 1, i32 1, i32 1>, i32 %18, i64 0, !dbg !27
  %21 = insertelement <4 x i32> poison, i32 %19, i64 0, !dbg !27
  %22 = shufflevector <4 x i32> %21, <4 x i32> poison, <4 x i32> zeroinitializer, !dbg !27
  br label %23, !dbg !27

23:                                               ; preds = %23, %16
  %24 = phi i32 [ 0, %16 ], [ %29, %23 ], !dbg !28
  %25 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %16 ], [ %30, %23 ]
  %26 = phi <4 x i32> [ %20, %16 ], [ %28, %23 ]
  %27 = add nuw nsw <4 x i32> %22, %25, !dbg !29
  %28 = mul <4 x i32> %26, %27, !dbg !30
  %29 = add nuw i32 %24, 4, !dbg !28
  %30 = add <4 x i32> %25, <i32 4, i32 4, i32 4, i32 4>
  %31 = icmp eq i32 %29, 1000, !dbg !28
  br i1 %31, label %32, label %23, !dbg !28, !llvm.loop !31

32:                                               ; preds = %23
  %33 = call i32 @llvm.vector.reduce.mul.v4i32(<4 x i32> %28), !dbg !27
  %34 = add nuw nsw i32 %17, 1, !dbg !33
  %35 = icmp eq i32 %34, 1000, !dbg !34
  br i1 %35, label %36, label %16, !dbg !25, !llvm.loop !35

36:                                               ; preds = %32
  store i32 %33, i32* %13, align 4, !tbaa !16
  %37 = add nuw nsw i64 %12, 1, !dbg !37
  %38 = icmp eq i64 %37, 1000, !dbg !38
  br i1 %38, label %15, label %11, !dbg !39, !llvm.loop !40
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.mul.v4i32(<4 x i32>) #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind readnone uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { nofree nosync nounwind readnone willreturn }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test.cpp", directory: "/home/praut/CompilersFinalProject")
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
!13 = !DILocation(line: 9, column: 5, scope: !8)
!14 = !DILocation(line: 9, column: 31, scope: !8)
!15 = !DILocation(line: 10, column: 14, scope: !8)
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !13, !21, !22, !23, !24}
!21 = !DILocation(line: 11, column: 5, scope: !8)
!22 = !{!"llvm.loop.mustprogress"}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = !{!"llvm.loop.isvectorized", i32 1}
!25 = !DILocation(line: 19, column: 9, scope: !8)
!26 = !DILocation(line: 29, column: 1, scope: !8)
!27 = !DILocation(line: 21, column: 13, scope: !8)
!28 = !DILocation(line: 21, column: 39, scope: !8)
!29 = !DILocation(line: 22, column: 31, scope: !8)
!30 = !DILocation(line: 22, column: 22, scope: !8)
!31 = distinct !{!31, !27, !32, !22, !23, !24}
!32 = !DILocation(line: 23, column: 13, scope: !8)
!33 = !DILocation(line: 19, column: 35, scope: !8)
!34 = !DILocation(line: 19, column: 26, scope: !8)
!35 = distinct !{!35, !25, !36, !22, !23}
!36 = !DILocation(line: 24, column: 9, scope: !8)
!37 = !DILocation(line: 17, column: 32, scope: !8)
!38 = !DILocation(line: 17, column: 23, scope: !8)
!39 = !DILocation(line: 17, column: 5, scope: !8)
!40 = distinct !{!40, !39, !41, !22, !23}
!41 = !DILocation(line: 25, column: 5, scope: !8)
