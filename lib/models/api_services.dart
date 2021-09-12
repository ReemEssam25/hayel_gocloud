import 'dart:convert' as convert;
import 'dart:convert';
//import 'dart:developer';
import 'package:dio/dio.dart';

import 'package:hayel_gocloud/models/department.dart';
import 'package:hayel_gocloud/models/users.dart';
//import 'dart:html';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'auth.dart';
import 'employees_model.dart';

class ApiServices {
  final departmentUrl =
      'http://kerols3489-001-site1.btempurl.com/department/GetAll';
  final UsersUrl = 'http://kerols3489-001-site1.btempurl.com/Account/GetAll';

  static String employeeUrl = 'http://kerols3489-001-site1.btempurl.com/employee/';

  Dio dio = new Dio();

  String token;

  void initdio() {
    dio.options.headers["Authorization"] = 'bearer $token';
  }

  static final ApiServices _api = ApiServices._internal();
  factory ApiServices(String token) {
    _api.token = token;
    _api.initdio();
    return _api;
  }
  static ApiServices getinstance() {
    return _api;
  }

  ApiServices._internal();

  Future<List<users>> fetchUsers() async {
    final response = await dio.get(UsersUrl);
    try {
      return (response.data['data'] as List)
          .map((e) => users.fromJson(e))
          .toList();
    } catch (error, stacktrace) {
      throw Exception("errror: " +
          error.toString() +
          "  stacktrace " +
          stacktrace.toString());
    }
  }

  Future<void> deleteUser(String id) async {
    final response = await dio.delete(
        "http://kerols3489-001-site1.btempurl.com/Account/Delete?id=$id");

    //  widget.updateUsers();
  }

  Future<List<Department>> fetchDepartmet() async {
    final response = await dio.get(departmentUrl);
    try {
      return (response.data['data'] as List)
          .map((e) => Department.fromJson(e))
          .toList();
    } catch (error, stacktrace) {
      throw Exception("errror: " +
          error.toString() +
          "  stacktrace " +
          stacktrace.toString());
    }
  }

  createDepartment(String depName) async {
    final response = await dio.post(
        "http://kerols3489-001-site1.btempurl.com/department/Insert",
        data: jsonEncode(<String, String>{
          'name': depName,
        }));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('failed to create deprtment');
    }
  }



  Future<List<Employee>> fetchEmployee() async {
    final response = await dio.get(employeeUrl + "GetAll");
    try {
      return (response.data['data'] as List)
          .map((e) => Employee.fromJson(e))
          .toList();
    } catch (error, stacktrace) {
      throw Exception("errror: " +
          error.toString() +
          "  stacktrace " +
          stacktrace.toString());
    }

  }

  UpdateDepartment(Department dep) async {
    final response = await dio.post(
        "http://kerols3489-001-site1.btempurl.com/department/Update",
        data: jsonEncode({
          "id": dep.id,
          "name": dep.departmentName,
        }));

    if (response.statusCode != 200) {
      throw ('couldnot update department');
    }
    // getDepartments();
  }

  deleteDepartment(int id) async {
    final response = await dio.delete(
        "http://kerols3489-001-site1.btempurl.com/department/Delete/$id");

    //getDepartments();
  }

  Future<bool> postEmployee(Employee employee) async {
    var myEmployee = employee.toMap();
    var employeeBody = convert.json.encode(myEmployee);
    var res = await http.post(Uri.parse(employeeUrl + "Insert"),
        headers: {
          // "Access-Control-Allow-Origin": "*",
          //"Access-Control-Allow-Methods": "POST, OPTIONS",
          HttpHeaders.authorizationHeader: 'bearer $token',
          "Content-Type": "application/json"
        },
        body: employeeBody);

    return Future.value(res.statusCode == 200 ? true : false);
  }

  Future<Employee> updateEmployee(Employee e) async {
    var myEmployee = e.toMap();
    var employeeBody = convert.json.encode(myEmployee);
    final res = await http.put(Uri.parse(employeeUrl + "Update/"),
        headers: <String, String>{
          HttpHeaders.authorizationHeader: 'bearer $token',
          "Content-Type": "application/json"
        },
        body: employeeBody);

    if (res.statusCode == 200) {
      return Employee.fromJson(jsonDecode(res.body));
    } else {
      throw Exception('Faild to update an employee');
    }
  }

  Future<bool> deleteEmployee(int id) async {
    var res = await http.delete(
      Uri.parse(employeeUrl + "Delete/" + id.toString()),
      headers: <String, String>{
        HttpHeaders.authorizationHeader: 'bearer $token',
        "Content-Type": "application/json"
      },
    );
    return Future.value(res.statusCode == 200 ? true : false);
  }
}
//Creating a list to store input data;
 


