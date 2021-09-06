import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hayel_gocloud/Screens/EditUser.dart';
import 'package:hayel_gocloud/models/api_services.dart';

import 'package:hayel_gocloud/models/users.dart';
import 'package:http/http.dart' as http;

class UsersTable extends StatefulWidget {
  List<users> _Users;

  //final Function updateUsers;
  UsersTable(this._Users);
  bool icon_color = false;

  @override
  State<StatefulWidget> createState() {
    return _UsersTableState();
  }
}

class _UsersTableState extends State<UsersTable> {
  Color color;

  ApiServices api = ApiServices.getinstance();
  updateUsers() async {
    List<users> tem = await api.fetchUsers();
    setState(() {
      widget._Users = tem;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        //  padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DataTable(
              //columnSpacing: 100,
              dividerThickness: 0,
              columnSpacing: 0,
              dataRowHeight: 50,
              headingRowHeight: 40,
              horizontalMargin: 10,
              columns: [
                // DataColumn(label: tableField(Colors.black, "Code", 70),),
                DataColumn(
                    numeric: false,
                    label: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(5),
                      height: 40,
                      width: 150,
                      child: Flex(
                        direction: Axis.vertical,
                        children: [
                          Row(
                            children: [
                              Text(
                                "User name",
                                style: TextStyle(fontSize: 17, color: color),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_upward,
                                  size: 20,
                                  color: widget.icon_color
                                      ? Colors.black
                                      : Colors.black45,
                                ),
                                padding: EdgeInsets.all(0),
                                constraints: BoxConstraints(maxWidth: 20),
                                onPressed: () => {
                                  setState(() => {
                                        widget.icon_color = true,
                                        widget._Users.sort((a, b) =>
                                            a.UserName.compareTo(b.UserName))
                                      })
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_downward,
                                  size: 20,
                                  color: widget.icon_color
                                      ? Colors.black45
                                      : Colors.black,
                                ),
                                padding: EdgeInsets.all(0),
                                constraints: BoxConstraints(maxWidth: 20),
                                onPressed: () => {
                                  setState(() => {
                                        widget.icon_color = false,
                                        widget._Users.sort((a, b) =>
                                            b.UserName.compareTo(a.UserName))
                                      })
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                    )),
                DataColumn(
                    numeric: false,
                    label: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(5),
                      height: 40,
                      width: 175,
                      child: Flex(
                        direction: Axis.vertical,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Employee name",
                                style: TextStyle(fontSize: 17, color: color),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_upward,
                                  size: 20,
                                  color: widget.icon_color
                                      ? Colors.black
                                      : Colors.black45,
                                ),
                                padding: EdgeInsets.all(0),
                                constraints: BoxConstraints(maxWidth: 20),
                                onPressed: () => {
                                  setState(() => {
                                        widget.icon_color = true,
                                        widget._Users.sort((a, b) =>
                                            a.Employename.compareTo(
                                                b.Employename))
                                      })
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_downward,
                                  size: 20,
                                  color: widget.icon_color
                                      ? Colors.black45
                                      : Colors.black,
                                ),
                                padding: EdgeInsets.all(0),
                                constraints: BoxConstraints(maxWidth: 20),
                                onPressed: () => {
                                  setState(() => {
                                        widget.icon_color = false,
                                        widget._Users.sort((a, b) =>
                                            b.Employename.compareTo(
                                                a.Employename))
                                      })
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                    )),

                //  tooltip:

                DataColumn(
                    numeric: false,
                    label: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(5),
                      height: 40,
                      width: 167,
                      child: Flex(
                        direction: Axis.vertical,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Phone Number",
                                style: TextStyle(fontSize: 17, color: color),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_upward,
                                  size: 20,
                                  color: widget.icon_color
                                      ? Colors.black
                                      : Colors.black45,
                                ),
                                padding: EdgeInsets.all(0),
                                constraints: BoxConstraints(maxWidth: 20),
                                onPressed: () => {
                                  setState(() => {
                                        widget.icon_color = true,
                                        widget._Users.sort((a, b) =>
                                            a.phone.compareTo(b.phone))
                                      })
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_downward,
                                  size: 20,
                                  color: widget.icon_color
                                      ? Colors.black45
                                      : Colors.black,
                                ),
                                padding: EdgeInsets.all(0),
                                constraints: BoxConstraints(maxWidth: 20),
                                onPressed: () => {
                                  setState(() => {
                                        widget.icon_color = false,
                                        widget._Users.sort((a, b) =>
                                            b.phone.compareTo(a.phone))
                                      })
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                    )),
                DataColumn(
                    numeric: false,
                    label: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(5),
                      height: 40,
                      width: 100,
                      child: Flex(
                        direction: Axis.vertical,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(fontSize: 17, color: color),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_upward,
                                  size: 20,
                                  color: widget.icon_color
                                      ? Colors.black
                                      : Colors.black45,
                                ),
                                padding: EdgeInsets.all(0),
                                constraints: BoxConstraints(maxWidth: 20),
                                onPressed: () => {
                                  setState(() => {
                                        widget.icon_color = true,
                                        widget._Users.sort((a, b) =>
                                            a.Email.compareTo(b.Email))
                                      })
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_downward,
                                  size: 20,
                                  color: widget.icon_color
                                      ? Colors.black45
                                      : Colors.black,
                                ),
                                padding: EdgeInsets.all(0),
                                constraints: BoxConstraints(maxWidth: 20),
                                onPressed: () => {
                                  setState(() => {
                                        widget.icon_color = false,
                                        widget._Users.sort((a, b) =>
                                            b.Email.compareTo(a.Email))
                                      })
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                    )),

                DataColumn(
                  label: SizedBox(
                    width: width * 0.05,
                  ),
                  numeric: false,
                )
              ],

              rows: widget._Users.map(
                (user) => DataRow(cells: [
                  DataCell(tableField(user.UserName, 150)),
                  DataCell(tableField(user.Employename, 175)),
                  DataCell(tableField(user.phone, 167)),
                  DataCell(tableField(user.Email, 230)),
                  DataCell(Row(
                    children: [
                      ElevatedButton(
                        child:
                            Text('Edit', style: TextStyle(color: Colors.white)),
                        onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditUser()))
                        },
                        // icon: Icon(Icons.update_sharp),
                        style: ElevatedButton.styleFrom(primary: Colors.cyan),
                        // label: Text('')),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      ElevatedButton.icon(
                          onPressed: () {
                            api
                                .deleteUser(user.id)
                                .then((value) => updateUsers());
                            // sleep(Duration(seconds: 5));

                            //sleep(Duration(seconds: 5));
                            print(widget._Users.length);
                            setState(() {
                              widget._Users;
                            });
                            //widget._Users = api.fetchUsers() as List<users>;
                          },
                          style: ElevatedButton.styleFrom(primary: Colors.cyan),
                          icon: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          label: Text(''))
                    ],
                  ))
                ]),
              ).toList(),
            ),
          ],
        ));
  }
}

Widget tableField(String title, double width) {
  return Container(
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.all(5),
    //height: ,
    width: width,
    child: Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 17, color: Colors.grey),
          ),
        ),
      ],
    ),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey, width: 1),
    ),
  );
}
