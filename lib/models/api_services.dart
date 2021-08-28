import 'dart:convert' as convert;
import 'dart:convert';
//import 'dart:developer';
//import 'dart:html';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'employees_model.dart';

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

  static String employeeUrl = 'https://localhost:44328/employee/';


  Future fetchEmployee(String token) async {
    final response = await http.get(Uri.parse(employeeUrl+"GetAll"), headers: {
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

  static Map<String, String> header = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };
  static Future<bool> postEmployee(Employee employee, String token) async {
    var myEmployee = employee.toMap();
    var employeeBody = convert.json.encode(myEmployee);
    var res = await http.post(Uri.parse(employeeUrl+"Insert"),
        headers: {
          // "Access-Control-Allow-Origin": "*",
          //"Access-Control-Allow-Methods": "POST, OPTIONS",
          HttpHeaders.authorizationHeader: 'bearer $token',
          "Content-Type": "application/json"
        }, body: employeeBody);

    return Future.value(res.statusCode == 200 ? true : false);
  }


  static Future<bool> deleteEmployee(int id, String token) async {
    var res = await http.delete(Uri.parse(employeeUrl+"Delete/" + id.toString()),
      headers: <String, String>{
        HttpHeaders.authorizationHeader: 'bearer $token',
        "Content-Type": "application/json"
      },
    );
    return Future.value(res.statusCode == 200 ? true : false);
  }
}
//Creating a list to store input data;
 
