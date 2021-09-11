import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hayel_gocloud/Screens/Login_Screen.dart';
import 'package:hayel_gocloud/Screens/UsersTable_Screen.dart';
import 'package:hayel_gocloud/Screens/department_Screen.dart';
import 'package:hayel_gocloud/Screens/editEmoployee_page.dart';
import 'package:hayel_gocloud/Screens/home_page.dart';
import 'package:hayel_gocloud/models/auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var user = prefs.getString('username');
  runApp(MyApp(myHome: user==null?LoginScreen():HomePage(),));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final Widget myHome;

  const MyApp({Key key, this.myHome}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Auth(),
      child: MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xFFEFEFF6),
            primarySwatch: Colors.lightGreen,
          ),
          home: myHome),
    );
  }
}
