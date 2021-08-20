import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:hayel_gocloud/models/UsersTable.dart';
import 'package:hayel_gocloud/models/api_services.dart';
import 'package:hayel_gocloud/models/department.dart';
import 'package:hayel_gocloud/models/users.dart';
import 'package:hayel_gocloud/widgets/departmentTable.dart';

import 'EditUser.dart';


class UsersScreen extends StatefulWidget {
  List<users> _Users = [];
  List<users> _searchList = [];
  List<users> temp = [];
  @override
  _UsersScreenState createState() => _UsersScreenState();
}



class _UsersScreenState extends State<UsersScreen> {
  @override
  submitdata() {}
  @override
  void addusers() {
    widget._Users.clear();
    widget._Users.add(
        new users("Ha", "01120", "hagar.ehab999@gmail.com", "Ha"));
    widget._Users.add(
        new users("nadine", "0112040", "nana.99@gmail.com", "nana"));
    widget._Users.add(
        new users("mohamed", "011314567", "mohamed.ehab999@gmail.com", "moha"));
    //widget._Users.add(new users(
    //  "Hagar", "01120408489", "hagar.ehab999@gmail.com", "Hagaaarrrrrrrr"));
    /* ApiServices.fetchUsers().then((response) {//lesa mat3amaletsh fel api services
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
    addusers();
    int dropdownValue = 50;
    final mediaQuery = MediaQuery.of(context);
    return Container(
            margin: EdgeInsets.all(15),
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text('Users',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.black,
                    )),
                Container(
                  width: mediaQuery.size.width,
                  child: Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 40,
                      width: 110,
                      child: ElevatedButton(
                        onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditUser()))
                        },
                        child: Text(
                          'Create',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.cyan,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 40,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditUser()))
                        },
                        child: Text(
                          'Create employee user ',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.cyan,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 40),
                  child: Row(
                    children: [
                      Text(
                        'Search:',
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 150,

                        //
                        child: TextField(
                          style: TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                              hoverColor: Colors.white24,
                              labelStyle: TextStyle(
                                  color: Colors.black12,
                                  fontWeight: FontWeight.bold),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.cyan.withOpacity(1),
                                    width: 3),
                              )),

                          onChanged: (val) {
                            setState(() {
                              widget.temp.clear();

                              if (val != null) {
                                print(val);
                                for (int i = 0;
                                    i < widget._Users.length;
                                    i++) {
                                  if (!widget.temp
                                          .contains(widget._Users[i]) &&
                                      (widget._Users[i].Email
                                              .contains(val) ||
                                          widget._Users[i].UserName
                                              .contains(val) ||
                                          widget._Users[i].Employename
                                              .contains(val) ||
                                          widget._Users[i].phone
                                              .contains(val))) {
                                    widget.temp.add(widget._Users[i]);
                                  }
                                }
                              }

                              widget._searchList = widget.temp;
                            });
                          },
                          // onSubmitted: (_) => submitData(),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                    // color: Colors.cyan,
                    width: 300,
                    child: Row(
                      children: [
                        Text('show '),
                        Container(
                          width: 50,
                          height: 25,
                          color: Colors.cyan,
                          child: DropdownButton<int>(
                              focusColor: Colors.cyan,
                              onChanged: (_) {},
                              items: <int>[10, 25, 50].map((int val) {
                                return DropdownMenuItem(
                                  value: val,
                                  child: new Text(val.toString()),
                                );
                              }).toList()),
                        ),
                        Text(' entries')
                      ],
                    )),
                SizedBox(
                  height: 50,
                ),
                widget._searchList.isEmpty
                    ? UsersTable(widget._Users)
                    : UsersTable(widget._searchList)
              ],
            ));
  }
}
