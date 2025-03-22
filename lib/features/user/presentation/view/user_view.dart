import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:insta_app/core/cache/cache_helper.dart';
import 'package:insta_app/core/helper_functions/router/router_name.dart';
import 'package:insta_app/core/theme/app_text_styles.dart';

import '../../../auth/presentation/manger/cubit/login_user_cubit.dart';
import '../widget/body_user_view.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  final String userName = CacheHelper().getData(key: 'userName');

  @override
  void initState() {
    super.initState();
    context.read<LoginUserCubit>().loginUser(userName: userName);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginUserCubit, LoginUserState>(
      builder: (context, state) {
        if (state is LoginUserSuccess) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                state.dataInfoEntity.infoEntity.userName,
                style: AppTextStyles.heading23Bold,
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    CacheHelper().clearData();
                    context.pushReplacementNamed(RouterName.homePage);
                  },
                ),
              ],
            ),
            body: BodyUserView(dataInfoEntity: state.dataInfoEntity),
          );
        } else if (state is LoginUserLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LoginUserFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
