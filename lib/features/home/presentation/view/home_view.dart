import 'package:flutter/material.dart';

import 'widget/body_home_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyHomePage(),
    );
  }
}

