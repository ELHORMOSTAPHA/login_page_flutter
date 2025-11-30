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
        initialIndex: 1,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 4,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              tabs: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Sign In"),
                ),
                Text('Sing Up'),
              ],
            ),
          ),
          body: TabBarView(children: [Login(), Register()]),
        ),
      ),
    );
  }
}
