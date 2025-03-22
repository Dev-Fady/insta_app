import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_app/core/DI/dependency_injection.dart';
import 'package:insta_app/core/cache/cache_helper.dart';
import 'package:insta_app/features/auth/domain/repo/info_repo.dart';
// import 'package:insta_app/core/DI/dependency_injection.dart';
// import 'package:insta_app/core/cache/cache_helper.dart';
// import 'package:insta_app/features/auth/domain/repo/info_repo.dart';
import 'package:insta_app/features/auth/presentation/manger/cubit/login_user_cubit.dart';
import 'package:insta_app/features/reels/domain/entites/reels_entity.dart';

class VideoOverlay extends StatelessWidget {
  final ReelsEntityItem entityItem;

  const VideoOverlay({Key? key, required this.entityItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("*********************${entityItem.caption?.text ?? ''}****************}");
    return BlocProvider(
      create: (context) => LoginUserCubit(
        infoRepo: getIt<InfoRepo>(),
      )..loginUser(userName: CacheHelper().getData(key: 'userName')),
      child: BlocBuilder<LoginUserCubit, LoginUserState>(
        builder: (context, state) {
          if (state is LoginUserSuccess) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25.r,
                        backgroundImage: NetworkImage(
                          state.dataInfoEntity.infoEntity.profilePicUrlJd,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        state.dataInfoEntity.infoEntity.userName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                if (entityItem.caption != null)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(entityItem.caption?.text ?? ' ',
                        maxLines: 2,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14)),
                  ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
