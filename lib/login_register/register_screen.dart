import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/datadiriController.dart';
import 'login_screen.dart';
import 'verification.dart';

class register extends StatelessWidget {
  const register({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const registerPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class registerPage extends StatefulWidget {
  const registerPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  @override
  Widget build(BuildContext context) {
    var regisControl = Provider.of<dataDiriController>(context);
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
                    margin: EdgeInsets.fromLTRB(100, 40, 0, 0),
                    child: Image.asset(
                      'assets/images/Chicken.png',
                    ),
                  ),
                  Container(
                    width: 300,
                    margin: EdgeInsets.fromLTRB(60, 40, 0, 0),
                    child: TextField(
                        controller: regisControl.username,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            prefixIcon: Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.black,
                            ),
                            labelText: "Username",
                            errorText: regisControl.isUsernameEmpty == false
                                ? "Username Wajib Diisi"
                                : null,
                            labelStyle: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                            ))),
                  ),
                  Container(
                    width: 300,
                    margin: EdgeInsets.fromLTRB(60, 9, 0, 0),
                    child: TextField(
                        controller: regisControl.email,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          prefixIcon: Icon(
                            Icons.email,
                            size: 40,
                            color: Colors.black,
                          ),
                          labelText: "Email address",
                          errorText: regisControl.isemailEmpty == false
                              ? "Email Wajib Diisi"
                              : null,
                          labelStyle:
                              TextStyle(fontSize: 24, color: Colors.black),
                        )),
                  ),
                  Container(
                    width: 300,
                    margin: EdgeInsets.fromLTRB(60, 9, 0, 0),
                    child: TextField(
                        controller: regisControl.handphone,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          prefixIcon: Icon(
                            Icons.phone,
                            size: 40,
                            color: Colors.black,
                          ),
                          labelText: "Phone number",
                          errorText: regisControl.ishandphoneEmpty == false
                              ? "Phone number Wajib Diisi"
                              : null,
                          labelStyle:
                              TextStyle(fontSize: 24, color: Colors.black),
                        )),
                  ),
                  Container(
                    width: 300,
                    margin: EdgeInsets.fromLTRB(60, 9, 0, 0),
                    child: TextField(
                        controller: regisControl.password,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          prefixIcon: Icon(
                            Icons.lock,
                            size: 50,
                            color: Colors.black,
                          ),
                          labelText: "Password",
                          errorText: regisControl.isPasswordEmpty == false
                              ? "Password Wajib Diisi"
                              : null,
                          labelStyle:
                              TextStyle(fontSize: 24, color: Colors.black),
                        )),
                  ),
                  Container(
                    width: 300,
                    margin: EdgeInsets.fromLTRB(60, 9, 0, 0),
                    child: TextField(
                        controller: regisControl.confirmpassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          prefixIcon: Icon(
                            Icons.lock,
                            size: 50,
                            color: Colors.black,
                          ),
                          labelText: "Confirm Password",
                          errorText:
                              regisControl.isconfirmPasswordEmpty == false
                                  ? "Harus sesuai dengan password"
                                  : null,
                          labelStyle:
                              TextStyle(fontSize: 24, color: Colors.black),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(90, 40, 0, 0),
                    width: 241,
                    height: 53,
                    child: ElevatedButton(
                        onPressed: () {
                          regisControl.checkRegister();
                          if (regisControl.isUsernameEmpty == true &&
                              regisControl.isemailEmpty == true &&
                              regisControl.ishandphoneEmpty == true &&
                              regisControl.isPasswordEmpty == true &&
                              regisControl.isconfirmPasswordEmpty == true) {
                            regisControl.usernamee = regisControl.username.text;
                            regisControl.emaill = regisControl.email.text;
                            regisControl.handphonee =
                                regisControl.handphone.text;
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => verify()));
                          }
                        },
                        child: Text("Register",
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
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(44, 20, 0, 0),
                        child: Icon(
                          Icons.circle,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 20, 0, 0),
                        child: Icon(
                          Icons.circle,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 20, 0, 0),
                        child: Icon(
                          Icons.circle,
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(30, 20, 0, 0),
                          child: TextButton(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(200, 30, 16, 100)),
                            ),
                            onPressed: () {
                              Route route = MaterialPageRoute(
                                  builder: (context) => login());
                              Navigator.pushReplacement(context, route);
                            },
                          )),
                      Container(
                        margin: EdgeInsets.fromLTRB(30, 20, 0, 0),
                        child: Icon(
                          Icons.circle,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 20, 0, 0),
                        child: Icon(
                          Icons.circle,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 20, 0, 0),
                        child: Icon(
                          Icons.circle,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
