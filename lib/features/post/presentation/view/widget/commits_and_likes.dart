import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_app/features/post/domain/entites/posts_entity.dart';

class CommitsAndLikes extends StatelessWidget {
  const CommitsAndLikes({
    super.key,
    required this.postsEntityData, required this.index,
  });

  final PostsEntityData postsEntityData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8,
      left: 8,
      right: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.favorite, color: Colors.red, size: 18),
              const SizedBox(width: 4),
              Text(
                postsEntityData.data.items[index].like_count.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.comment, color: Colors.white, size: 18.sp),
              SizedBox(width: 4.w),
              Text(
                postsEntityData.data.items[index].comment_count.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
