import 'package:ama/models/post.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final postList = Provider.of<List<Post>>(context);
    if (postList == null) {
      print("OKAAAY");
    }
    for (var value in postList) {
      print(value.title);
    }
    return ListView(
      scrollDirection: Axis.vertical,
      children: postList.map((aPost) {
        return ListTile(
          title: Text(aPost.title),
          subtitle: Text(aPost.content),
        );
      }).toList(),
    );
  }
}
