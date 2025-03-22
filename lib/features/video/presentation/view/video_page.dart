import 'package:flutter/material.dart';
import 'package:insta_app/features/post/domain/entites/posts_entity.dart';
import '../widget/reels_video_item.dart';

class VideoModel {
  final String url;
  final String userName;
  final String userImage;
  final String description;
  final int likes;
  final int comments;

  VideoModel({
    required this.url,
    required this.userName,
    required this.userImage,
    required this.description,
    required this.likes,
    required this.comments,
  });
}

class VidePage extends StatelessWidget {
  VidePage({Key? key, required this.itemsEntity}) : super(key: key);

  final ItemsEntity itemsEntity;

  @override
  Widget build(BuildContext context) {
    final List<VideoModel> _videos = [
      VideoModel(
        url: itemsEntity.video_url ?? '',
        userName: '',
        userImage: '',
        description: 'هذا هو الفيديو الأول',
        likes: itemsEntity.like_count,
        comments: itemsEntity.comment_count,
      ),
      VideoModel(
        url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        userName: 'User Two',
        userImage: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
        description: 'هذا هو الفيديو الثاني',
        likes: 980,
        comments: 40,
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _videos.length,
        itemBuilder: (context, index) {
          return ReelsVideoItem(video: _videos[index]);
        },
      ),
    );
  }
}
