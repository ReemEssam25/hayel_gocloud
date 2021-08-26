import 'dart:convert' as convert;
import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  static String departmentUrl = "https://localhost:44328/api/department";
  static Future fetchDepartmet() async {
    return await http.get(Uri.parse(departmentUrl));
  }

  static String employeeUrl = "https://localhost:44328/employee";
  static Future fetchEmployee() async {
    return await http.get(Uri.parse(employeeUrl));
  }
}
//Creating a list to store input data;
 