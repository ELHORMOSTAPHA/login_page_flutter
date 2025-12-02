import 'package:flutter/material.dart';

class Session_user extends ChangeNotifier {
  bool is_auth = false;
  Map user = {"name": "", "last_name": ""};
  Logout() {
    is_auth = false;
    notifyListeners();
  }

  login() {
    is_auth = true;
    user = {"name": "mostapha", "last_name": "elhor"};
    notifyListeners();
  }
}
