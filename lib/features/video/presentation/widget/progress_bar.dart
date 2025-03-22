import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key, required this.controller});

  final VideoPlayerController controller;

  String _formatDuration(Duration duration) {
    String minutes =
        duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<VideoPlayerValue>(
      valueListenable: controller,
      builder: (context, value, child) {
        final position = value.position;
        final duration = value.duration;
        if (duration.inMilliseconds == 0) return const SizedBox.shrink();
        double progress = position.inMilliseconds / duration.inMilliseconds;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formatDuration(position),
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Text(
                    _formatDuration(duration),
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTapDown: (details) {
                final box = context.findRenderObject() as RenderBox;
                final tapPos = box.globalToLocal(details.globalPosition);
                final newPosition =
                    (tapPos.dx / box.size.width * duration.inMilliseconds)
                        .clamp(0, duration.inMilliseconds);
                controller.seekTo(Duration(milliseconds: newPosition.toInt()));
              },
              child: Container(
                height: 12,
                child: LinearProgressIndicator(
                  value: progress.clamp(0, 1),
                  backgroundColor: Colors.white.withOpacity(0.3),
                  color: Colors.red,
                  minHeight: 5,
                  borderRadius: BorderRadius.circular(4),
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
