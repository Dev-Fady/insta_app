// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoModel _$InfoModelFromJson(Map<String, dynamic> json) => InfoModel(
      data: DataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InfoModelToJson(InfoModel instance) => <String, dynamic>{
      'data': instance.data,
    };

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      username: json['username'] as String,
      full_name: json['full_name'] as String,
      follower_count: (json['follower_count'] as num).toInt(),
      following_count: (json['following_count'] as num).toInt(),
      profile_pic_url_hd: json['profile_pic_url_hd'] as String,
      media_count: (json['media_count'] as num).toInt(),
      biography: json['biography'] as String,
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'username': instance.username,
      'full_name': instance.full_name,
      'follower_count': instance.follower_count,
      'following_count': instance.following_count,
      'profile_pic_url_hd': instance.profile_pic_url_hd,
      'biography': instance.biography,
      'media_count': instance.media_count,
    };
