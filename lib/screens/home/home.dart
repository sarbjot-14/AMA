import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        ListTile(
          title: Text("I am a ... AMA!"),
          subtitle: Text("I work with mentally ill at VGH"),
        ),
        ListTile(
          title: Text("I am a Professor... AMA!"),
          subtitle: Text("I work with mentally ill at VGH"),
        ),
        ListTile(
          title: Text("I am a Ceo... AMA!"),
          subtitle: Text("I work with mentally ill at VGH"),
        ),
      ],
    );
  }
}
