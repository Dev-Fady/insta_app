class PostsEntityData {
  final PostsEntity data;
  PostsEntityData({required this.data});
}

class PostsEntity {
  final int count;
  final List<ItemsEntity> items;
  PostsEntity({required this.count, required this.items});
}

class ItemsEntity {
  final String? thumbnail_url;
  final bool is_video;
  final int like_count;
  final int comment_count;
  final String? video_url;

  ItemsEntity({
    this.thumbnail_url,
    required this.is_video,
    required this.like_count,
    required this.comment_count,
    this.video_url,
  });
}
