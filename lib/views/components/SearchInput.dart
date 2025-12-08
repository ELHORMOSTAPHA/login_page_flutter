import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:login_page_1/controller/homecontroller.dart';

class Searchinput extends StatelessWidget {
  final controller;
  final String hinttext;
  final Function(String)? onchange;
  Searchinput({
    super.key,
    required this.controller,
    required this.hinttext,
    required this.onchange,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (value) {
        print("${value}");
        onchange!(value);
      },
      decoration: InputDecoration(
        hintText: hinttext,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
