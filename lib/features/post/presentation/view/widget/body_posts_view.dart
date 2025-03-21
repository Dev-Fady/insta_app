import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:insta_app/core/helper_functions/router/router_name.dart';
import 'package:insta_app/features/post/domain/entites/posts_entity.dart';
import 'package:insta_app/features/post/presentation/view/widget/commits_and_likes.dart';
import 'package:insta_app/features/post/presentation/view/widget/image_post.dart';

class BodyPostsView extends StatelessWidget {
  const BodyPostsView({
    super.key,
    required this.postsEntityData,
  });

  final PostsEntityData postsEntityData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      constraints: const BoxConstraints(maxHeight: 350),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return GridView.builder(
            padding: const EdgeInsets.all(4.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
              childAspectRatio: 1.2 / 1.8,
            ),
            itemCount: postsEntityData.data.count,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  context.pushNamed(RouterName.videoPage);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ImagePost(postsEntityData: postsEntityData, index: index),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.7),
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                      CommitsAndLikes(
                          postsEntityData: postsEntityData, index: index),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
