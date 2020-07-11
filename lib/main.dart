import 'package:flutter/material.dart';
import 'package:flutter_ui/configuration.dart';
import 'package:flutter_ui/screens/drawer_screen.dart';
import 'package:flutter_ui/screens/home_screen.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: primaryColor,
      body: Stack(
        children: [
          DrawerScreen(),
          HomeScreen(),
        ],
      ),
    );
  }
}
