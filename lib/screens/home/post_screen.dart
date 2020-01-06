import 'package:ama/models/Comment.dart';
import 'package:ama/models/post.dart';
import 'package:ama/services/DatabaseService.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  static const routeName = '/post-screen';
//  String postId;
//  PostScreen({this.postId})

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final _formkey = GlobalKey<FormState>();
  String commentString = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final Post post = ModalRoute.of(context).settings.arguments;
    String error = '';
    return Scaffold(
      appBar: AppBar(
        title: Text("AMA"),
      ),
      body: Container(
          child: ListView(
        padding: EdgeInsets.all(5),
        children: <Widget>[
          Card(child: Text(post == null ? '' : post.title)),
          ListTile(title: Text(post.content)),

          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Comment",
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.pink, width: 2.0))),
                    validator: (val) => val.isEmpty ? "Write a comment" : null,
                    onChanged: (val) {
                      setState(() => commentString = val);
                    },
                  ),
                  RaisedButton(
                      color: Colors.pink[400],
                      child: Text(
                        'Post Comment',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formkey.currentState.validate()) {
                          setState(() {
                            loading = true;
                          });

                          post.comments =
                              post.comments == null ? [] : post.comments;

                          post.comments.add(Comment(
                              content: commentString, commentor: post.postUid));

                          await DatabaseService(title: post.title).addComment(
                              Post(
                                  title: post.title,
                                  content: post.content,
                                  posterId: post.postUid,
                                  posterName: post.postUid,
                                  comments: post.comments));

                          setState(() {
                            loading = false;
                          });

                          ///dynamic user = await _auth.signInWithEmailAndPassword(email, password);
//                          if (user == null) {
//                            setState(() {
//                              error =
//                                  "Could not sign in with those credentials";
//                              loading = false;
//                            });
//                          }
                        }
                      }),
                  Text(error, style: TextStyle(color: Colors.red, fontSize: 14))
                ],
              ),
            ),
          ), //post comment button
          post.comments != null
              ? Column(
                  children: post.comments.map((comment) {
                  return ListTile(
                    title: Text(
                      comment.content,
                    ),
                  );
                }).toList())
              : [Text('')]
        ],
      )),
    );
  }
}
