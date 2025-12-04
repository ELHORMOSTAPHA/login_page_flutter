import 'package:flutter/material.dart';
import 'package:login_page_1/views/interfaces/user.dart';

class SessionUser extends ChangeNotifier {
  bool isAuth = false;
  User user = User("", "");
  String test = "hello test";

  changeTest() {
    test = "test";
    notifyListeners();
  }

  login(String name, String email) {
    isAuth = true;
    user.email = email;
    user.name = name;
    notifyListeners();
  }

  logout() {
    isAuth = false;
    user.email = "";
    user.name = "";
  }
}
