import 'dart:convert';

class Department {
  int _id;
  String _departmentName;
  Department(this._departmentName);
  Department.withId(this._id, this._departmentName);

  int get id => _id;

  String get departmentName => _departmentName;

  set id(int id) => _id = id;

  set departmentName(String departmentName) => _departmentName = departmentName;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["DepartmentName"] = _departmentName;
    if (_id != null) {
      map["id"] = _id;
    }
    return map;
  }

  Department.fromObject(dynamic o) {
    this._id = o["id"];
    this._departmentName = o["departmentName"];
  }

  // factory department.fromJson(Map<String, dynamic> json) {
  // return department.withId(
  // json['id'],
  //json['Name'],
  //);
  //}
// Instance method for converting a todo item to a map
  /* Map<String, dynamic> toMap() {
    return {"id": id, "DepartmentName": departmentName};
  }
}*/

  factory Department.fromJson(dynamic json) {
    return Department.withId(json["id"] as int, json["name"] as String);
  }

//  A helper method that converts a json array into List<ToDo>
  /* List<department> fromJson(String jsonData) {
    // Decode json to extract a map
    final data = json.decode(jsonData);
    // Map each todo JSON to a Todo object and return the result as a List<ToDo>
    return List<department>.from(data.map((item) => department.fromJson(item)));
  }
*/
// A helper method to convert the todo object to JSON String
  static String toJson(Department data) {
    final jsonData = data.toMap();
    return json.encode(jsonData);
    // First we convert the object to a map
    //   final jsonData = data.toMap();
    // Then we encode the map as a JSON string
    // return json.encode(jsonData);
  }
}
