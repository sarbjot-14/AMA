class Post {
  String title;
  String content;
  String postUid = '';
  String posterName = '';
  String posterId;

  Post(
      {this.title, this.content, this.posterId, this.posterName, this.postUid});
}
