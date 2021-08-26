import 'dart:convert' as convert;
import 'dart:convert';

import 'package:hayel_gocloud/models/employees_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static String departmentUrl = "https://localhost:44328/api/department";
  static Future fetchDepartmet() async {
    return await http.get(Uri.parse(departmentUrl));
  }

  static String employeeUrl = 'https://localhost:44328/employee/';
  static Future fetchEmployee() async {
    return await http.get(Uri.parse(employeeUrl));
  }

  static Map <String, String> header = {
    'Content-type' : 'application/json',
    'Accept' : 'application/json'
  };
  static Future<bool> postEmployee (Employee employee) async{
    var myEmployee = employee.toMap();
    var employeeBody = convert.json.encode(myEmployee);
    var res = await http.post(Uri.parse(employeeUrl), headers:header, body: employeeBody);

    return Future.value(res.statusCode == 200 ? true:false);
  }

  static Future<bool> deleteEmployee (int id) async{
    var res = await http.delete(Uri.parse(employeeUrl+id.toString()) , headers: header);
    return Future.value(res.statusCode == 200 ? true:false);
  }
}
//Creating a list to store input data;
 