import 'package:flutter/material.dart';
import 'package:insta_app/features/video/presentation/view/video_page.dart';
import 'package:insta_app/features/video/presentation/widget/IconButton.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'progress_bar.dart';
import 'video_controls.dart';
import 'video_overlay.dart';

class ReelsVideoItem extends StatefulWidget {
  final VideoModel video;

  const ReelsVideoItem({Key? key, required this.video}) : super(key: key);

  @override
  State<ReelsVideoItem> createState() => _ReelsVideoItemState();
}

class _ReelsVideoItemState extends State<ReelsVideoItem> {
  late VideoPlayerController _videoController;
  late ChewieController _chewieController;
  bool _showControls = false;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.network(widget.video.url)
      ..initialize().then((_) => setState(() {}))
      ..play()
      ..setLooping(true);
    _chewieController = ChewieController(
      videoPlayerController: _videoController,
      autoPlay: true,
      looping: true,
      showControls: false,
    );
  }

  @override
  void dispose() {
    _videoController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => _showControls = !_showControls);
        if (_showControls) {
          Future.delayed(const Duration(seconds: 3),
              () => setState(() => _showControls = false));
        }
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: _videoController.value.isInitialized
                ? Chewie(controller: _chewieController)
                : const Center(child: CircularProgressIndicator()),
          ),
          VideoOverlay(video: widget.video),
          Align(
            alignment: Alignment.bottomCenter,
            child: ProgressBar(
              controller: _videoController,
            ),
          ),
          Positioned(
            bottom: 100,
            right: 16,
            child: Column(
              children: [
                BuildIconButton(
                    icon: Icons.favorite, label: '${widget.video.likes}'),
                const SizedBox(height: 20),
                BuildIconButton(
                    icon: Icons.comment, label: '${widget.video.comments}'),
                const SizedBox(height: 20),
                BuildIconButton(icon: Icons.share, label: 'Share'),
              ],
            ),
          ),
          if (_showControls) VideoControls(controller: _videoController),
        ],
      ),
    );
  }
}
