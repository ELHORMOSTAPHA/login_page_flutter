import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_page_1/views/provider/model.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Selector<Session_user, Map>(
            selector: (context, session) => session.user,
            builder: (context, user, child) {
              return Center(
                child: Text(
                  "weclome ${user["fullname"]} ton email est ${user["email"]}",
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
