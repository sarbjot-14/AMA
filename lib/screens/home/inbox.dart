import 'package:ama/models/post.dart';
import 'package:ama/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Inbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    var postList = Provider.of<List<Post>>(context);
    postList == null
        ? []
        : postList.where((item) => item.posterId == user.uid).toList();
    return Text("what");
  }
}
