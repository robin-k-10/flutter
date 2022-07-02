import 'dart:convert';
import 'package:flutter/material.dart';

class dataRecomended extends ChangeNotifier {
  initMyData() async {
    setData = recomendded;
  }

  final recomendded = {
    "data": [
      {
        "model": "Cheese Burger",
        "img": "assets/images/menu_img/cheese_burger.jpg",
        "price": 30000,
        "dsc":
            "Perpaduan roti burger dengan 2 Lapisan daging gurih dan 2 lapisan keju disajikan dengan saus tomat, acar, potongan bawang dan mustard.",
        "rating": 4.5
      },
      {
        "model": "Ice Cream",
        "img": "assets/images/menu_img/ice_cream.jpg",
        "price": 20000,
        "dsc": "Es krim vanilla khas Chickenise disajikan dengan cone renyah",
        "rating": 4.5
      },
      {
        "model": "Frappuccino",
        "img": "assets/images/menu_img/frappuccino.jpg",
        "price": 30000,
        "dsc": "Ice blended espresso dengan susu segar dan Hazelnut syrup",
        "rating": 4.6
      },
      {
        "model": "Grilled Chicken Wings",
        "img": "assets/images/menu_img/grilled_chicken_wings.jpg",
        "price": 30000,
        "dsc":
            "Chickeng wing yang di grill dengan saus special dari Chickenise yang memiliki cita rasa gurih dan manis.",
        "rating": 4.6
      },
    ],
  };

  dynamic _data;
  dynamic get data => _data;
  set setData(val) {
    var tmp = json.encode(val);
    _data = json.decode(tmp);
    notifyListeners();
  }
}
