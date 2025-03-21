import 'package:insta_app/features/auth/domain/entites/data_info_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'info_model.g.dart';

@JsonSerializable()
class InfoModel {
  final DataModel data;
  InfoModel({required this.data});
  factory InfoModel.fromJson(Map<String, dynamic> json) =>
      _$InfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$InfoModelToJson(this);

  DataInfoEntity toEntity() {
    return DataInfoEntity(infoEntity: data.toEntity());
  }
}

@JsonSerializable()
class DataModel {
  final String username;
  final String full_name;
  final int follower_count;
  final int following_count;
  final String profile_pic_url_hd;
  final String biography;
  final int media_count;
  
  DataModel(
      {required this.username,
      required this.full_name,
      required this.follower_count,
      required this.following_count,
      required this.profile_pic_url_hd,
      required this.media_count,
      required this.biography});
  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);
  Map<String, dynamic> toJson() => _$DataModelToJson(this);
  InfoEntity toEntity() {
    return InfoEntity(
      userName: username,
      fullName: full_name,
      followerCount: follower_count,
      followingCount: following_count,
      profilePicUrlJd: profile_pic_url_hd,
      biography: biography,
      media_count: media_count,
    );
  }
}
