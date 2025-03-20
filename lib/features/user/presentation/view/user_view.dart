import 'package:flutter/material.dart';
import 'package:insta_app/core/theme/app_text_styles.dart';

import '../widget/body_user_view.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' My name',
          style: AppTextStyles.heading23Bold,
        ),
        centerTitle: true,
      ),
      body: BodyUserView(),
    );
  }
}
