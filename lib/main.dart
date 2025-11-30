import 'package:flutter/material.dart';
import 'package:login_page_1/pages/login.dart';
import 'package:login_page_1/pages/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            bottom: TabBar(
              tabs: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Sign In", style: TextStyle(color: Colors.white)),
                ),
                Text('Sing Up', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          body: TabBarView(children: [Login(), Register()]),
        ),
      ),
    );
  }
}
