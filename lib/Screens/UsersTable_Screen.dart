import 'dart:convert';
import 'dart:core';

import 'package:hayel_gocloud/models/auth.dart';

import 'package:flutter/material.dart';
import 'package:hayel_gocloud/models/api_services.dart';

import 'package:hayel_gocloud/models/users.dart';
import 'package:hayel_gocloud/widgets/UsersTable.dart';
import 'package:provider/provider.dart';

import 'EditUser.dart';

class UsersScreen extends StatefulWidget {
  List<users> _Users = [];
  List<users> _searchList = [];
  List<users> temp = [];
  List<users> _ListNusers = [];
  bool firstPage = true;
  bool first = true;
  ApiServices api = ApiServices.getinstance();
  int dropdownValue = 50;
  int tablePageNumber = 1;
  @override
  State<StatefulWidget> createState() {
    return _UsersScreenState();
  }
}

class _UsersScreenState extends State<UsersScreen> {
  String token;
  @override
  submitdata() {}
  @override
  void showNentries(int dropdownvar) {
    List<users> temp = [];
    //widget._ListNusers = [];
    for (int i = widget._ListNusers.length * (widget.tablePageNumber - 1),
            j = 0;
        i < widget._Users.length && j < dropdownvar;
        j++, i++) {
      temp.add(widget._Users[i]);
    }
    setState(() {
      widget._ListNusers = temp;
    });
  }

  @override
  void initState() {
    //widget._Users= widget.api.fetchUsers();
    super.initState();
  }

  bool issearch = false;
  @override
  Widget build(BuildContext context) {
    // addusers();
    final mediaQuery = MediaQuery.of(context);
    return Container(
      margin: EdgeInsets.all(10),
      color: Colors.white,
      padding: EdgeInsets.all(20),
      // width: mediaQuery.size.width * 0.8,
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
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
              if (widget.firstPage)
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
                          color: Colors.black54, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 150,
                      child: TextField(
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                            hoverColor: Colors.white24,
                            labelStyle: TextStyle(
                                color: Colors.black12,
                                fontWeight: FontWeight.bold),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.cyan.withOpacity(1), width: 3),
                            )),

                        onChanged: (val) {
                          setState(() {
                            widget.temp.clear();
                            if (val != null) {
                              print(val);
                              for (int i = 0; i < widget._Users.length; i++) {
                                if (!widget.temp.contains(widget._Users[i]) &&
                                    (widget._Users[i].Email.contains(val) ||
                                        widget._Users[i].UserName
                                            .contains(val) ||
                                        widget._Users[i].Employename
                                            .contains(val) ||
                                        widget._Users[i].phone.contains(val))) {
                                  widget.temp.add(widget._Users[i]);
                                }
                              }
                            }
                            issearch = true;
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
              if (widget.firstPage)
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
                              value: widget.dropdownValue,
                              focusColor: Colors.cyan,
                              onChanged: (int value) {
                                setState(() {
                                  widget.dropdownValue = value;
                                  showNentries(value);
                                });
                              },
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
              FutureBuilder(
                  future: widget.api.fetchUsers(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<users>> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return CircularProgressIndicator();
                      default:
                        if (snapshot.hasError)
                          return Text('Error ' + snapshot.error.toString());
                        else {
                          widget._Users = snapshot.data;
                          //showNentries(widget.dropdownValue);
                          if (widget.first) {
                            widget._ListNusers = widget._Users;
                            widget.first = false;
                          }
                          if (widget._searchList.isEmpty) {
                            if (issearch) {
                              issearch = false;
                              return Center(
                                child: Text('no such user'),
                              );
                            } else
                              return UsersTable(widget._ListNusers);
                          } else
                            return UsersTable(widget._searchList);
                        }
                    }
                  }),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (widget.tablePageNumber > 1)
                            widget.tablePageNumber--;
                          widget.firstPage =
                              widget.tablePageNumber == 1 ? true : false;
                          showNentries(widget.dropdownValue);
                        });
                      },
                      child: Text(
                        'Previous',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.cyan,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          widget.firstPage = false;
                          int remainder =
                              (widget._Users.length % widget.dropdownValue) > 0
                                  ? 1
                                  : 0;
                          if ((widget._Users.length / widget._ListNusers.length)
                                      .floor() +
                                  remainder >
                              widget.tablePageNumber) {
                            widget.tablePageNumber++;

                            showNentries(widget.dropdownValue);
                          } else {
                            widget._ListNusers = [];
                          }
                        });
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.cyan,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
