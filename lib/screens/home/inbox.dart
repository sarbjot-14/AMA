import 'package:flutter/material.dart';

class Inbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text("INBOXXX"),
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
