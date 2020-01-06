import 'package:ama/models/post.dart';
import 'package:ama/models/user.dart';
import 'package:ama/services/DatabaseService.dart';
import 'package:ama/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatePost extends StatefulWidget {
  static const routeName = '/create-post';
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String title = '';
  String content = '';

  String error = '';

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Create a post"),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Title",
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink, width: 2.0))),
              validator: (val) => val.isEmpty ? "Enter an title" : null,
              onChanged: (val) {
                setState(() => title = val);
              },
            ),
            SizedBox(height: 20.0),
            TextFormField(
              validator: (val) =>
                  val.length < 15 ? "Please add more content" : null,
              maxLines: 4,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 60),
                  hintText: "Content",
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink, width: 2.0))),
              onChanged: (val) {
                setState(() => content = val);
              },
            ),
            SizedBox(height: 20.0),
            RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formkey.currentState.validate()) {
                    setState(() {
                      loading = true;
                    });
                    //create doc
                    await DatabaseService(title: title).createPost(Post(
                        title: title,
                        content: content,
                        posterId: user.uid,
                        posterName: user.uid));
                    setState(() {
                      loading = false;
                    });
                    Navigator.of(context).pop();
                  }
                }),
            SizedBox(
              height: 12.0,
            ),
            Text(error, style: TextStyle(color: Colors.red, fontSize: 14))
          ],
        ),
      ),
    );
  }
}
