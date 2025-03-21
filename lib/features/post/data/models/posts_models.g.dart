// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostsModelsData _$PostsModelsDataFromJson(Map<String, dynamic> json) =>
    PostsModelsData(
      data: PostsModels.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostsModelsDataToJson(PostsModelsData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

PostsModels _$PostsModelsFromJson(Map<String, dynamic> json) => PostsModels(
      count: (json['count'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => ItemsModels.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostsModelsToJson(PostsModels instance) =>
    <String, dynamic>{
      'count': instance.count,
      'items': instance.items,
    };

ItemsModels _$ItemsModelsFromJson(Map<String, dynamic> json) => ItemsModels(
      display_uri: json['display_uri'] as String,
      is_video: json['is_video'] as bool,
      like_count: (json['like_count'] as num).toInt(),
      comment_count: (json['comment_count'] as num).toInt(),
      video_url: json['video_url'] as String?,
    );

Map<String, dynamic> _$ItemsModelsToJson(ItemsModels instance) =>
    <String, dynamic>{
      'display_uri': instance.display_uri,
      'is_video': instance.is_video,
      'like_count': instance.like_count,
      'comment_count': instance.comment_count,
      'video_url': instance.video_url,
    };
