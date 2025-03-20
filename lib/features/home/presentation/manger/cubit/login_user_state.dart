part of 'login_user_cubit.dart';

@immutable
sealed class LoginUserState {}

final class LoginUserInitial extends LoginUserState {}

final class LoginUserLoading extends LoginUserState {}

final class LoginUserSuccess extends LoginUserState {
  final DataInfoEntity dataInfoEntity;
  LoginUserSuccess({required this.dataInfoEntity});
}

final class LoginUserFailure extends LoginUserState {
  final String errorMessage;
  LoginUserFailure({required this.errorMessage});
}
