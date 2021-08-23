import 'package:flutter/material.dart';
import 'package:hayel_gocloud/Screens/Login_Screen.dart';
import 'package:hayel_gocloud/Screens/editEmoployee_page.dart';
import 'package:hayel_gocloud/Screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFEFEFF6),
        primarySwatch: Colors.lightGreen,

      ),
      home: LoginScreen(),
    );
  }
}

