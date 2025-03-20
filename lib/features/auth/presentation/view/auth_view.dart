import 'package:flutter/material.dart';

import 'widget/body_auth_page.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyAuthPage(),
    );
  }
}
