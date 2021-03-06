import 'package:ama/screens/home/CreatePost.dart';
import 'package:ama/screens/home/post_screen.dart';
import 'package:ama/screens/wrapper.dart';
import 'package:ama/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: Wrapper(),
        // home: CategoriesScreen(),
        initialRoute: '/', // default is '/'
        routes: {
          '/': (ctx) => Wrapper(), // home screen is has tabs
          CreatePost.routeName: (ctx) => CreatePost(),
          PostScreen.routeName: (ctx) => PostScreen(),
        },
      ),
    );
  }
}
