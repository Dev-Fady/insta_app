import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_app/features/auth/domain/entites/data_info_entity.dart';
import 'package:insta_app/features/user/presentation/widget/add_story.dart';
import 'package:insta_app/features/user/presentation/widget/grid_and_profile_toggle.dart';
import 'package:insta_app/features/user/presentation/widget/image_and_stat.dart';
import 'name_and_bio.dart';

class BodyUserView extends StatelessWidget {
  const BodyUserView({super.key, required this.dataInfoEntity});

  final DataInfoEntity dataInfoEntity;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: ImageAndStat(
          infoEntity: dataInfoEntity,
        )),
        SliverToBoxAdapter(child: SizedBox(height: 15.h)),
        SliverToBoxAdapter(
            child: NameAndBio(
          dataInfoEntity: dataInfoEntity,
        )),
        // SliverToBoxAdapter(
        //   child: CustomDivider(),
        // ),
        SliverToBoxAdapter(child: AddStory()),
        SliverToBoxAdapter(
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: GridAndProfileToggle())),
      ],
    );
  }
}
