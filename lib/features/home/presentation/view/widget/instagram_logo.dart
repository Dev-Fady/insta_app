import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class InstagramLogo extends StatelessWidget {
  const InstagramLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Ionicons.logo_instagram,
        size: 100,
        color: Colors.black,
      ),
    );
  }
}