import 'package:ama/models/post.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  static const routeName = '/post-screen';
//  String postId;
//  PostScreen({this.postId})

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    final Post post = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("AMA"),
      ),
      body: Container(
          child: ListView(
        padding: EdgeInsets.all(5),
        children: <Widget>[
          Card(child: Text(post == null ? '' : post.title)),
          ListTile(title: Text(post.content))
        ],
      )),
    );
  }
}
