import 'package:flutter/material.dart';
import 'package:login_page_1/components/InputField.dart';
import 'package:login_page_1/components/button.dart';
import 'package:login_page_1/components/squareButton.dart';

class Login extends StatelessWidget {
  final userNameController = TextEditingController();
  Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(children: [Icon(Icons.menu, size: 50)]),
              ),
              Expanded(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),
                    //logo
                    Icon(Icons.lock, size: 100),
                    //welcome back
                    Text(
                      "Wlecome Back ! you've been missed ",
                      style: TextStyle(color: Colors.grey[700], fontSize: 16),
                    ),
                    SizedBox(height: 50),
                    //textfield username
                    Inputfield(
                      obscureText: false,
                      controller: userNameController,
                      hintText: "Email or UserName",
                    ),
                    SizedBox(height: 20),
                    //textfield password
                    Inputfield(
                      obscureText: false,
                      controller: userNameController,
                      hintText: "Password",
                    ),
                    SizedBox(height: 8),
                    //forget password
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [Text("Forget Password?")],
                      ),
                    ),
                    //sing in button
                    SizedBox(height: 20),
                    Button(theme: "dark", title: "Sing In"),
                    //----or----
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        spacing: 10,
                        children: [
                          Expanded(child: Divider(color: Colors.grey[700])),
                          Text("Or Continue With"),
                          Expanded(child: Divider(color: Colors.grey[700])),
                        ],
                      ),
                    ),
                    //buttons apple google
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 40,
                      children: [
                        Squarebutton(image: "lib/images/apple.png"),
                        Squarebutton(image: "lib/images/google.png"),
                      ],
                    ),
                    //new membere register now
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
