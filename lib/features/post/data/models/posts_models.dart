import 'package:insta_app/features/post/domain/entites/posts_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'posts_models.g.dart';

@JsonSerializable()
class PostsModelsData {
  final PostsModels data;
  PostsModelsData({required this.data});
  factory PostsModelsData.fromJson(Map<String, dynamic> json) =>
      _$PostsModelsDataFromJson(json);
  Map<String, dynamic> toJson() => _$PostsModelsDataToJson(this);

  PostsEntityData toEntity() {
    return PostsEntityData(data: data.toEntity());
  }
}

@JsonSerializable()
class PostsModels {
  final int count;
  final List<ItemsModels> items;
  PostsModels({required this.count, required this.items});
  factory PostsModels.fromJson(Map<String, dynamic> json) =>
      _$PostsModelsFromJson(json);
  Map<String, dynamic> toJson() => _$PostsModelsToJson(this);

  PostsEntity toEntity() {
    return PostsEntity(
        count: count, items: items.map((item) => item.toEntity()).toList());
  }
}

@JsonSerializable()
class ItemsModels {
  final String display_uri;
  final bool is_video;
  final int like_count;
  final int comment_count;
  final String? video_url;

  ItemsModels(
      {required this.display_uri,
      required this.is_video,
      required this.like_count,
      required this.comment_count,
      this.video_url});
  factory ItemsModels.fromJson(Map<String, dynamic> json) =>
      _$ItemsModelsFromJson(json);
  Map<String, dynamic> toJson() => _$ItemsModelsToJson(this);

  ItemsEntity toEntity() {
    return ItemsEntity(
      display_uri: display_uri,
      is_video: is_video,
      like_count: like_count,
      comment_count: comment_count,
      video_url: video_url,
    );
  }
}
