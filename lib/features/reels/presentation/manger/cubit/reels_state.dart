part of 'reels_cubit.dart';

@immutable
sealed class ReelsState {}

final class ReelsInitial extends ReelsState {}

final class ReelsLoading extends ReelsState {}

final class ReelsSuccess extends ReelsState {
  final ReelsEntityData entityData;
  ReelsSuccess({required this.entityData});
}

final class ReelsFailure extends ReelsState {
  final String message;
  ReelsFailure({required this.message});
}