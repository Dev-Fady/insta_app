class ReelsEntityData {
  final ReelsEntity reelsEntity;

  ReelsEntityData({required this.reelsEntity});
}

class ReelsEntity {
  final int count;
  final List<ReelsEntityItem> items;

  ReelsEntity({required this.count, required this.items});
}

class ReelsEntityItem {
  final CaptionEntity? caption;
  final bool is_video;
  final int like_count;
  final String thumbnail_url;
  final int comment_count;
  final String video_url;

  ReelsEntityItem(
      {this.caption,
      required this.is_video,
      required this.like_count,
      required this.thumbnail_url,
      required this.comment_count,
      required this.video_url});
}

class CaptionEntity {
  final String? text;

  CaptionEntity({this.text});
}
