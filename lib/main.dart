import 'package:flutter/material.dart';
import 'package:hayel_gocloud/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFEFEFF6),
        primarySwatch: Colors.lightGreen,

      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final GlobalKey<ScaffoldState> _drawerKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {

    Widget selectedPage = HomePage();
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.circle)
      ),

      body: Scaffold(
        key: _drawerKey,
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
                },
              ),
              ListTile(
                title: const Text("Attend By Face"),
                leading: Icon(Icons.person, color: Colors.black,),
                onTap: ()
                {
                  Navigator.pop(context);
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
                },
              ),
              ListTile(
                title: const Text("Employees"),
                leading: Icon(Icons.people_alt, color: Colors.black,),
                onTap: ()
                {
                  Navigator.pop(context);
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
        body: Center(
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
              selectedPage
            ],
          ),
        ),
      ),
    );
  }
}
