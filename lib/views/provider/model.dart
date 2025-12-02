import 'package:flutter/material.dart';

class Session_user extends ChangeNotifier {
  bool is_auth = false;
  Map user = {"fullname": "", "email": ""};
  Logout() {
    is_auth = false;
    notifyListeners();
  }

  setUser(String fullname, String email) {
    user = {"fullname": fullname, "email": email};
    is_auth = true;
  }

  login() {
    is_auth = true;
    user = {"name": "mostapha", "last_name": "elhor"};
    notifyListeners();
  }
}
