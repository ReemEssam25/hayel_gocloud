import 'dart:convert' as convert;
import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  static String departmentUrl = "https://localhost:44328/api/department";
  static Future fetchDepartmet() async {
    return await http.get(Uri.parse(departmentUrl));
  }
}
//Creating a list to store input data;
 