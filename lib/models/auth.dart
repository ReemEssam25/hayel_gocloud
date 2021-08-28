import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hayel_gocloud/Screens/UsersTable_Screen.dart';
import 'package:hayel_gocloud/Screens/department_Screen.dart';

import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  Future<int> login(
      String username, String password, BuildContext context) async {
    //  print("helloww " + username + "   " + password);
    var authHeader = '${base64.encode(utf8.encode('$username:$password'))}';

    //print('Bearer $authHeader');
    final url = Uri.parse('https://localhost:44328/Account/LoginWithJWT');
    final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          HttpHeaders.authorizationHeader: "Bearer $authHeader"
        },
        body: json.encode(<String, dynamic>{
          "userName": username.trim(),
          "password": password.trim(),
        }));

    print(response.statusCode);
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        print(responseData['error']['message'].toString());
      }
      _token = responseData['token'];
      _expiryDate = DateTime.parse(responseData['expiration']);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => departmentScreen()));
    }
    return response.statusCode;
  }
}
