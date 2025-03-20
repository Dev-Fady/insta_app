import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:insta_app/core/error/faliure.dart';
import 'package:insta_app/core/services/api/api_service.dart';
import 'package:insta_app/features/home/data/models/info_model.dart';
import 'package:insta_app/features/home/domain/entites/data_info_entity.dart';
import 'package:insta_app/features/home/domain/repo/info_repo.dart';

class InfoRepoImpl extends InfoRepo {
  final ApiService apiService;
  InfoRepoImpl({required this.apiService});
  @override
  Future<Either<Faliure, DataInfoEntity>> loginUser(
      {required String userName}) async {
    try {
      final response = await apiService.getUserInfo(
        userName,
        "social-api4.p.rapidapi.com",
        "7eb24fe162mshf019328b3e320cep1843fbjsn3912b1010810",
      );
      final loginUserModel = InfoModel.fromJson(response);
      log(" loginUserModel ************** ${loginUserModel.data.toString()}********");
      final loginUserEntity = loginUserModel.toEntity();
      log("loginUserModel ************** ${loginUserEntity.toString()}********");
      return Right(loginUserEntity);
    } on Exception catch (e) {
      log('Exception in login user: $e');
      return Left(ServerFaliure(" حدث خطأ ما. الرجاء المحاولة مرة أخرى. "));
    }
  }
}
