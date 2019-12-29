import 'package:flutter/cupertino.dart';

class Cookie extends ChangeNotifier {
  String currentUID;

  void set current_uid(String uid) {
    currentUID = uid;
    notifyListeners();
  }
}
