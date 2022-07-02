import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../display_page.dart';
import '../provider/datadiriController.dart';
import 'register_screen.dart';

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const loginPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class loginPage extends StatefulWidget {
  const loginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    var loginControl = Provider.of<dataDiriController>(context);
    return Scaffold(
        body: Container(
            width: 450,
            height: 850,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color.fromRGBO(194, 11, 16, 100),
                  Color.fromRGBO(251, 177, 18, 100)
                ])),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 237,
                    height: 249,
                    margin: EdgeInsets.fromLTRB(100, 60, 0, 0),
                    child: Image.asset(
                      'assets/images/Chicken.png',
                    ),
                  ),
                  Container(
                    width: 250,
                    margin: EdgeInsets.fromLTRB(100, 50, 0, 0),
                    child: TextField(
                        controller: loginControl.username,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.black,
                            ),
                            labelText: "Username",
                            errorText: loginControl.isUsernameEmpty == false
                                ? "Username Wajib Diisi"
                                : null,
                            labelStyle: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                            ))),
                  ),
                  Container(
                    width: 250,
                    margin: EdgeInsets.fromLTRB(100, 40, 0, 0),
                    child: TextField(
                        controller: loginControl.password,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            size: 50,
                            color: Colors.black,
                          ),
                          labelText: "Password",
                          errorText: loginControl.isPasswordEmpty == false
                              ? "Password Wajib Diisi"
                              : null,
                          labelStyle:
                              TextStyle(fontSize: 24, color: Colors.black),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(90, 60, 0, 0),
                    width: 241,
                    height: 53,
                    child: ElevatedButton(
                        onPressed: () {
                          loginControl.checkLogin();
                          if (loginControl.isUsernameEmpty == true &&
                              loginControl.isPasswordEmpty == true &&
                              loginControl.username.text.length > 0 &&
                              loginControl.password.text.length > 0) {
                            loginControl.usernamee = loginControl.username.text;
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DisplayPage()));
                          }
                        },
                        child: Text("Login",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(26.5))),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(254, 102, 55, 100)),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(135, 40, 0, 0),
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(105, 40, 0, 0),
                        child: Text(
                          "Don't have account? ",
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                          child: TextButton(
                            child: Text(
                              "Register Here",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromRGBO(200, 30, 16, 100)),
                            ),
                            onPressed: () {
                              Route route = MaterialPageRoute(
                                  builder: (context) => register());
                              Navigator.pushReplacement(context, route);
                            },
                          ))
                    ],
                  )
                ],
              ),
            )));
  }
}
