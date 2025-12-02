import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Squarebutton extends StatelessWidget {
  final String image;
  Squarebutton({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(8),
      child: Center(child: Image.asset(image, height: 50)),
    );
  }
}
