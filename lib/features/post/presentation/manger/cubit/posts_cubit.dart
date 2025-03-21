import 'package:bloc/bloc.dart';
import 'package:insta_app/features/post/domain/entites/posts_entity.dart';
import 'package:insta_app/features/post/domain/repo/posts_repo.dart';
import 'package:meta/meta.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit({required this.postsRepo}) : super(PostsInitial());
  final PostsRepo postsRepo;

  Future<void> getPosts({required String userName}) async {
    emit(PostsLoading());
    final result = await postsRepo.getPosts(userName: userName);
    result.fold(
      (l) => emit(PostsFailure(errorMessage: l.toString())),
      (r) => emit(PostsSuccess(postsEntityData: r)),
    );
  }
}
