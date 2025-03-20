import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_app/features/user/presentation/widget/build_stat_column.dart';

class ImageAndStat extends StatelessWidget {
  const ImageAndStat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          radius: 50.r,
          backgroundImage: const AssetImage('assets/image/avatar.png'),
        ),
        BuildStatColumn(number: 45, title: 'Posts'),
        SizedBox(width: 5.w),
        BuildStatColumn(number: 834, title: 'Followers'),
        SizedBox(width: 5.w),
        BuildStatColumn(number: 162, title: 'Following'),
      ],
    );
  }
}
