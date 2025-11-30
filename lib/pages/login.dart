import 'package:flutter/material.dart';
import 'package:login_page_1/components/InputField.dart';
import 'package:login_page_1/components/button.dart';
import 'package:login_page_1/components/squareButton.dart';

class Login extends StatelessWidget {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
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
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("click back up");
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(height: 50),
                    //logo
                    // Icon(Icons.lock, size: 100),
                    Image.asset("assets/images/login_anime.png", scale: 3),
                    //welcome back
                    Text(
                      "Wlecome Back ! you've been missed ",
                      style: TextStyle(color: Colors.grey[700], fontSize: 16),
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
                    Button(
                      theme: "dark",
                      title: "Sing In",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print("this form is valid");
                        } else {
                          print("this form is not valide");
                        }
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
                      children: [Text("New Member !"), Text("Sing Up")],
                    ),
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
