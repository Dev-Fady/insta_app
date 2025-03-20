import 'package:flutter/material.dart';
import 'package:insta_app/core/theme/app_text_styles.dart';

class BuildStatColumn extends StatelessWidget {
  const BuildStatColumn({
    super.key,
    required this.number,
    required this.title,
  });

  final int number;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number.toString(),
          style: AppTextStyles.bodyLargeBold19,
        ),
        Text(
          title,
          style: AppTextStyles.bodyBasaSemiBold16,
        ),
      ],
    );
  }
}
