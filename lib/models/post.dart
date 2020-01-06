import 'Comment.dart';

class Post {
  String title;
  String content;
  String postUid = '';
  String posterName = '';
  String posterId;
  List<Comment> comments = [];

  Post(
      {this.title,
      this.content,
      this.posterId,
      this.posterName,
      this.postUid,
      this.comments});
}
