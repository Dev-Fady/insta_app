import 'package:flutter/material.dart';
import 'package:insta_app/features/video/presentation/widget/IconButton.dart';
import 'package:insta_app/features/video/presentation/widget/reels_video_item.dart';

class VideoActionButtons extends StatelessWidget {
  const VideoActionButtons({
    super.key,
    required this.widget,
  });

  final ReelsVideoItem widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildIconButton(
            icon: Icons.favorite, label: '${widget.video.likes}'),
        const SizedBox(height: 20),
        BuildIconButton(
            icon: Icons.comment, label: '${widget.video.comments}'),
        const SizedBox(height: 20),
        BuildIconButton(icon: Icons.share, label: 'Share'),
      ],
    );
  }
}
