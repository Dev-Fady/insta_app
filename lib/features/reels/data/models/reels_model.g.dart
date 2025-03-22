// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reels_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReelsModelData _$ReelsModelDataFromJson(Map<String, dynamic> json) =>
    ReelsModelData(
      data: ReelsModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReelsModelDataToJson(ReelsModelData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ReelsModel _$ReelsModelFromJson(Map<String, dynamic> json) => ReelsModel(
      count: (json['count'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => ItemsModels.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReelsModelToJson(ReelsModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'items': instance.items,
    };

ItemsModels _$ItemsModelsFromJson(Map<String, dynamic> json) => ItemsModels(
      thumbnail_url: json['thumbnail_url'] as String,
      is_video: json['is_video'] as bool,
      like_count: (json['like_count'] as num).toInt(),
      comment_count: (json['comment_count'] as num).toInt(),
      caption: json['caption'] == null
          ? null
          : CaptionModel.fromJson(json['caption'] as Map<String, dynamic>),
      video_url: json['video_url'] as String,
    );

Map<String, dynamic> _$ItemsModelsToJson(ItemsModels instance) =>
    <String, dynamic>{
      'thumbnail_url': instance.thumbnail_url,
      'is_video': instance.is_video,
      'like_count': instance.like_count,
      'comment_count': instance.comment_count,
      'video_url': instance.video_url,
      'caption': instance.caption,
    };

CaptionModel _$CaptionModelFromJson(Map<String, dynamic> json) => CaptionModel(
      text: json['text'] as String?,
    );

Map<String, dynamic> _$CaptionModelToJson(CaptionModel instance) =>
    <String, dynamic>{
      'text': instance.text,
    };
