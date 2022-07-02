import 'package:chickenise_app_frontend/provider/dataMenu.dart';
import 'package:chickenise_app_frontend/provider/dataRecomended.dart';
import 'package:chickenise_app_frontend/provider/reviewProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'login_register/login_screen.dart';
import 'provider/datadiriController.dart';
import 'provider/homeprovider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => dataDiriController()),
      ChangeNotifierProvider(create: (_) => homeprovider()),
      ChangeNotifierProvider(create: (_) => dataRecomended()),
      ChangeNotifierProvider(create: (_) => dataMenu()),
      ChangeNotifierProvider(create: (_) => chipMenu()),
      ChangeNotifierProvider(create: (_) => dataReview())
    ],
    child: const tampilanAwal(),
  ));
}

class tampilanAwal extends StatelessWidget {
  const tampilanAwal({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.orange, fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      home: const tampilanAwalPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class tampilanAwalPage extends StatefulWidget {
  const tampilanAwalPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<tampilanAwalPage> createState() => _tampilanAwalPageState();
}

class _tampilanAwalPageState extends State<tampilanAwalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: 450,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromRGBO(194, 13, 16, 100),
            Color.fromRGBO(250, 174, 18, 100)
          ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 100, 0, 0),
            height: 70,
            child: Text("Welcome,",
                style: TextStyle(fontSize: 36, color: Colors.white)),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(70, 0, 0, 0),
            child: Text("Chicken Lovers",
                style: TextStyle(
                    fontSize: 36,
                    color: Color.fromRGBO(68, 3, 3, 100),
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            width: 400,
            height: 400,
            margin: EdgeInsets.fromLTRB(20, 40, 0, 0),
            child: Image.asset(
              'assets/images/Chicken.png',
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(90, 40, 0, 0),
            width: 241,
            height: 53,
            child: ElevatedButton(
                onPressed: () {
                  Route route =
                      MaterialPageRoute(builder: (context) => login());
                  Navigator.pushReplacement(context, route);
                },
                child: Text("Start",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26.5))),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(254, 102, 55, 100)),
                )),
          ),
        ],
      ),
    ));
  }
}
