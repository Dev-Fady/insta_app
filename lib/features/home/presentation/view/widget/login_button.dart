import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_app/core/theme/app_text_styles.dart';
import 'package:insta_app/core/widget/cusstom_button.dart';
import 'package:insta_app/features/home/presentation/manger/cubit/login_user_cubit.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;

  const LoginButton({super.key, required this.formKey, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CusstomButton(
      buttonText: 'دخول',
      textStyle: AppTextStyles.bodyBasaBold16,
      onPressed: () {
        if (formKey.currentState!.validate()) {
          context.read<LoginUserCubit>().loginUser(userName: controller.text);
        }
      },
    );
  }
}
