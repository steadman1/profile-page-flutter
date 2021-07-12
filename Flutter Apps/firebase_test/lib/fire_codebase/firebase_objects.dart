class PostMetaData {
  final imageUrl;
  final likeCount;
  final postPath;
  final profileUrl;
  final username;
  final referenceId;
  PostMetaData( 
      {this.imageUrl,
      this.referenceId,
      this.profileUrl,
      this.username,
      this.likeCount,
      this.postPath});
}

class UserMetaData {
  final username;
  final givenName;
  final followers;
  final following;
  final bio;
  final profileUrl;
  final themeColor;
  UserMetaData(
      {this.username,
      this.givenName,
      this.followers,
      this.following,
      this.bio,
      this.profileUrl,
      this.themeColor});
}
