import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_app/core/DI/dependency_injection.dart';
import 'package:insta_app/core/cache/cache_helper.dart';
import 'package:insta_app/features/reels/domain/repo/reels_repo.dart';
import 'package:insta_app/features/reels/presentation/manger/cubit/reels_cubit.dart';
import 'package:insta_app/features/reels/presentation/view/widget/reels_view_body.dart';

class ReelsView extends StatelessWidget {
  const ReelsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReelsCubit(
        reelsRepo: getIt<ReelsRepo>(),
      )..getReels(userName: CacheHelper().getData(key: 'userName')),
      child: BlocBuilder<ReelsCubit, ReelsState>(
        builder: (context, state) {
          if (state is ReelsSuccess) {
            return ReelsViewBody(
              reelsEntityData: state.entityData,
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
