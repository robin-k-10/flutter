import 'package:chickenise_app_frontend/display_page.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import '../pages/profile_page.dart';
import '../provider/datadiriController.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final nameCtrl = TextEditingController();
  final birthCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();

  var padding = EdgeInsets.all(10);

  @override
  void initState() {
    super.initState();
    nameCtrl.addListener(() {
      setState(() {});
    });
    emailCtrl.addListener(() {
      setState(() {});
    });
    phoneCtrl.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var dataControl = Provider.of<dataDiriController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 251, 165, 36),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Center(
              child: Stack(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.orangeAccent[100],
                child: ClipOval(
                  child: Image.asset(
                    'assets/Chicken.png',
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  bottom: 1,
                  right: 1,
                  child: Container(
                    height: 40,
                    width: 40,
                    child: Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ))
            ],
          )),
          Container(
            padding: padding,
            child: TextField(
              onChanged: (value) {
                setState(() {});
              },
              controller: nameCtrl,
              maxLines: 1,
              decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w200),
                  suffixIcon: nameCtrl.text.isEmpty
                      ? Container(
                          width: 0,
                        )
                      : IconButton(
                          onPressed: () => nameCtrl.clear(),
                          icon: Icon(Icons.close))),
            ),
          ),
          Container(
            padding: padding,
            child: TextField(
              controller: birthCtrl,
              maxLines: 1,
              decoration: InputDecoration(
                  labelText: 'Birth',
                  labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w200)),
            ),
          ),
          Container(
            padding: padding,
            child: TextField(
              controller: phoneCtrl,
              maxLines: 1,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  labelText: 'Phone',
                  labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w200),
                  suffixIcon: phoneCtrl.text.isEmpty
                      ? Container(
                          width: 0,
                        )
                      : IconButton(
                          onPressed: () => phoneCtrl.clear(),
                          icon: Icon(Icons.close))),
            ),
          ),
          Container(
            padding: padding,
            child: TextField(
              controller: emailCtrl,
              maxLines: 1,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w200),
                  hintText: 'name@example.com',
                  suffixIcon: emailCtrl.text.isEmpty
                      ? Container(
                          width: 0,
                        )
                      : IconButton(
                          onPressed: () => emailCtrl.clear(),
                          icon: Icon(Icons.close))),
            ),
          ),
          Container(
            padding: padding,
            child: ElevatedButton(
                onPressed: () {
                  dataControl.usernamee = nameCtrl.text;
                  dataControl.emaill = emailCtrl.text;
                  dataControl.birth = birthCtrl.text;
                  dataControl.handphonee = phoneCtrl.text;
                  dataControl.index = 4;

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DisplayPage()));
                },
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.green, minimumSize: Size(185, 51))),
          ),
        ]),
      ),
    );
  }
}
