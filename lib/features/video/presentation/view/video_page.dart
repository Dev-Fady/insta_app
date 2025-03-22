import 'package:flutter/material.dart';
import 'package:insta_app/features/reels/domain/entites/reels_entity.dart';
import '../widget/reels_video_item.dart';

class VidePage extends StatelessWidget {
  VidePage({Key? key, required this.entityData, required this.initialIndex}) 
      : super(key: key);

  final ReelsEntityData entityData;
  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: initialIndex);
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: pageController,
        scrollDirection: Axis.vertical,
        itemCount: entityData.reelsEntity.count,
        itemBuilder: (context, index) {
          return ReelsVideoItem(
              entityItem: entityData.reelsEntity.items[index]);
        },
      ),
    );
  }
}
