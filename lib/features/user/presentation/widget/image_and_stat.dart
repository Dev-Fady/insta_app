import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_app/features/auth/domain/entites/data_info_entity.dart';
import 'package:insta_app/features/user/presentation/widget/build_stat_column.dart';

class ImageAndStat extends StatelessWidget {
  const ImageAndStat({
    super.key,
    required this.infoEntity,
  });

  final DataInfoEntity infoEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          radius: 50.r,
          backgroundImage: CachedNetworkImageProvider(
            infoEntity.infoEntity.profilePicUrlJd,
          ),
          onBackgroundImageError: (error, stackTrace) {
            debugPrint("Error loading image: $error");
          },
        ),
        BuildStatColumn(number: 45, title: 'Posts'),
        SizedBox(width: 5.w),
        BuildStatColumn(
            number: infoEntity.infoEntity.followerCount, title: 'Followers'),
        SizedBox(width: 5.w),
        BuildStatColumn(
            number: infoEntity.infoEntity.followingCount, title: 'Following'),
      ],
    );
  }
}
