class users {
  String _id;
  String _username;
  String _email;
  String _phone;
  String _EmployeName;
  users(this._EmployeName, this._phone, this._email, this._username);
  users.withId(
      this._id, this._EmployeName, this._phone, this._email, this._username);

  String get id => _id;

  String get Employename => _EmployeName;

  String get UserName => _username;

  String get phone => _phone;
  String get Email => _email;

  set id(String id) => _id = id;

  set EmployeeName(String EName) => _EmployeName = EName;
  set UserName(String UName) => _username = UName;
  set phone(String phone) => _phone;
  set Email(String Email) => _email = Email;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["UserName"] = _username;
    map["EmployeeName"] = _EmployeName;
    map["Email"] = _email;
    map["phone"] = _phone;

    if (_id != null) {
      map["id"] = _id;
    }
    return map;
  }

  users.fromObject(dynamic o) {
    this._id = o["id"];
    this._email = o["Email"];
    this._EmployeName = o["EmployeeName"];
    this._phone = o["phone"];
    this._username = o["UserName"];
  }
  factory users.fromJson(dynamic json) {
    return users.withId(
        json["id"] as String,
        json["employeeName"] as String,
        json["phoneNumber"] as String,
        json["email"] as String,
        json["name"] as String);
  }
}
// this._id, this._EmployeName, this._phone, this._email, this._username