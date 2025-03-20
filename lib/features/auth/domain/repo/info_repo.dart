import 'package:dartz/dartz.dart';
import 'package:insta_app/core/error/faliure.dart';
import 'package:insta_app/features/auth/domain/entites/data_info_entity.dart';

abstract class InfoRepo {
  Future<Either<Faliure, DataInfoEntity>> loginUser({required String userName});
}
