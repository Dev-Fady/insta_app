import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_app/core/DI/dependency_injection.dart';
import 'package:insta_app/core/cache/cache_helper.dart';
import 'package:insta_app/core/services/api/api_service.dart';
import 'package:insta_app/features/post/data/repo/posts_repo_impl.dart';
import 'package:insta_app/features/post/presentation/manger/cubit/posts_cubit.dart';

import 'widget/body_posts_view.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsCubit(
        postsRepo: PostsRepoImpl(apiService: getIt<ApiService>()),
      )..getPosts(userName: CacheHelper().getData(key: 'userName')),
      child: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          if (state is PostsSuccess) {
            return BodyPostsView(
              postsEntityData: state.postsEntityData,
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

