import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:insta_app/core/DI/dependency_injection.dart';
import 'package:insta_app/core/cache/cache_helper.dart';
import 'package:insta_app/core/services/api/api_service.dart';
import 'package:insta_app/features/auth/data/repo/info_repo_impl.dart';
import 'package:insta_app/features/auth/presentation/manger/cubit/login_user_cubit.dart';
import 'package:insta_app/features/auth/presentation/view/auth_view.dart';
import 'package:insta_app/features/user/presentation/view/user_view.dart';

import 'router_name.dart';

GoRouter createRouter(String initialLocation) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      GoRoute(
        path: RouterName.homePage,
        name: RouterName.homePage,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => LoginUserCubit(
              infoRepoImpl: InfoRepoImpl(
                apiService: getIt<ApiService>(),
              ),
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
            infoRepoImpl: InfoRepoImpl(
              apiService: getIt<ApiService>(),
            ),
          ),
          child: UserView(),
        ),
      )
    ],
  );
}

GoRouter initializeRouter() {
  final bool isLogin = CacheHelper().getData(key: 'isLogin') ?? false;
  return createRouter(isLogin ? RouterName.userPage : RouterName.homePage);
}
