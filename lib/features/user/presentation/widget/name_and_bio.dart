import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_app/core/theme/app_text_styles.dart';
import 'package:insta_app/features/auth/domain/entites/data_info_entity.dart';

class NameAndBio extends StatelessWidget {
  const NameAndBio({
    super.key,
    required this.dataInfoEntity,
  });

  final DataInfoEntity dataInfoEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dataInfoEntity.infoEntity.fullName,
            style: AppTextStyles.heading28Regular.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            dataInfoEntity.infoEntity.biography,
            style: AppTextStyles.bodyBasaRegular16.copyWith(
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
