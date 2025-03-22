import 'package:bloc/bloc.dart';
import 'package:insta_app/features/reels/domain/entites/reels_entity.dart';
import 'package:insta_app/features/reels/domain/repo/reels_repo.dart';
import 'package:meta/meta.dart';

part 'reels_state.dart';

class ReelsCubit extends Cubit<ReelsState> {
  ReelsCubit({required this.reelsRepo}) : super(ReelsInitial());
  final ReelsRepo reelsRepo;
  Future<void> getReels({required String userName}) async {
    emit(ReelsLoading());
    final result = await reelsRepo.getReels(userName: userName);
    result.fold(
      (l) => emit(ReelsFailure(message: l.toString())),
      (r) => emit(ReelsSuccess(entityData: r)),
    );
  }
}
