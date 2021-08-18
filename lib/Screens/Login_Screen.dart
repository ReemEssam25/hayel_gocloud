

import 'package:flutter/material.dart';
import 'package:hayel_gocloud/Screens/firstPage.dart';

class LoginScreen extends StatelessWidget {
  final EmailController = TextEditingController();

  final PasswordController = TextEditingController();
  void submitData() {
    final enteredEmail = EmailController.text;
    final enteredPass = PasswordController.text;

    if (enteredEmail.isEmpty || enteredPass.isEmpty) {
      return;
    }

  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Colors.white70,
        body: SingleChildScrollView(
          child: Container(
              width: (mediaQuery.size.width) * 0.8,
              height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.8,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    spreadRadius: 5,
                    blurRadius: 7,
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(50, 255, 100, 1).withOpacity(0.5),
                    Color.fromRGBO(70, 117, 100, 1).withOpacity(0.9),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0, 1],
                ),
              ),
              margin: EdgeInsets.only(
                  top: (mediaQuery.size.height - mediaQuery.padding.top) * 0.15,
                  left: (mediaQuery.size.width) * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      child: ListTile(
                    leading: Icon(Icons.login),
                    title: Text(
                      'enter your information below',
                      textScaleFactor: 1.5,
                      style: TextStyle(color: Colors.black26),
                    ),
                    subtitle: Text(
                      'Hayel App',
                      textScaleFactor: 1,
                      style: TextStyle(color: Colors.black26),
                    ),
                  )),
                  SizedBox(
                    height: 50,
                    child: Divider(
                      color: Colors.green[300],
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              color: Colors.black26, fontWeight: FontWeight.bold),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black12),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green[300]),
                          )),
                      controller: EmailController,
                      onSubmitted: (_) => submitData(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: 250,
                      child: TextField(
                        obscureText: true,
                        // cursorColor: Colors.green[500],
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                color: Colors.black26,
                                fontWeight: FontWeight.bold),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green[300]),
                            )),
                        controller: PasswordController,
                        onSubmitted: (_) => submitData(),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                      width: 250,
                      child: ElevatedButton(
                        child: Text('Login'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green[500],
                        ),
                        onPressed: (){
                          submitData();
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (BuildContext ctx) => FirstPage()));
                        },
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.green[300],
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: TextButton(
                      onPressed: submitData,
                      child: Text(
                        'forgot password',
                        style: TextStyle(
                            color: Colors.black26,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  )
                ],
              )),
        ));
  }
}
