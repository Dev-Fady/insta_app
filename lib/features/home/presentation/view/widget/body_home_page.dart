import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class BodyHomePage extends StatelessWidget {
  const BodyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        spacing: 20.h,
        children: [
          Center(
            child: Icon(
              Ionicons.logo_instagram,
              size: 100,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
