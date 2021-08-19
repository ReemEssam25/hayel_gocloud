import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hayel_gocloud/Screens/department_Screen.dart';
import 'package:hayel_gocloud/Screens/employees_page.dart';

import 'home_page.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key}) : super(key: key);


  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<Widget> selectedPage = [HomePage(), departmentScreen(), EmployeesPage()];
  int index;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = 0;
  }

  void SelectedPage(int i)
  {
    setState(() {
      index = i;
    });
  }
  final GlobalKey<ScaffoldState> _drawerKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.circle)
      ),

      body: Scaffold(
        key:_drawerKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading:Container(
            margin: EdgeInsets.all(10),
            child: Center(
              child: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: (){
                    if (_drawerKey.currentState.isDrawerOpen)
                    {
                      Navigator.pop(context);
                    }
                    else{
                      _drawerKey.currentState.openDrawer();
                    }
                  }
              ),
            ),
            decoration: BoxDecoration(border: Border.all(color: Colors.black12), borderRadius: BorderRadius.circular(5)),
          ) ,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              //SizedBox(height: 15,),
              ListTile(
                title: const Text("Home"),
                leading: Icon(Icons.home, color: Colors.black,),
                onTap: ()
                {
                  Navigator.pop(context);
                  SelectedPage(0);
                },
              ),
              ListTile(
                title: const Text("Attend By Face"),
                leading: Icon(Icons.person, color: Colors.black,),
                onTap: ()
                {
                  Navigator.pop(context);
                  SelectedPage(1);
                },
              ),
              ListTile(
                title: const Text("Show QR"),
                leading: Icon(Icons.qr_code, color: Colors.black,),
                onTap: ()
                {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Departments"),
                leading: Icon(Icons.apartment, color: Colors.black,),
                onTap: ()
                {
                  Navigator.pop(context);
                  SelectedPage(1);
                },
              ),
              ListTile(
                title: const Text("Employees"),
                leading: Icon(Icons.people_alt, color: Colors.black,),
                onTap: ()
                {
                  Navigator.pop(context);
                  SelectedPage(2);
                },
              ),
              ExpansionTile(
                title: const Text("Message"),
                leading: Icon(Icons.add_alert_rounded, color: Colors.black,),
                children: [
                  ListTile(
                    title: const Text("Send New Message"),
                    leading: Icon(Icons.add_alert_rounded, color: Colors.black,),
                    onTap: ()
                    {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text("All Messages"),
                    leading: Icon(Icons.filter_frames_sharp, color: Colors.black,),
                    onTap: ()
                    {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              ExpansionTile(
                title: const Text("Reports"),
                leading: Icon(Icons.add_alert_rounded, color: Colors.black,),
                children: [
                  ListTile(
                    title: const Text("Send New Message"),
                    leading: Icon(Icons.add_alert_rounded, color: Colors.black,),
                    onTap: ()
                    {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text("All Messages"),
                    leading: Icon(Icons.filter_frames_sharp, color: Colors.black,),
                    onTap: ()
                    {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        body:SingleChildScrollView(child: selectedPage[index]),
      ),
    );
  }
}

/*SingleChildScrollView(
          child: Center(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  child: Container(
                    child: IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: (){
                          if (_drawerKey.currentState.isDrawerOpen)
                          {
                            Navigator.pop(context);
                          }
                          else{
                            _drawerKey.currentState.openDrawer();
                          }
                        }
                    ),
                    decoration: BoxDecoration(border: Border.all(color: Colors.black12), borderRadius: BorderRadius.circular(5)),
                  ),
                  color: Colors.white,
                )
                ,
                Container(
                  height: 10000,
                  child: selectedPage[index],
                )
              ],
            ),
          ),
        )*/