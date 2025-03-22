import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_app/core/DI/dependency_injection.dart';
import 'package:insta_app/core/cache/cache_helper.dart';
import 'package:insta_app/features/post/domain/repo/posts_repo.dart';
import 'package:insta_app/features/post/presentation/manger/cubit/posts_cubit.dart';
import 'package:insta_app/features/reels/domain/repo/reels_repo.dart';
import 'package:insta_app/features/reels/presentation/manger/cubit/reels_cubit.dart';

import 'widget/body_posts_view.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PostsCubit(
            postsRepo: getIt<PostsRepo>(),
          )..getPosts(userName: CacheHelper().getData(key: 'userName')),
        ),
        BlocProvider(
          create: (context) => ReelsCubit(reelsRepo: getIt<ReelsRepo>())
            ..getReels(userName: CacheHelper().getData(key: 'userName')),
        ),
      ],
      child: Builder(
        builder: (context) {
          final postsState = context.watch<PostsCubit>().state;
          final reelsState = context.watch<ReelsCubit>().state;

          if (postsState is PostsSuccess && reelsState is ReelsSuccess) {
            return BodyPostsView(
              postsEntityData: postsState.postsEntityData,
              reelsEntityData: reelsState.entityData,
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
