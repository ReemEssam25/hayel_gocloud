import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hayel_gocloud/Screens/UsersTable_Screen.dart';
import 'package:hayel_gocloud/Screens/employees_page.dart';
import 'package:hayel_gocloud/models/api_services.dart';
import 'package:hayel_gocloud/models/auth.dart';
import 'package:provider/provider.dart';

import 'department_Screen.dart';
import 'home_page.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<Widget> selectedPage = [
    HomePage(),
    EmployeesPage(),
    UsersScreen(),
    departmentScreen()
  ];
  int index;
  String token;
  ApiServices api;
  @override
  void initState() {
    super.initState();
    token = Provider.of<Auth>(
      context,
      listen: false,
    ).token;
    api = new ApiServices(token);
    index = 0;
  }

  void SelectedPage(int i) {
    setState(() {
      index = i;
    });
  }

  final GlobalKey<ScaffoldState> _drawerKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.circle)),
      body: Scaffold(
        key: _drawerKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Container(
            margin: EdgeInsets.all(10),
            child: Center(
              child: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    if (_drawerKey.currentState.isDrawerOpen) {
                      Navigator.pop(context);
                    } else {
                      _drawerKey.currentState.openDrawer();
                    }
                  }),
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(5)),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              //SizedBox(height: 15,),
              ListTile(
                title: const Text("Home"),
                leading: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.pop(context);
                  SelectedPage(0);
                },
              ),
              ListTile(
                title: const Text("Attend By Face"),
                leading: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Show QR"),
                leading: Icon(
                  Icons.qr_code,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Departments"),
                leading: Icon(
                  Icons.apartment,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.pop(context);
                  SelectedPage(3);
                },
              ),
              ListTile(
                title: const Text("Employees"),
                leading: Icon(
                  Icons.people_alt,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.pop(context);
                  SelectedPage(1);
                },
              ),
              ExpansionTile(
                title: const Text("Message"),
                leading: Icon(
                  Icons.add_alert_rounded,
                  color: Colors.black,
                ),
                children: [
                  ListTile(
                    title: const Text("Send New Message"),
                    leading: Icon(
                      Icons.add_alert_rounded,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text("All Messages"),
                    leading: Icon(
                      Icons.filter_frames_sharp,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              ExpansionTile(
                title: const Text("Reports"),
                leading: Icon(
                  CupertinoIcons.square_list,
                  color: Colors.black,
                ),
                children: [
                  ListTile(
                    title: const Text("By Employee"),
                    leading: Icon(
                      Icons.assignment_rounded,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text("By Employee & Day"),
                    leading: Icon(
                      Icons.assignment_rounded,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text("Time Sheet"),
                    leading: Icon(
                      Icons.send,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              ExpansionTile(
                title: const Text("Settings"),
                leading: Icon(
                  CupertinoIcons.square_list,
                  color: Colors.black,
                ),
                children: [
                  ListTile(
                    title: const Text("Roles"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text("Users"),
                    onTap: () {
                      Navigator.pop(context);
                      SelectedPage(2);
                      //  Navigator.push(
                      //  context,
                      //MaterialPageRoute(builder: (context) => UsersScreen()),
                      //);
                    },
                  ),
                  ListTile(
                    title: const Text("Face Detection"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
        body: SingleChildScrollView(child: selectedPage[index]),
      ),
    );
  }
}
