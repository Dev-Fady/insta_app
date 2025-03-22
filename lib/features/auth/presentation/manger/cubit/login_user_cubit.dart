import 'package:bloc/bloc.dart';
import 'package:insta_app/features/auth/domain/entites/data_info_entity.dart';
import 'package:insta_app/features/auth/domain/repo/info_repo.dart';
import 'package:meta/meta.dart';

part 'login_user_state.dart';

class LoginUserCubit extends Cubit<LoginUserState> {
  LoginUserCubit({required this.infoRepo}) : super(LoginUserInitial());
  final InfoRepo infoRepo;

  Future<void> loginUser({required String userName}) async {
    emit(LoginUserLoading());
    final result = await infoRepo.loginUser(userName: userName);
    result.fold(
      (l) => emit(LoginUserFailure(errorMessage: l.toString())),
      (r) => emit(LoginUserSuccess(dataInfoEntity: r)),
    );
  }
}
