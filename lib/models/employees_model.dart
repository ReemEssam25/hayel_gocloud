import 'dart:core';

import 'package:hayel_gocloud/models/department.dart';

class Employee {

  int _id;
  int _code;
  String _englishName;
  String _arabicName;
  String _jobTitle;
  int _departmentid;
  String _insurance;
  String _email;

  Employee(this._code, this._englishName, this._arabicName, this._jobTitle, this._departmentid
      , this._insurance, this._email);
  Employee.withId(this._id,this._code, this._englishName, this._arabicName, this._jobTitle, this._departmentid
  , this._insurance, this._email);


  int get id=>_id;
  int get code=>_code;
  String get englishName =>_englishName;
  String get arabicName => _arabicName;
  String get jobTitle => _jobTitle;
  int get departmentId => _departmentid;
  String get insurance => _insurance;
  String get email => _email;

  set code (int newCode)
  {
    _code = newCode;
  }

  set englishName (String newEnglishName)
  {
    _englishName = newEnglishName;
  }

  set arabicName (String newArabicName)
  {
    _arabicName = newArabicName;
  }

  set jobTitle (newJobTitle)
  {
    _jobTitle = newJobTitle;
  }

  set departmentId (newDepartmentid)
  {
    _departmentid = newDepartmentid;
  }

  set insurance (newInsurance)
  {
    _insurance = newInsurance;
  }

  set email (newEmail)
  {
    _email = newEmail;
  }

  Map<String, dynamic> toMap(){
    var map = Map<String,dynamic>();
    map["Code"]=_code;
    map["EnglishName"] = _englishName;
    map["ArabicName"] = _arabicName;
    map["JobTitle"] = _jobTitle;
    map["DepartmentId"] = _departmentid;
    map["Insurance"] = _insurance;
    map["Email"] = _email;

    if (_id != null)
      {
        map["id"] = _id;
      }

    return map;
  }

  Employee.fromObject(dynamic o)
  {
    this._id=o["Id"];
    this.englishName = o["EnglishName"];
    this.arabicName = o["ArabicName"];
    this.jobTitle = o["JobTitle"];
    this.departmentId = o["DepartmentId"];
    this.insurance = o["Insurance"];
    this.email = o["Email"];
  }

}