import 'package:flutter/material.dart';
import 'package:insta_app/core/theme/app_text_styles.dart';

class UsernameLabel extends StatelessWidget {
  const UsernameLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "أدخل اسم المستخدم",
      style: AppTextStyles.bodyBasaBold16,
    );
  }
}