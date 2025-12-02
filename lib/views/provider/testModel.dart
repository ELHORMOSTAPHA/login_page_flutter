import 'package:flutter/cupertino.dart';

class TestModel extends ChangeNotifier {
  int _counter = 0;
  int getConter() => _counter;
  void add() {
    _counter++;
    notifyListeners();
  }
}
