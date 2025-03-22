import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:insta_app/core/error/faliure.dart';
import 'package:insta_app/core/services/api/api_service.dart';
import 'package:insta_app/features/reels/data/models/reels_model.dart';
import 'package:insta_app/features/reels/domain/entites/reels_entity.dart';
import 'package:insta_app/features/reels/domain/repo/reels_repo.dart';

class ReelsRepoImpl implements ReelsRepo {
  final ApiService apiService;

  ReelsRepoImpl({required this.apiService});

  @override
  Future<Either<Faliure, ReelsEntityData>> getReels(
      {required String userName}) async {
    try {
      final response = await apiService.getReels(
        userName,
        "social-api4.p.rapidapi.com",
        "7eb24fe162mshf019328b3e320cep1843fbjsn3912b1010810",
      );
      final getReels = ReelsModelData.fromJson(response);
      log(" getReelsModel ************** ${getReels.data}********");
      final getReelsEntity = getReels.toEntity();
      log("getReelsEntity ************** ${getReelsEntity.reelsEntity}********");
      return Right(getReelsEntity);
    } on Exception catch (e) {
      log('Exception in getReels: $e');
      return Left(ServerFaliure(" حدث خطأ ما. الرجاء المحاولة مرة أخرى. "));
    }
  }
}
