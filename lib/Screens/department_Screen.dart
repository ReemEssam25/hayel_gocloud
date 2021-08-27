//import 'dart:convert';
import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:hayel_gocloud/models/auth.dart';
import 'package:hayel_gocloud/models/department.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hayel_gocloud/models/api_services.dart';
import 'package:provider/provider.dart';

class departmentScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _departmentScreenState();
  }
}

class _departmentScreenState extends State<departmentScreen> {
  List<Department> _departments = [];
  ApiServices api = new ApiServices();
  String token;
  @override
  void initState() {
    super.initState();
    // _departments = api.fetchDepartmet() ;
    getDepartments();
  }

  deleteDepartment(int id) async {
    final response = await http.delete(
      Uri.parse("https://localhost:44328/department/Delete/$id"),
      headers: <String, String>{
        // "Access-Control-Allow-Origin": "*",
        //"Access-Control-Allow-Methods": "POST, OPTIONS",
        HttpHeaders.authorizationHeader: 'bearer $token',
        "Content-Type": "application/json"
      },
    );

    getDepartments();
  }

  UpdateDepartment(Department dep) async {
    final response =
        await http.post(Uri.parse("https://localhost:44328/department/Update"),
            headers: <String, String>{
              HttpHeaders.authorizationHeader: 'bearer $token',
              "Content-Type": "application/json"
            },
            body: jsonEncode({
              "id": dep.id,
              "name": dep.departmentName,
            }));
    if (response.statusCode != 200) {
      throw ('couldnot update department');
    }
    // getDepartments();
  }

  getDepartments() {
    token = Provider.of<Auth>(
      context,
      listen: false,
    ).token;
    api.fetchDepartmet(token).then((response) {
      var departmentJsonObject = jsonDecode(response.body)['data'] as List;
      List<Department> DepartmentTempList =
          departmentJsonObject.map((e) => Department.fromJson(e)).toList();

      setState(() {
        _departments = DepartmentTempList;
      });
    });
  }

  reloaddepartments(String depName) async {
    final response =
        await http.post(Uri.parse("https://localhost:44328/department/Insert"),
            headers: {
              // "Access-Control-Allow-Origin": "*",
              //"Access-Control-Allow-Methods": "POST, OPTIONS",
              HttpHeaders.authorizationHeader: 'bearer $token',
              "Content-Type": "application/json"
            },
            body: jsonEncode(<String, String>{
              'name': depName,
            }));

    //getDepartments();
    if (response.statusCode == 200) {
      getDepartments();
      return response;
    } else {
      throw Exception('failed to create deprtment');
    }
  }

  @override
  Widget build(BuildContext context) {
    // getDepartments();

    final mediaQuery = MediaQuery.of(context);
    final departmentsController = TextEditingController();
    bool pressed = false;

    return Scaffold(
        body: Container(
      //  padding: EdgeInsets.only(top: mediaQuery.size.height * 0.1),
      // width: mediaQuery.size.width * 0.75,
      child: ListView(
        padding: EdgeInsets.only(top: mediaQuery.size.height * 0.1),
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(20),
                    height: mediaQuery.size.height * 0.2,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Department name',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.black45),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  color: Colors.black12,
                                  fontWeight: FontWeight.bold),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueGrey[200].withOpacity(1),
                                    width: 3),
                              )),
                          controller: departmentsController,
                          // onSubmitted: (_) => submitData(),
                        ),
                      ],
                    )),
                Container(
                  height: mediaQuery.size.height * 0.1,
                  color: Colors.white30,
                  child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                              height: 40,
                              width: 100,
                              child: OutlineButton(
                                child: Text('Add new'),
                                borderSide: BorderSide(color: Colors.green),
                                onPressed: () {
                                  setState(() {
                                    reloaddepartments(
                                        departmentsController.text);
                                  });
                                },
                                hoverColor: Theme.of(context).primaryColor,
                              )))),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Departments ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                  Divider(
                    color: Color(0xFFEFEFF6),
                  ),
                  DataTable(
                    columnSpacing: 15,
                    columns: [
                      DataColumn(
                        label: Text(
                          "#",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                        ),
                        numeric: true,
                        //  tooltip:
                      ),
                      DataColumn(
                        label: Text(
                          "Department",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                        ),
                        numeric: false,
                        //  tooltip:
                      ),
                      DataColumn(
                        label: SizedBox(
                          width: 50,
                        ),
                        numeric: false,
                      )
                    ],
                    rows: _departments
                        .map(
                          (department) => DataRow(cells: [
                            DataCell(Text(
                              "${department.id}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black87,
                              ),
                            )),
                            DataCell(
                              SizedBox(
                                width: mediaQuery.size.width * 0.4,
                                child: TextFormField(
                                  initialValue: '${department.departmentName}',
                                  onFieldSubmitted: (val) {
                                    UpdateDepartment(
                                        Department.withId(department.id, val));
                                  },
                                ),
                              ),
                              showEditIcon: true,
                            ),
                            DataCell(
                              IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    size: 24,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      deleteDepartment(department.id);
                                    });
                                  }),
                            )
                          ]),
                        )
                        .toList(),
                  ),
                ],
              ))
        ],
      ),
    ));
  }
}
