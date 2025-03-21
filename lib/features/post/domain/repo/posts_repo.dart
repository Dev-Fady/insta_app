import 'package:dartz/dartz.dart';
import 'package:insta_app/core/error/faliure.dart';
import 'package:insta_app/features/post/domain/entites/posts_entity.dart';

abstract class PostsRepo {
  Future<Either<Faliure, PostsEntityData>> getPosts({required String userName});
}