import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_app/core/cache/cache_helper.dart';
import 'package:insta_app/core/widget/custom_snackbar.dart';
import 'package:insta_app/features/home/presentation/manger/cubit/login_user_cubit.dart';
import 'package:insta_app/features/home/presentation/view/widget/instagram_logo.dart';
import 'package:insta_app/features/home/presentation/view/widget/login_button.dart';
import 'package:insta_app/features/home/presentation/view/widget/username_input_field.dart';
import 'package:insta_app/features/home/presentation/view/widget/username_label.dart';

import '../../../../../core/helper_functions/build_error_message.dart';

class BodyHomePage extends StatelessWidget {
  BodyHomePage({super.key});

  final TextEditingController userNameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginUserCubit, LoginUserState>(
      listener: (context, state) async {
        if (state is LoginUserSuccess) {
          CustomSnackbar.show(
            context: context,
            title: 'تم بنجاح!',
            message: 'تم التسجيل بنجاح',
            type: ContentType.success,
          );
          await CacheHelper().saveData(key: 'isLogin', value: true);
        } else if (state is LoginUserFailure) {
          buildErrorBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const InstagramLogo(),
                      SizedBox(height: 20.h),
                      const UsernameLabel(),
                      SizedBox(height: 10.h),
                      UsernameInputField(controller: userNameController),
                      SizedBox(height: 20.h),
                      if (state is LoginUserLoading)
                        const CircularProgressIndicator()
                      else
                        LoginButton(
                          formKey: formKey,
                          controller: userNameController,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
