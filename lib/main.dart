import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hayel_gocloud/Screens/Login_Screen.dart';
import 'package:hayel_gocloud/Screens/UsersTable_Screen.dart';
import 'package:hayel_gocloud/Screens/department_Screen.dart';
import 'package:hayel_gocloud/Screens/editEmoployee_page.dart';
import 'package:hayel_gocloud/Screens/home_page.dart';
import 'package:hayel_gocloud/models/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Auth(),
      child: MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xFFEFEFF6),
            primarySwatch: Colors.lightGreen,
          ),
          home: LoginScreen()),
    );
  }
}
