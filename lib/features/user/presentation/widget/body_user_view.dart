import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_app/features/user/presentation/widget/add_story.dart';
import 'package:insta_app/features/user/presentation/widget/grid_and_profile_toggle.dart';
import 'package:insta_app/features/user/presentation/widget/image_and_stat.dart';
import 'name_and_bio.dart';

class BodyUserView extends StatefulWidget {
  const BodyUserView({super.key});

  @override
  State<BodyUserView> createState() => _BodyUserViewState();
}

class _BodyUserViewState extends State<BodyUserView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: ImageAndStat()),
        SliverToBoxAdapter(child: SizedBox(height: 15.h)),
        SliverToBoxAdapter(child: NameAndBio()),
        // SliverToBoxAdapter(
        //   child: CustomDivider(),
        // ),
        SliverToBoxAdapter(child: AddStory()),
        const SliverToBoxAdapter(child: GridAndProfileToggle()),
      ],
    );
  }
}
