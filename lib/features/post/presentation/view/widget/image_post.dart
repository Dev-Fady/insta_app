import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insta_app/features/post/domain/entites/posts_entity.dart';

class ImagePost extends StatelessWidget {
  const ImagePost({
    super.key,
    required this.postsEntityData,
    required this.index,
  });

  final PostsEntityData postsEntityData;
  final int index;

  @override
  Widget build(BuildContext context) {
    final isVideo = postsEntityData.data.items[index].is_video == true;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: postsEntityData.data.items[index].thumbnail_url ?? '',
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Image.asset(
                'assets/image/avatar.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (isVideo)
            Container(
              color: Colors.black.withOpacity(0.3), // تعتيم الخلفية قليلاً
              child: const Center(
                child: Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 60,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
