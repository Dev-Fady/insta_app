import 'package:bloc/bloc.dart';
import 'package:insta_app/features/auth/data/repo/info_repo_impl.dart';
import 'package:insta_app/features/auth/domain/entites/data_info_entity.dart';
import 'package:meta/meta.dart';

part 'login_user_state.dart';

class LoginUserCubit extends Cubit<LoginUserState> {
  LoginUserCubit({required this.infoRepoImpl}) : super(LoginUserInitial());
  final InfoRepoImpl infoRepoImpl;

  Future<void> loginUser({required String userName}) async {
    emit(LoginUserLoading());
    final result = await infoRepoImpl.loginUser(userName: userName);
    result.fold(
      (l) => emit(LoginUserFailure(errorMessage: l.toString())),
      (r) => emit(LoginUserSuccess(dataInfoEntity: r)),
    );
  }
}
