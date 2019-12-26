import 'package:ama/screens/authenticate/register.dart';
import 'package:ama/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void switchAuthPage() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: showSignIn
          ? SignIn(switchAuthPage: switchAuthPage)
          : Register(switchAuthPage: switchAuthPage),
    );
  }
}
