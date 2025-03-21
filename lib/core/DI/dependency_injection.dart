import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:insta_app/core/helper_functions/logging_interceptor.dart';
import 'package:insta_app/core/services/api/api_service.dart';
import 'package:insta_app/features/auth/data/repo/info_repo_impl.dart';
import 'package:insta_app/features/auth/domain/repo/info_repo.dart';
import 'package:insta_app/features/post/data/repo/posts_repo_impl.dart';
import 'package:insta_app/features/post/domain/repo/posts_repo.dart';

final getIt = GetIt.instance;

void setupGetit() {
  final dio = Dio();

  loggingInterceptor(dio);

  GetIt.I.registerSingleton<ApiService>(ApiService(dio));

  getIt.registerSingleton<InfoRepo>(
      InfoRepoImpl(apiService: getIt<ApiService>()));

  getIt.registerSingleton<PostsRepo>(
      PostsRepoImpl(apiService: getIt<ApiService>()));
}
