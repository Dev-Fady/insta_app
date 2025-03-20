import 'package:flutter/material.dart';
import 'package:insta_app/core/widget/app_text_form_field.dart';

class UsernameInputField extends StatelessWidget {
  final TextEditingController controller;

  const UsernameInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: 'أدخل اسم المستخدم',
      keyboardType: TextInputType.name,
      controller: controller,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'اسم المستخدم مطلوب';
        }
        return null;
      },
    );
  }
}
