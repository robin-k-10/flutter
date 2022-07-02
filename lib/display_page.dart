import 'package:chickenise_app_frontend/provider/datadiriController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'items/user.dart';
import 'pages/cart_page.dart';
import 'pages/chat_page.dart';
import 'pages/home_page.dart';
import 'pages/menu_page.dart';
import 'pages/profile_page.dart';

class DisplayPage extends StatefulWidget {
  const DisplayPage({Key? key}) : super(key: key);

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  final screens = [
    ChatPage(user: User(id: 0, name: '')),
    Menu(),
    Recommend(),
    Cart(),
    ProfilePage()
  ];
  @override
  DateTime pre_backpress = DateTime.now();
  Widget build(BuildContext context) {
    var dataControl = Provider.of<dataDiriController>(context);
    return WillPopScope(
        onWillPop: () async {
          final timegap = DateTime.now().difference(pre_backpress);

          final cantExit = timegap >= Duration(seconds: 2);

          pre_backpress = DateTime.now();

          if (cantExit) {
            //show snackbar
            final snack = SnackBar(
              content: Text('Press Back button again to Exit'),
              duration: Duration(seconds: 2),
            );

            ScaffoldMessenger.of(context).showSnackBar(snack);
            return false;
          } else {
            return true;
          }
        },
        child: Scaffold(
          body: IndexedStack(
            index: dataControl.index.toInt(),
            children: screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: dataControl.index.toInt(),
            onTap: (index) => setState(() => dataControl.index = index),
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.orange,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book), label: 'Menu'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        ));
  }
}
