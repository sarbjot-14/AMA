import 'package:ama/models/post.dart';
import 'package:ama/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Inbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    var postList = Provider.of<List<Post>>(context);
    postList =
        postList.where((item) => item.posterId == user.uid).toList(); //apples
    return ListView(
      scrollDirection: Axis.vertical,
      children: postList.map((aPost) {
        return ListTile(
          title: Text(aPost.title),
          subtitle: Text(aPost.content.length < 60
              ? aPost.content
              : aPost.content.substring(0, 60) + "...."),
        );
      }).toList(),
    );
  }
}
