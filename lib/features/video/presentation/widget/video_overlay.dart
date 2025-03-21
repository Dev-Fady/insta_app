// widgets/video_overlay.dart
import 'package:flutter/material.dart';
import 'package:insta_app/features/video/presentation/view/video_page.dart';
// import '../models/video_model.dart';

class VideoOverlay extends StatelessWidget {
  final VideoModel video;

  const VideoOverlay({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                CircleAvatar(
                    radius: 16, backgroundImage: NetworkImage(video.userImage)),
                const SizedBox(width: 8),
                Text(video.userName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(video.description,
                style: const TextStyle(color: Colors.white, fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
