import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('User View'),
      ),
      appBar: AppBar(
        title: const Text('User Details'),
      ),
    );
  }
}
