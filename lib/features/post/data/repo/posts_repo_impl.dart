import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:insta_app/core/error/faliure.dart';
import 'package:insta_app/core/services/api/api_service.dart';
import 'package:insta_app/features/post/data/models/posts_models.dart';
import 'package:insta_app/features/post/domain/entites/posts_entity.dart';
import 'package:insta_app/features/post/domain/repo/posts_repo.dart';

class PostsRepoImpl extends PostsRepo {
  final ApiService apiService;
  PostsRepoImpl({required this.apiService});
  @override
  Future<Either<Faliure, PostsEntityData>> getPosts(
      {required String userName}) async {
    try {
      final response = await apiService.getPosts(
        userName,
        "social-api4.p.rapidapi.com",
        "7eb24fe162mshf019328b3e320cep1843fbjsn3912b1010810",
      );
      final getPosts = PostsModelsData.fromJson(response);
      log(" getPostsModel ************** ${getPosts.data}********");
      final getPostsEntity = getPosts.toEntity();
      log("getPostsEntity ************** ${getPostsEntity.data}********");
      return Right(getPostsEntity);
    } on Exception catch (e) {
      log('Exception in lgetPosts: $e');
      return Left(ServerFaliure(" حدث خطأ ما. الرجاء المحاولة مرة أخرى. "));
    }
  }
}
