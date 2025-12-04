import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:login_page_1/views/components/InputField.dart';
import 'package:login_page_1/views/components/button.dart';
import 'package:login_page_1/views/components/squareButton.dart';
import 'package:login_page_1/views/home.dart';
import 'package:login_page_1/views/login.dart';
import 'package:login_page_1/views/provider/session.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: ListView(
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
              SizedBox(height: 20),
              Form(
                autovalidateMode: AutovalidateMode.onUnfocus,
                key: formKey,
                child: Column(
                  children: [
                    Inputfield(
                      obscureText: false,
                      controller: userNameController,
                      hintText: "Full Name",
                    ),
                    SizedBox(height: 20),
                    Inputfield(
                      obscureText: false,
                      controller: emailController,
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
              //sing in button
              SizedBox(height: 20),
              Selector<SessionUser, Function(String name, String email)>(
                selector: (context, sessionUser) => sessionUser.login,
                builder: (context, login, child) {
                  return Button(
                    isLoading: isLoading,
                    theme: "dark",
                    title: "Sing Up",
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          var response = await post(
                            Uri.parse(
                              "http://10.0.2.2:8000/api/v1/auth/signup",
                            ),
                            headers: {
                              "Content-Type": "application/json",
                              "Accept": "application/json",
                            },
                            body: jsonEncode({
                              "name": userNameController.text,
                              "email": emailController.text,
                              "password": passwordController.text,
                              "device_type": "mobile",
                            }),
                          );
                          var responseJson = jsonDecode(response.body);
                          print("response=----");
                          print(responseJson);
                          if (response.statusCode == 200) {
                            setState(() {
                              isLoading = false;
                            });
                            login(
                              responseJson["user"]["name"],
                              responseJson["user"]["email"],
                            );
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => Home()),
                            );
                          }
                          setState(() {
                            isLoading = false;
                          });
                        } catch (e) {
                          setState(() {
                            isLoading = false;
                          });
                          print("error: ${e}");
                        }
                        print("this form is valid");
                      } else {
                        print("this form is not valide");
                      }
                    },
                  );
                },
              ),
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
                    "Already have account !",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(
                        context,
                      ).push(MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      "Sing In",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.blue[800],
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
