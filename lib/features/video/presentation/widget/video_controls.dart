// widgets/video_controls.dart
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoControls extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoControls({Key? key, required this.controller}) : super(key: key);

  void _rewind5Sec() => controller.seekTo(controller.value.position - const Duration(seconds: 5));
  void _forward5Sec() => controller.seekTo(controller.value.position + const Duration(seconds: 5));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(icon: const Icon(Icons.replay_5, size: 40, color: Colors.white), onPressed: _rewind5Sec),
          IconButton(
            icon: Icon(controller.value.isPlaying ? Icons.pause : Icons.play_arrow, size: 40, color: Colors.white),
            onPressed: () => controller.value.isPlaying ? controller.pause() : controller.play(),
          ),
          IconButton(icon: const Icon(Icons.forward_5, size: 40, color: Colors.white), onPressed: _forward5Sec),
        ],
      ),
    );
  }
}