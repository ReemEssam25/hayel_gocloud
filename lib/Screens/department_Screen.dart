import 'dart:convert';
import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:hayel_gocloud/models/api_services.dart';
import 'package:hayel_gocloud/models/department.dart';
import 'package:hayel_gocloud/widgets/departmentTable.dart';






class departmentScreen extends StatefulWidget {
  const departmentScreen({Key key}) : super(key: key);

  @override
  _departmentScreenState createState() => _departmentScreenState();
}

class _departmentScreenState extends State<departmentScreen> {
  List<department> _departments = [];
  submitdata() {}
  getDepartments() {
    _departments.add(new department.withId(1, "web development"));
    _departments.add(new department.withId(2, "mobile development"));
    /* ApiServices.fetchDepartment().then((response) {
      Iterable list = json.decode(response.body);
      List<department> DepartmentTempList;
      DepartmentTempList =
          list.map((model) => department.fromObject(model)).toList();

      setState(() {
        departments = DepartmentTempList;
      });
    });*/
  }

  @override
  Widget build(BuildContext context) {
    getDepartments();
    final mediaQuery = MediaQuery.of(context);
    final departmentsController = TextEditingController();
    bool pressed = false;
    return Container(
        //  padding: EdgeInsets.only(top: mediaQuery.size.height * 0.1),
        width: mediaQuery.size.width * 0.7,
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
                                    borderSide:
                                        BorderSide(color: Colors.black12),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0))),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Colors.blueGrey[200].withOpacity(1),
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
                                  onPressed: () {},
                                  hoverColor: Theme.of(context).primaryColor,
                                )))),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            DepartmentsTable(_departments),
          ],
        ),
    );
  }
} /**/
