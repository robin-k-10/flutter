import 'package:flutter/material.dart';
import 'dart:convert';

class homeprovider extends ChangeNotifier {
  final hp = {
    "data": [
      {
        "nama": "Grilled Chicken Wing",
        "img": "assets/images/menu_img/grilled_chicken_wings.jpg",
        "price": 25000,
        "rating": 4.7,
        "state": false
      },
      {
        "nama": "Gochujang Chicken",
        "img": "assets/images/menu_img/gochujang_chicken.jpg",
        "price": 40000,
        "rating": 4.7,
        "state": false
      },
      {
        "nama": "Chicken Monster",
        "img": "assets/images/menu_img/chicken_monster.jpg",
        "price": 60000,
        "rating": 4.6,
        "state": false
      },
      {
        "nama": "Honey Chicken",
        "img": "assets/images/menu_img/honey_chicken.jpg",
        "price": 20000,
        "rating": 4.6,
        "state": false
      },
    ]
  };

  dynamic _data;
  dynamic get data => _data;
  set setData(val) {
    var tmp = json.encode(val);
    _data = json.decode(tmp);
    notifyListeners();
  }
}
