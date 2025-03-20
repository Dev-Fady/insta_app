import 'dart:math';

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
        TweenAnimationBuilder(
          tween: IntTween(begin: 0, end: number),
          duration: const Duration(milliseconds: 2500),
          child: Text(
            number.toString(),
            style: AppTextStyles.bodyLargeBold19,
          ),
          builder: (context, value, child) {
            double shakeEffect =
                sin(value * pi / 10) * (5 * (1 - value / number));
            return Transform.translate(
              offset: Offset(shakeEffect, 0),
              child: Text(
                value.toString(),
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
