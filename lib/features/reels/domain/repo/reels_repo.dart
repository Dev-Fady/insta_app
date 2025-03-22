import 'package:dartz/dartz.dart';
import 'package:insta_app/core/error/faliure.dart';
import 'package:insta_app/features/reels/domain/entites/reels_entity.dart';

abstract class ReelsRepo {
  Future<Either<Faliure, ReelsEntityData>> getReels({required String userName});
}
