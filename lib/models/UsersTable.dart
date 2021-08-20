
import 'package:flutter/material.dart';
import 'package:hayel_gocloud/Screens/EditUser.dart';
import 'package:hayel_gocloud/models/department.dart';
import 'package:hayel_gocloud/models/users.dart';


class UsersTable extends StatefulWidget {

  List<users> _Users;

  UsersTable(this._Users);
  bool icon_color = false;

  @override
  _UsersTableState createState() => _UsersTableState();
}



class _UsersTableState extends State<UsersTable> {
  Color color;

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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 100,
                //horizontalMargin: 20,
                columns: [
                  DataColumn(
                      numeric: false,
                      label: Row(
                        children: [
                          Text(
                            "User \nname",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black87,
                            ),
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
                      )),

                  //  tooltip:

                  DataColumn(
                      numeric: false,
                      label: Row(
                        children: [
                          Text(
                            "Employee name",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black87,
                            ),
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
                                        a.Employename.compareTo(b.Employename))
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
                                        b.Employename.compareTo(a.Employename))
                                  })
                            },
                          )
                        ],
                      )),

                  //  tooltip:

                  DataColumn(
                      numeric: false,
                      label: Row(
                        children: [
                          Text(
                            "Phone number",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black87,
                            ),
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
                                    widget._Users.sort(
                                        (a, b) => a.phone.compareTo(b.phone))
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
                                    widget._Users.sort(
                                        (a, b) => b.phone.compareTo(a.phone))
                                  })
                            },
                          )
                        ],
                      )),

                  //  tooltip:

                  DataColumn(
                      numeric: false,
                      label: Row(
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black87,
                            ),
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
                                    widget._Users.sort(
                                        (a, b) => a.Email.compareTo(b.Email))
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
                                    widget._Users.sort(
                                        (a, b) => b.Email.compareTo(a.Email))
                                  })
                            },
                          )
                        ],
                      )),

                  //  tooltip:

                  DataColumn(
                    label: SizedBox(
                      width: width * 0.05,
                    ),
                    numeric: false,
                  )
                ],

                rows: widget._Users.map(
                  (user) => DataRow(cells: [
                    DataCell(Text(
                      "${user.UserName}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                    )),
                    DataCell(Text(
                      "${user.Employename}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                    )),
                    DataCell(Text(
                      "${user.phone}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                    )),
                    DataCell(Text(
                      "${user.Email}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                    )),
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
                            onPressed: () => {
                                  setState(() => widget._Users.remove(user)),
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
            ),
          ],
        ));
  }
}
