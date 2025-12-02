import 'package:flutter/material.dart';
import 'package:login_page_1/views/login.dart';
import 'package:login_page_1/views/provider/model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Model>(
      create: (context) => Model(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: Login()),
      ),
    );
  }
}
