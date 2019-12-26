import 'package:ama/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function switchAuthPage;
  Register({this.switchAuthPage});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        title: Text('Register with AMA'),
        actions: <Widget>[
          FlatButton.icon(
            icon: (Icon(Icons.person)),
            label: Text("sign in"),
            onPressed: widget.switchAuthPage,
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
                validator: (val) => val.length < 6
                    ? "Please enter password more than 6 characters"
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
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      dynamic User = await _auth.registerWithEmailAndPassword(
                          email, password);
                      if (User == null) {
                        setState(() {
                          error = "Please provide a valid email address";
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
