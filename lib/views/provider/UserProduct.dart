import 'package:flutter/material.dart';
import 'package:login_page_1/views/interfaces/global.dart';

class UserProduct extends ChangeNotifier {
  int favorite = 0;
  int itemscart = 0;
  List<Item> favorit = [];
  List<Item> cart = [];
  addTocart(Item item) {
    cart.add(item);
    itemscart++;
    notifyListeners();
  }

  addToFavorit(Item item) {
    favorit.add(item);
    favorite++;
    print("hello${favorite}");
    notifyListeners();
  }
}
