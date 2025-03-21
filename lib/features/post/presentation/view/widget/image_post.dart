import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../domain/entites/posts_entity.dart';

class ImagePost extends StatelessWidget {
  const ImagePost({
    super.key,
    required this.postsEntityData, required this.index,
  });

  final PostsEntityData postsEntityData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: postsEntityData.data.items[index].display_uri,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Image.asset(
        'assets/image/avatar.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
