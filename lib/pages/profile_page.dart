import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import '../items/popup_item.dart';
import '../login_register/login_screen.dart';
import '../provider/datadiriController.dart';
import '../screens/profile_edit_screen.dart';

class ProfilePage extends StatelessWidget {
  bool isEmpty = true;
  var padding = EdgeInsets.only(left: 14, right: 14);
  String _value = "";
  List<PopupItem> _list = [
    PopupItem(1, 'Edit Profile'),
    PopupItem(2, 'Log Out')
  ];

  @override
  Widget build(BuildContext context) {
    var loginControl = Provider.of<dataDiriController>(context);
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Profile',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 251, 165, 36),
          // leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
          actions: [
            PopupMenuButton(
              color: Color(0xFFFFF7DD),
              elevation: 18,
              enabled: true,
              onSelected: (PopupItem item) {
                if (item.nilai == 1) {
                  // print('Edit profile diklik');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => EditProfileScreen())));
                } else if (item.nilai == 2) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => login())));
                } else {
                  print('Oops');
                }
              },
              itemBuilder: (context) {
                return _list.map((PopupItem e) {
                  return PopupMenuItem(
                    value: e,
                    child: Text(e.nama),
                  );
                }).toList();
              },
            )
          ]),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(top: 30),
            child: CircleAvatar(
              maxRadius: 50,
              backgroundColor: Colors.orangeAccent[100],
              child: Text(loginControl.usernamee.substring(0, 1)),
              // backgroundImage: Image.asset(name),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Name',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    loginControl.usernamee,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                Padding(
                  padding: padding,
                  child: Divider(),
                ),
                ListTile(
                  title: Text(
                    'Birth',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    loginControl.birth,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                Padding(
                  padding: padding,
                  child: Divider(),
                ),
                ListTile(
                  title: Text(
                    'Phone',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    loginControl.handphonee,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                Padding(
                  padding: padding,
                  child: Divider(),
                ),
                ListTile(
                  title: Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    loginControl.emaill,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                Padding(
                  padding: padding,
                  child: Divider(),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
