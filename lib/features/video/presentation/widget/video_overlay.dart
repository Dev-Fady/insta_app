import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_app/core/DI/dependency_injection.dart';
import 'package:insta_app/core/cache/cache_helper.dart';
import 'package:insta_app/core/services/api/api_service.dart';
import 'package:insta_app/features/auth/data/repo/info_repo_impl.dart';
import 'package:insta_app/features/auth/presentation/manger/cubit/login_user_cubit.dart';
import 'package:insta_app/features/video/presentation/view/video_page.dart';

class VideoOverlay extends StatelessWidget {
  final VideoModel video;

  const VideoOverlay({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginUserCubit(
        infoRepoImpl: InfoRepoImpl(
          apiService: getIt<ApiService>(),
        ),
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(video.description,
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
