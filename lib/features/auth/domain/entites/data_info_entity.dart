class DataInfoEntity {
  final InfoEntity infoEntity;
  DataInfoEntity({
    required this.infoEntity,
  });
}

class InfoEntity {
  final String userName;
  final String fullName;
  final int followerCount;
  final int followingCount;
  final String profilePicUrlJd;
  final String biography;
  final int media_count;

  InfoEntity({
    required this.userName,
    required this.fullName,
    required this.followerCount,
    required this.followingCount,
    required this.profilePicUrlJd,
    required this.biography,
    required this.media_count,
  });
}
