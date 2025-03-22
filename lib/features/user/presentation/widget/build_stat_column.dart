import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:insta_app/core/theme/app_text_styles.dart';

class BuildStatColumn extends StatelessWidget {
  const BuildStatColumn({
    super.key,
    required this.number,
    required this.title,
  });

  final int number;
  final String title;

  String formatNumber(int num) {
    if (num >= 1000000) {
      return '${(num / 1000000).toStringAsFixed(1)}M';
    } else if (num >= 1000) {
      return '${(num / 1000).toStringAsFixed(1)}K';
    } else {
      return NumberFormat.decimalPattern().format(num);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TweenAnimationBuilder<int>(
          tween: IntTween(begin: 0, end: number),
          duration: const Duration(milliseconds: 3500),
          builder: (context, value, child) {
            double shakeEffect =
                sin(value * pi / 10) * (5 * (1 - value / number));
            return Transform.translate(
              offset: Offset(shakeEffect, 0),
              child: Text(
                formatNumber(value),
                style: AppTextStyles.bodyLargeBold19,
              ),
            );
          },
        ),
        Text(
          title,
          style: AppTextStyles.bodyBasaSemiBold16,
        ),
      ],
    );
  }
}
