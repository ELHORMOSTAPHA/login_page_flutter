import 'package:flutter/material.dart';

class Inputfield extends StatelessWidget {
  final controller;
  final bool obscureText;
  final String hintText;
  Inputfield({
    super.key,
    required this.obscureText,
    required this.controller,
    required this.hintText,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        // autovalidateMode:,
        validator: (value) {
          if (value!.length < 5) {
            return "this field is required";
          }
        },
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red[900]!),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
