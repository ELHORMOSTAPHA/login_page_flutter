import 'package:flutter/material.dart';

class Model extends ChangeNotifier {
  int counter = 1;
  int counter2 = 1;
  getCounter() {
    return counter;
  }

  increment() {
    counter++;
    notifyListeners();
  }
}
