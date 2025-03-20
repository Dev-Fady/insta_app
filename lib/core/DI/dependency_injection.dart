import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:insta_app/core/helper_functions/logging_interceptor.dart';
import 'package:insta_app/core/services/api/api_service.dart';
import 'package:insta_app/features/home/data/repo/info_repo_impl.dart';
import 'package:insta_app/features/home/domain/repo/info_repo.dart';

final getIt = GetIt.instance;

void setupGetit() {
  final dio = Dio();

  loggingInterceptor(dio);

  GetIt.I.registerSingleton<ApiService>(ApiService(dio));

  getIt.registerSingleton<InfoRepo>(
      InfoRepoImpl(apiService: getIt<ApiService>()));
}
