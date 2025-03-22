import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:insta_app/core/DI/dependency_injection.dart';
import 'package:insta_app/core/cache/cache_helper.dart';
import 'package:insta_app/features/auth/domain/repo/info_repo.dart';
import 'package:insta_app/features/auth/presentation/manger/cubit/login_user_cubit.dart';
import 'package:insta_app/features/auth/presentation/view/auth_view.dart';
import 'package:insta_app/features/post/presentation/view/posts_view.dart';
import 'package:insta_app/features/reels/domain/entites/reels_entity.dart';
import 'package:insta_app/features/user/presentation/view/user_view.dart';
import 'package:insta_app/features/video/presentation/view/video_page.dart';

import 'router_name.dart';

GoRouter createRouter(String initialLocation) {
  // final String userName = CacheHelper().getData(key: 'userName');
  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      GoRoute(
        path: RouterName.homePage,
        name: RouterName.homePage,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => LoginUserCubit(
              infoRepo: getIt<InfoRepo>(),
            ),
            child: AuthView(),
          );
        },
      ),
      GoRoute(
        path: RouterName.userPage,
        name: RouterName.userPage,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginUserCubit(
            infoRepo: getIt<InfoRepo>(),
          ),
          child: UserView(),
        ),
      ),
      GoRoute(
        path: RouterName.postsPage,
        name: RouterName.postsPage,
        builder: (context, state) {
          return PostsView();
        },
      ),
      GoRoute(
        path: RouterName.videoPage,
        name: RouterName.videoPage,
        builder: (context, state) {
          final Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          final ReelsEntityData entityData = args['data'];
          final int initialIndex = args['initialIndex'];

          return VidePage(entityData: entityData, initialIndex: initialIndex);
        },
      )
    ],
  );
}

GoRouter initializeRouter() {
  final bool isLogin = CacheHelper().getData(key: 'isLogin') ?? false;
  return createRouter(isLogin ? RouterName.userPage : RouterName.homePage);
}
