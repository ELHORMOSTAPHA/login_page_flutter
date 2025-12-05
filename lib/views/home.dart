import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:login_page_1/views/components/cardprocut.dart';
import 'package:login_page_1/views/interfaces/global.dart';
import 'package:login_page_1/views/interfaces/user.dart';
import 'package:login_page_1/views/provider/UserProduct.dart';
import 'package:login_page_1/views/provider/session.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Item> items = [
    Item(
      pathImage: "assets/images/products/product1.png",
      title: "PC Lenovo",
      price: 20000,
    ),
    Item(
      pathImage: "assets/images/products/product2.png",
      title: "PC HP",
      price: 40000,
    ),
    Item(
      pathImage: "assets/images/products/product3.png",
      title: "PC Dell ",
      price: 35000,
    ),
    Item(
      pathImage: "assets/images/products/product4.png",
      title: "PC Asus ",
      price: 28000,
    ),
    Item(
      pathImage: "assets/images/products/product5.png",
      title: "PC Acer",
      price: 45000,
    ),
    Item(
      pathImage: "assets/images/products/product6.png",
      title: "MacBook ",
      price: 90000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Icon(Icons.heart_broken_sharp),
          Selector<UserProduct, int>(
            selector: (context, userPorduct) => userPorduct.favorite,
            builder: (context, favorite, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "${favorite.toInt()}",
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          ),
          Icon(Icons.card_travel),
          Selector<UserProduct, int>(
            selector: (context, userProduct) => userProduct.itemscart,
            builder: (context, cartItems, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "${cartItems.toInt()}",
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          ),
        ],
        iconTheme: IconThemeData(color: Colors.white),
        title: Selector<SessionUser, User>(
          selector: (context, sessionUser) => sessionUser.user,
          builder: (context, user, child) {
            return Text(
              "Welcome ${user.name}",
              style: TextStyle(color: Colors.white, fontSize: 16),
            );
          },
        ),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: items.length - 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      CardProduct(
                        pathImage: items[index].pathImage,
                        title: items[index].title,
                        price: items[index].price,
                      ),
                      CardProduct(
                        pathImage: items[index + 1].pathImage,
                        title: items[index + 1].title,
                        price: items[index + 1].price,
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
