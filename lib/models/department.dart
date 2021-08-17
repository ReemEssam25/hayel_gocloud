class department {
  int _id;
  String _departmentName;
  department(this._departmentName);
  department.withId(this._id, this._departmentName);

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

  department.fromObject(dynamic o) {
    this._id = o["id"];
    this._departmentName = o["departmentName"];
  }
}
