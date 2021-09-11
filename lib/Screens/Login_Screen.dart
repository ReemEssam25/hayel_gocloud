import 'package:flutter/material.dart';
import 'package:hayel_gocloud/models/auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final UsernameController = TextEditingController();
  final PasswordController = TextEditingController();
  var login;
  Map<String, String> _authData = {
    'username': '',
    'password': '',
  };
  bool showPassword = false;
  bool obsecurePassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey();
  //Auth auth = new Auth();
  validate(BuildContext context) async {
    final loginResponse = await login.login(
        _authData['username'], _authData['password'], context);
    if (loginResponse != 200)
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('invalid username or password')));
  }

  @override
  Widget build(BuildContext context) {
    login = Provider.of<Auth>(
      context,
      listen: false,
    );
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
            child: SingleChildScrollView(
                child: Container(
                    width: 300 + (mediaQuery.size.width - 300) * 0.1,
                    height: 400 + (mediaQuery.size.height - 400) * 0.25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topRight,
                            child: RotationTransition(
                                // alignment: FractionalOffset.topRight,
                                turns: new AlwaysStoppedAnimation(15 / 360),
                                child: Container(
                                  width: 130,
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      'Hayel app',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        Colors.deepPurple[50],
                                        Colors.deepPurple[600]
                                      ]),
                                      borderRadius: BorderRadius.circular(15)),
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.login,
                                    color: Colors.black45,
                                  ),
                                  Text(
                                    ' enter your information below',
                                    textScaleFactor: 1.3,
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 30,
                            child: Divider(
                              color: Colors.grey[350],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'username',
                                        labelStyle: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black12),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0))),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue[300]
                                                  .withOpacity(1),
                                              width: 3),
                                        )),
                                    controller: UsernameController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Invalid email!';
                                      }
                                      print("in validatorrr");
                                      return null;
                                    },
                                    onSaved: (value) async {
                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                      prefs.setString('username', value);
                                      _authData['username'] = value;
                                      print(" _authData['username'] " +
                                          _authData['username'].toString());
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    obscureText: obsecurePassword,
                                    decoration: InputDecoration(
                                        labelText: 'Password',
                                        prefixIcon: Icon(Icons.security),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            Icons.remove_red_eye,
                                          ),
                                          color: showPassword
                                              ? Colors.blue
                                              : Colors.grey,
                                          onPressed: () => {
                                            setState(() => {
                                                  showPassword = !showPassword,
                                                  obsecurePassword =
                                                      !obsecurePassword,
                                                })
                                          },
                                        ),
                                        labelStyle: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black12),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0))),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue[300]
                                                  .withOpacity(1),
                                              width: 3),
                                        )),
                                    controller: PasswordController,
                                    validator: (value) {
                                      // print('in password validator  ');
                                      if (value.isEmpty) {
                                        return 'Invalid password';
                                      }

                                      return null;
                                    },
                                    onSaved: (value) {
                                      _authData['password'] = value;
                                    },
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                              width: 250,
                              child: ElevatedButton(
                                child: Text('sign in'),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.deepPurple[400],
                                ),
                                onPressed: () => {
                                  if (!_formKey.currentState.validate())
                                    {
                                      print("invalidddd"),
                                    }
                                  else
                                    {
                                      _formKey.currentState.save(),
                                      validate(context)
                                    }
                                },
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                            color: Colors.grey[350],
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'forgot password',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                          )
                        ],
                      ),
                    )))));
  }
}
