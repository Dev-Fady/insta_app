import 'package:insta_app/features/reels/domain/entites/reels_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reels_model.g.dart';

@JsonSerializable()
class ReelsModelData {
  final ReelsModel data;
  ReelsModelData({required this.data});
  factory ReelsModelData.fromJson(Map<String, dynamic> json) =>
      _$ReelsModelDataFromJson(json);
  Map<String, dynamic> toJson() => _$ReelsModelDataToJson(this);

  ReelsEntityData toEntity() {
    return ReelsEntityData(reelsEntity: data.toEntity());
  }
}

@JsonSerializable()
class ReelsModel {
  final int count;
  final List<ItemsModels> items;
  ReelsModel({required this.count, required this.items});
  factory ReelsModel.fromJson(Map<String, dynamic> json) =>
      _$ReelsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReelsModelToJson(this);

  ReelsEntity toEntity() {
    return ReelsEntity(
        count: count, items: items.map((item) => item.toEntity()).toList());
  }
}

@JsonSerializable()
class ItemsModels {
  final String thumbnail_url;
  final bool is_video;
  final int like_count;
  final int comment_count;
  final String video_url;
  final CaptionModel? caption;

  ItemsModels({
    required this.thumbnail_url,
    required this.is_video,
    required this.like_count,
    required this.comment_count,
    this.caption,
    required this.video_url,
  });
  factory ItemsModels.fromJson(Map<String, dynamic> json) =>
      _$ItemsModelsFromJson(json);
  Map<String, dynamic> toJson() => _$ItemsModelsToJson(this);

  ReelsEntityItem toEntity() {
    return ReelsEntityItem(
      thumbnail_url: thumbnail_url,
      is_video: is_video,
      like_count: like_count,
      comment_count: comment_count,
      video_url: video_url,
      caption: caption?.toEntity(),
    );
  }
}

@JsonSerializable()
class CaptionModel {
  final String? text;
  CaptionModel({this.text});
  factory CaptionModel.fromJson(Map<String, dynamic> json) =>
      _$CaptionModelFromJson(json);
  Map<String, dynamic> toJson() => _$CaptionModelToJson(this);
  CaptionEntity toEntity() {
    return CaptionEntity(text: text);
  }
}
