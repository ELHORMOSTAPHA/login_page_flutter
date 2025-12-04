import 'package:flutter/material.dart';
import 'package:login_page_1/views/interfaces/global.dart';
import 'package:login_page_1/views/provider/UserProduct.dart';
import 'package:provider/provider.dart';

class CardProduct extends StatelessWidget {
  String pathImage;
  String title;
  double price;
  CardProduct({
    super.key,
    required this.pathImage,
    required this.title,
    required this.price,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: BoxBorder.all(),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Image.asset(pathImage, height: 200),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("${title}"),
                      Expanded(child: Text("")),
                      Text("${price}"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      //title product
                      Selector<UserProduct, Function(Item item)>(
                        selector: (context, userProduct) =>
                            userProduct.addToFavorit,
                        builder: (context, addToFavorit, child) {
                          return GestureDetector(
                            onTap: () {
                              addToFavorit(
                                Item(
                                  pathImage: pathImage,
                                  title: title,
                                  price: price,
                                ),
                              );
                            },
                            child: Icon(
                              Icons.heart_broken_sharp,
                              color: Colors.red,
                            ),
                          );
                        },
                      ),
                      Expanded(child: Text("")),
                      //button
                      //addTocart
                      Selector<UserProduct, Function(Item item)>(
                        selector: (context, userProduct) =>
                            userProduct.addTocart,
                        builder: (context, addTocart, child) {
                          return GestureDetector(
                            onTap: () {
                              addTocart(
                                Item(
                                  pathImage: pathImage,
                                  title: title,
                                  price: price,
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                "Add to card",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
