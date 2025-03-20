import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_app/core/theme/app_text_styles.dart';

class NameAndBio extends StatelessWidget {
  const NameAndBio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "name",
            style: AppTextStyles.heading28Regular.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "biography",
            style: AppTextStyles.bodyBasaRegular16.copyWith(
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
