import 'package:flutter/material.dart';

const theme = {"dark", "light", "danger", "success"};

class Button extends StatelessWidget {
  final String theme;
  final String title;
  final VoidCallback onPressed;
  bool isLoading = false;
  Button({
    super.key,
    required this.theme,
    required this.title,
    required this.onPressed,
    required this.isLoading,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          onPressed();
        },
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: theme == "dark" ? Colors.black : Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: isLoading
                ? CircularProgressIndicator(color: Colors.white)
                : Text(
                    title,
                    style: TextStyle(
                      color: theme == "dark" ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
