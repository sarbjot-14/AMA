import 'package:ama/models/post.dart';
import 'package:ama/screens/home/post_screen.dart';
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

    return ListView(
      scrollDirection: Axis.vertical,
      children: postList.map((aPost) {
        return ListTile(
          onTap: () => Navigator.of(context)
              .pushNamed(PostScreen.routeName, arguments: aPost),
          title: Text(aPost.title),
          subtitle: Text(aPost.content.length < 60
              ? aPost.content
              : aPost.content.substring(0, 60) + "...."),
        );
      }).toList(),
    );
  }
}
