class Comment {
  String content = '';
  String commentor = '';
  Comment({this.content, this.commentor});

  factory Comment.fromJson(Map<String, dynamic> parsedJson) {
    return Comment(
      content: parsedJson['content'],
      commentor: parsedJson['commentor'],
    );
  }
}
