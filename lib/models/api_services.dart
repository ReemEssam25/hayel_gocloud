//import 'dart:convert' as convert;
import 'dart:convert';
//import 'dart:developer';
//import 'dart:html';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiServices {
  final departmentUrl = 'https://localhost:44328/department/GetAll';
  final UsersUrl = 'https://localhost:44328/Account/GetAll';

  Future fetchDepartmet(String token) async {
    final response = await http.get(Uri.parse(departmentUrl), headers: {
      HttpHeaders.authorizationHeader: 'bearer $token',
    });
    if (response.statusCode == 200) {
      print(response.body.toString());
      return response;
    } else {
      final responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        print(responseData['error']['message'].toString());
      }

      throw Exception('Failed to load departments from API');
    }
  }

  Future fetchUsers(String token) async {
    final response = await http.get(Uri.parse(UsersUrl), headers: {
      HttpHeaders.authorizationHeader: 'bearer $token',
    });
    if (response.statusCode == 200) {
      print(response.body.toString());
      return response;
    } else {
      throw Exception('Failed to load users from API');
    }
  }
}
//Creating a list to store input data;
