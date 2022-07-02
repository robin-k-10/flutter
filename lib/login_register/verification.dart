import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../display_page.dart';
import 'login_screen.dart';

class verify extends StatelessWidget {
  const verify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    margin: EdgeInsets.fromLTRB(14, 40, 0, 0),
                    child: Text(
                      "Account Verification",
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(14, 50, 0, 0),
                    child: Text(
                      "Enter the 4 digit OTP code that was sent to your phone number",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                  Container(
                    height: 70,
                    margin: EdgeInsets.fromLTRB(60, 50, 0, 0),
                    child: Pinput(
                      pinAnimationType: PinAnimationType.fade,
                      obscureText: true,
                      defaultPinTheme: PinTheme(
                          width: 70.0,
                          textStyle: TextStyle(fontSize: 35),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                          )),
                      onCompleted: (val) {
                        Route route = MaterialPageRoute(
                            builder: (context) => DisplayPage());
                        Navigator.pushReplacement(context, route);
                      },
                    ),
                  ),
                  Container(
                    width: 480,
                    margin: EdgeInsets.only(top: 25),
                    child: Text(
                      "Resend Code",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 40, 0, 0),
                    child: Image.asset(
                      'assets/images/verify.png',
                      scale: 0.5,
                    ),
                  ),
                ],
              ),
            )));
  }
}
