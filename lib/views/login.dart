import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:login_page_1/controller/authcontroller.dart';
import 'package:login_page_1/views/components/InputField.dart';
import 'package:login_page_1/views/components/button.dart';
import 'package:login_page_1/views/components/squareButton.dart';
import 'package:login_page_1/views/home.dart';
import 'package:login_page_1/views/provider/session.dart';
import 'package:login_page_1/views/register.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final userNameController = TextEditingController();

  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final Authcontroller _authcontroller = Get.put(Authcontroller());
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: 50),
              //logo
              // Icon(Icons.lock, size: 100),
              Image.asset("assets/images/login_anime.png", height: 250),
              //welcome back
              Center(
                child: Text(
                  "Wlecome Back ! you've been missed ",
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
              ),
              SizedBox(height: 50),
              Form(
                autovalidateMode: AutovalidateMode.onUnfocus,
                key: formKey,
                child: Column(
                  children: [
                    Inputfield(
                      obscureText: false,
                      controller: userNameController,
                      hintText: "Email or UserName",
                    ),
                    SizedBox(height: 20),
                    //textfield password
                    Inputfield(
                      obscureText: false,
                      controller: passwordController,
                      hintText: "Password",
                    ),
                  ],
                ),
              ),

              //textfield username
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
              Obx(() {
                return Button(
                  isLoading: _authcontroller.isLoading.value,
                  theme: "dark",
                  title: "Sign In",
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await _authcontroller.login(
                        email: userNameController.text,
                        password: passwordController.text,
                      );
                    } else {
                      print("not valide form");
                    }
                  },
                );
              }),
              //----or----
              SizedBox(height: 20),
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
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 40,
                children: [
                  Squarebutton(image: "assets/images/apple.png"),
                  Squarebutton(image: "assets/images/google.png"),
                ],
              ),
              //new membere register now
              SizedBox(height: 20),
              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New Member !",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(builder: (context) => Register()),
                      // );
                      Get.to(() => Register());
                    },
                    child: Text(
                      "Sing Up",
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// navigator.of(context).push(materialPageRoute(builder:(context) =>AboutUs()))