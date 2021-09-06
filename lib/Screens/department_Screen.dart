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

  String token;
  ApiServices api = ApiServices.getinstance();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // getDepartments();

    final mediaQuery = MediaQuery.of(context);
    final departmentsController = TextEditingController();
    bool pressed = false;

    return Container(
      padding: EdgeInsets.all(15),
      // width: mediaQuery.size.width * 0.75,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
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
                                    api.createDepartment(
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
                  FutureBuilder(
                      future: api.fetchDepartmet(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Department>> snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return CircularProgressIndicator();
                          default:
                            if (snapshot.hasError)
                              return Text('Error ' + snapshot.error.toString());
                            else
                              _departments = snapshot.data;
                            return DataTable(
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
                                            initialValue:
                                                '${department.departmentName}',
                                            onFieldSubmitted: (val) {
                                              api.UpdateDepartment(
                                                  Department.withId(
                                                      department.id, val));
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
                                                api.deleteDepartment(
                                                    department.id);
                                              });
                                            }),
                                      )
                                    ]),
                                  )
                                  .toList(),
                            );
                        }
                      })
                ],
              ))
        ],
      ),
    );
  }
}
