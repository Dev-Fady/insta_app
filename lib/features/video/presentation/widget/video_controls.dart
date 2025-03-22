import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoControls extends StatefulWidget {
  final VideoPlayerController controller;

  const VideoControls({Key? key, required this.controller}) : super(key: key);

  @override
  State<VideoControls> createState() => _VideoControlsState();
}

class _VideoControlsState extends State<VideoControls> {
  void _rewind5Sec() => widget.controller
      .seekTo(widget.controller.value.position - const Duration(seconds: 5));

  void _forward5Sec() => widget.controller
      .seekTo(widget.controller.value.position + const Duration(seconds: 5));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              icon: const Icon(
                Icons.replay_5,
                size: 40,
                color: Colors.white,
              ),
              onPressed: _rewind5Sec),
          IconButton(
            icon: Icon(
                widget.controller.value.isPlaying
                    ? Icons.pause
                    : Icons.play_arrow,
                size: 40,
                color: Colors.white),
            onPressed: () {
              setState(() {
                if (widget.controller.value.isPlaying) {
                  widget.controller.pause();
                } else {
                  widget.controller.play();
                }
              });
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.forward_5,
              size: 40,
              color: Colors.white,
            ),
            onPressed: _forward5Sec,
          ),
        ],
      ),
    );
  }
}
