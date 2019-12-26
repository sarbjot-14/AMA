import 'package:ama/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function switchAuthPage;
  SignIn({this.switchAuthPage});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';

  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to AMA'),
        actions: <Widget>[
          FlatButton.icon(
            icon: (Icon(Icons.person)),
            label: Text("register"),
            onPressed: () {
              widget.switchAuthPage();
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.isEmpty ? "Enter an email" : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.length < 4
                    ? "Please enter password more than 4 characters"
                    : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      dynamic User = await _auth.signInWithEmailAndPassword(
                          email, password);
                      if (User == null) {
                        setState(() {
                          error = "Could not sign in with those credentials";
                        });
                      }
                    }
                  }),
              SizedBox(
                height: 12.0,
              ),
              Text(error, style: TextStyle(color: Colors.red, fontSize: 14))
            ],
          ),
        ),
      ),
    );
  }
}
