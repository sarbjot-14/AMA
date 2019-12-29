import 'package:ama/models/post.dart';
import 'package:ama/services/DatabaseService.dart';
import 'package:ama/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/CreatePost.dart';
import 'home/home.dart';
import 'home/inbox.dart';

class Base extends StatefulWidget {
  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Post>>.value(
      value: DatabaseService().getPosts,
      child: Scaffold(
        appBar: AppBar(
          title: Text("AMA"),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('sign out'),
              onPressed: () async {
                await AuthService().signOut();
              },
            ),
          ],
        ),
        body: _selectedIndex == 0 ? Home() : Inbox(),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inbox),
              title: Text('Inbox'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
        floatingActionButton: _selectedIndex == 1
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    CreatePost.routeName,
                  );
                },
                child: Icon(Icons.add),
                backgroundColor: Colors.green,
              )
            : null,
      ),
    );
  }
}
