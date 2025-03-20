import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_app/core/cache/cache_helper.dart';
import 'package:insta_app/core/theme/app_text_styles.dart';
import 'package:insta_app/core/widget/app_text_form_field.dart';
import 'package:insta_app/core/widget/cusstom_button.dart';
import 'package:insta_app/core/widget/custom_snackbar.dart';
import 'package:insta_app/features/home/presentation/manger/cubit/login_user_cubit.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../../core/helper_functions/build_error_message.dart';

class BodyHomePage extends StatelessWidget {
  BodyHomePage({
    super.key,
  });

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
          // context.goNamed(RouterName.main_view);
        }
        if (state is LoginUserFailure) {
          buildErrorBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20.h,
                children: [
                  Center(
                    child: Icon(
                      Ionicons.logo_instagram,
                      size: 100,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "enter username",
                    style: AppTextStyles.bodyBasaBold16,
                  ),
                  AppTextFormField(
                    hintText: 'enter user name',
                    keyboardType: TextInputType.name,
                    controller: userNameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Username is required';
                      }
                      return null;
                    },
                  ),
                  if (state is LoginUserLoading)
                    Center(
                      child: CircularProgressIndicator(),
                    )
                  else
                    CusstomButton(
                      buttonText: 'enter ',
                      textStyle: AppTextStyles.bodyBasaBold16,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context
                              .read<LoginUserCubit>()
                              .loginUser(userName: userNameController.text);
                        }
                      },
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
