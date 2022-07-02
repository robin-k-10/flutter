import 'dart:convert';
import 'package:flutter/material.dart';

class dataMenu extends ChangeNotifier {
  initMyData() async {
    setData = all;
  }

  List<Map> _cart_list = [];
  get cart_list => _cart_list;
  void addItem(Map item) {
    item['quantity'] = 1;
    item['tmpPrice'] = item['price'];

    if (_cart_list
        .where((cart) =>
            cart['model'].toLowerCase() == item['model'].toLowerCase())
        .isEmpty) {
      _cart_list.add(item);
      print(_cart_list);
      notifyListeners();
    }
  }

  void clearItem(Map item) {
    item['quantity'] = 1;
    item['tmpPrice'] = item['price'];

    if (_cart_list
        .where((cart) =>
            cart['model'].toLowerCase() == item['model'].toLowerCase())
        .isEmpty) {
      _cart_list.remove(item);
      print(_cart_list);
      notifyListeners();
    }
  }

  void addQuantity(int key) {
    _cart_list[key].update('quantity', (list) => list = list + 1);
    _cart_list[key].update('tmpPrice',
        (list) => list = cart_list[key]['price'] * cart_list[key]['quantity']);
    notifyListeners();
  }

  void subsQuantity(int key) {
    if (cart_list[key]['quantity'] > 1) {
      _cart_list[key].update('quantity', (list) => list = list - 1);
      _cart_list[key].update(
          'tmpPrice',
          (list) =>
              list = cart_list[key]['price'] * cart_list[key]['quantity']);
      notifyListeners();
    }
  }

  void delete(int key) {
    _cart_list.removeAt(key);
    notifyListeners();
  }

//ALL
  final all = {
    "data": [
      {
        "model": "Grilled Chicken Wings",
        "img": "assets/images/menu_img/grilled_chicken_wings.jpg",
        "dsc":
            "Chickeng wing yang di grill dengan saus special dari Chickenise yang memiliki cita rasa gurih dan manis.",
        "price": 30000,
        "rating": 4.6
      },
      {
        "model": "Barbeque Chicken",
        "img": "assets/images/menu_img/barbeque_chicken.jpg",
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan saus barbeque special dari Chickenise.",
        "price": 40000,
        "rating": 4.4
      },
      {
        "model": "Chicken Monster",
        "img": "assets/images/menu_img/chicken_monster.jpg",
        "dsc":
            "Ayam goreng utuh dengan bumbu special dari Chickenise yang disajikan dengan kentang goreng, mayonaise, dan sambel",
        "price": 80000,
        "rating": 4.1
      },
      {
        "model": "Gochujang Chicken",
        "img": "assets/images/menu_img/gochujang_chicken.jpg",
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan saus gochujang asli dari korea.",
        "price": 50000,
        "rating": 4.4
      },
      {
        "model": "Honey Chicken",
        "img": "assets/images/menu_img/honey_chicken.jpg",
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan madu special dari Chickenise.",
        "price": 40000,
        "rating": 4.3
      },
      {
        "model": "French Fries",
        "img": "assets/images/menu_img/french_fries.jpg",
        "dsc":
            "Kentang goreng crispy yang ditaburi dengan bumbu special dari Chickenise dan disajikan dengan sambal dan mayonaise",
        "price": 35000,
        "rating": 4.4
      },
      {
        "model": "Cheese Burger",
        "img": "assets/images/menu_img/cheese_burger.jpg",
        "dsc":
            "Perpaduan roti burger dengan 2 Lapisan daging gurih dan 2 lapisan keju disajikan dengan saus tomat, acar, potongan bawang dan mustard.",
        "price": 30000,
        "rating": 4.5
      },
      {
        "model": "Mexican Taco",
        "img": "assets/images/menu_img/mexican_taco.jpg",
        "dsc":
            "Taco dengan isian daging sapi dan sayuran segar dengan saus salsa, alpukat, daun ketumbar, guacamole, tomat, irisan bawang bombai, dan daun selada.",
        "price": 40000,
        "rating": 4.3
      },
      {
        "model": "Barbeque Spaghetti",
        "img": "assets/images/menu_img/barbeque_spaghetti.jpg",
        "dsc":
            "Spaghetti yang dilumuri dengan saus barbeque special dari Chickenise dengan taburan parsley dan oregano",
        "price": 38000,
        "rating": 4.4
      },
      {
        "model": "Ice Cream",
        "img": "assets/images/menu_img/ice_cream.jpg",
        "dsc": "Es krim vanilla khas Chickenise disajikan dengan cone renyah",
        "price": 20000,
        "rating": 4.5
      },
      {
        "model": "Milkshake",
        "img": "assets/images/menu_img/milkshake.jpg",
        "dsc":
            "Campuran susu, es, krim, dan sirup yang diblender lalu ditambah dengan sirup coklat",
        "dsc": "",
        "price": 25000,
        "rating": 4.4
      },
      {
        "model": "Americano",
        "img": "assets/images/menu_img/americano.jpg",
        "dsc": "Espresso yang terbuat dari kopi asli yang dicampur dengan air",
        "price": 20000,
        "rating": 4.5
      },
      {
        "model": "Frappuccino",
        "img": "assets/images/menu_img/frappuccino.jpg",
        "dsc": "Ice blended espresso dengan susu segar dan Hazelnut syrup",
        "price": 30000,
        "rating": 4.6
      },
      {
        "model": "Bubble Tea",
        "img": "assets/images/menu_img/bubble_tea.jpg",
        "dsc": "Teh special dengan boba special dari Chickenise",
        "price": 25000,
        "rating": 4.3
      },
      {
        "model": "Coca Cola",
        "img": "assets/images/menu_img/coca_cola.jpg",
        "dsc": "Minuman ringan berkarbonasi",
        "price": 15000,
        "rating": 4.4
      },
    ],
  };
  final allPriceUp = {
    "data": [
      {
        "model": "Coca Cola",
        "img": "assets/images/menu_img/coca_cola.jpg",
        "dsc": "Minuman ringan berkarbonasi",
        "price": 15000,
        "rating": 4.4
      },
      {
        "model": "Ice Cream",
        "img": "assets/images/menu_img/ice_cream.jpg",
        "dsc": "Es krim vanilla khas Chickenise disajikan dengan cone renyah",
        "price": 20000,
        "rating": 4.5
      },
      {
        "model": "Americano",
        "img": "assets/images/menu_img/americano.jpg",
        "dsc": "Espresso yang terbuat dari kopi asli yang dicampur dengan air",
        "price": 20000,
        "rating": 4.5
      },
      {
        "model": "Milkshake",
        "img": "assets/images/menu_img/milkshake.jpg",
        "dsc":
            "Campuran susu, es, krim, dan sirup yang diblender lalu ditambah dengan sirup coklat",
        "price": 25000,
        "rating": 4.4
      },
      {
        "model": "Bubble Tea",
        "img": "assets/images/menu_img/bubble_tea.jpg",
        "dsc": "Teh special dengan boba special dari Chickenise",
        "price": 25000,
        "rating": 4.3
      },
      {
        "model": "Frappuccino",
        "img": "assets/images/menu_img/frappuccino.jpg",
        "dsc": "Ice blended espresso dengan susu segar dan Hazelnut syrup",
        "price": 30000,
        "rating": 4.6
      },
      {
        "model": "Cheese Burger",
        "img": "assets/images/menu_img/cheese_burger.jpg",
        "dsc":
            "Perpaduan roti burger dengan 2 Lapisan daging gurih dan 2 lapisan keju disajikan dengan saus tomat, acar, potongan bawang dan mustard.",
        "price": 30000,
        "rating": 4.5
      },
      {
        "model": "Grilled Chicken Wings",
        "img": "assets/images/menu_img/griled_chicken_wings.jpg",
        "dsc":
            "Chickeng wing yang di grill dengan saus special dari Chickenise yang memiliki cita rasa gurih dan manis.",
        "price": 30000,
        "rating": 4.6
      },
      {
        "model": "French Fries",
        "img": "assets/images/menu_img/french_fries.jpg",
        "dsc":
            "Kentang goreng crispy yang ditaburi dengan bumbu special dari Chickenise dan disajikan dengan sambal dan mayonaise",
        "price": 35000,
        "rating": 4.4
      },
      {
        "model": "Barbeque Spaghetti",
        "img": "assets/images/menu_img/barbeque_spaghetti.jpg",
        "dsc":
            "Spaghetti yang dilumuri dengan saus barbeque special dari Chickenise dengan taburan parsley dan oregano",
        "price": 38000,
        "rating": 4.4
      },
      {
        "model": "Mexican Taco",
        "img": "assets/images/menu_img/mexixan_taco.jpg",
        "dsc":
            "Taco dengan isian daging sapi dan sayuran segar dengan saus salsa, alpukat, daun ketumbar, guacamole, tomat, irisan bawang bombai, dan daun selada.",
        "price": 40000,
        "rating": 4.3
      },
      {
        "model": "Honey Chicken",
        "img": "assets/images/menu_img/honey_chicken.jpg",
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan madu special dari Chickenise.",
        "price": 40000,
        "rating": 4.3
      },
      {
        "model": "Barbeque Chicken",
        "img": "assets/images/menu_img/barbeque_chicken.jpg",
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan saus barbeque special dari Chickenise.",
        "price": 40000,
        "rating": 4.4
      },
      {
        "model": "Gochujang Chicken",
        "img": "assets/images/menu_img/gochujang_chicken.jpg",
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan saus gochujang asli dari korea.",
        "price": 50000,
        "rating": 4.4
      },
      {
        "model": "Chicken Monster",
        "img": "assets/images/menu_img/chicken_monster.jpg",
        "dsc":
            "Ayam goreng utuh dengan bumbu special dari Chickenise yang disajikan dengan kentang goreng, mayonaise, dan sambel",
        "price": 80000,
        "rating": 4.1
      },
    ],
  };
  final allPriceDown = {
    "data": [
      {
        "model": "Chicken Monster",
        "img": "assets/images/menu_img/chicken_monster.jpg",
        "dsc":
            "Ayam goreng utuh dengan bumbu special dari Chickenise yang disajikan dengan kentang goreng, mayonaise, dan sambel",
        "price": 80000,
        "rating": 4.1
      },
      {
        "model": "Gochujang Chicken",
        "img": "assets/images/menu_img/gochujang_chicken.jpg",
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan saus gochujang asli dari korea.",
        "price": 50000,
        "rating": 4.4
      },
      {
        "model": "Barbeque Chicken",
        "img": "assets/images/menu_img/barbeque_chicken.jpg",
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan saus barbeque special dari Chickenise.",
        "price": 40000,
        "rating": 4.4
      },
      {
        "model": "Honey Chicken",
        "img": "assets/images/menu_img/honey_chicken.jpg",
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan madu special dari Chickenise.",
        "price": 40000,
        "rating": 4.3
      },
      {
        "model": "Mexican Taco",
        "img": "assets/images/menu_img/mexican_taco.jpg",
        "dsc":
            "Taco dengan isian daging sapi dan sayuran segar dengan saus salsa, alpukat, daun ketumbar, guacamole, tomat, irisan bawang bombai, dan daun selada.",
        "price": 40000,
        "rating": 4.3
      },
      {
        "model": "Barbeque Spaghetti",
        "img": "assets/images/menu_img/barbeque_spaghetti.jpg",
        "dsc":
            "Spaghetti yang dilumuri dengan saus barbeque special dari Chickenise dengan taburan parsley dan oregano",
        "price": 38000,
        "rating": 4.4
      },
      {
        "model": "French Fries",
        "img": "assets/images/menu_img/french_fries.jpg",
        "dsc":
            "Kentang goreng crispy yang ditaburi dengan bumbu special dari Chickenise dan disajikan dengan sambal dan mayonaise",
        "price": 35000,
        "rating": 4.4
      },
      {
        "model": "Grilled Chicken Wings",
        "img": "assets/images/menu_img/grilled_chicken_wings.jpg",
        "dsc":
            "Chickeng wing yang di grill dengan saus special dari Chickenise yang memiliki cita rasa gurih dan manis.",
        "price": 30000,
        "rating": 4.6
      },
      {
        "model": "Cheese Burger",
        "img": "assets/images/menu_img/cheese_burger.jpg",
        "dsc":
            "Perpaduan roti burger dengan 2 Lapisan daging gurih dan 2 lapisan keju disajikan dengan saus tomat, acar, potongan bawang dan mustard.",
        "price": 30000,
        "rating": 4.5
      },
      {
        "model": "Frappuccino",
        "img": "assets/images/menu_img/frappuccino.jpg",
        "dsc": "Ice blended espresso dengan susu segar dan Hazelnut syrup",
        "price": 30000,
        "rating": 4.6
      },
      {
        "model": "Bubble Tea",
        "img": "assets/images/menu_img/bubble_tea.jpg",
        "dsc": "Teh special dengan boba special dari Chickenise",
        "price": 25000,
        "rating": 4.3
      },
      {
        "model": "Milkshake",
        "img": "assets/images/menu_img/milkshake.jpg",
        "dsc":
            "Campuran susu, es, krim, dan sirup yang diblender lalu ditambah dengan sirup coklat",
        "price": 25000,
        "rating": 4.4
      },
      {
        "model": "Americano",
        "img": "assets/images/menu_img/americano.jpg",
        "dsc": "Espresso yang terbuat dari kopi asli yang dicampur dengan air",
        "price": 20000,
        "rating": 4.5
      },
      {
        "model": "Ice Cream",
        "img": "assets/images/menu_img/ice_cream.jpg",
        "dsc": "Es krim vanilla khas Chickenise disajikan dengan cone renyah",
        "price": 20000,
        "rating": 4.5
      },
      {
        "model": "Coca Cola",
        "img": "assets/images/menu_img/coca_cola.jpg",
        "dsc": "Minuman ringan berkarbonasi",
        "price": 15000,
        "rating": 4.4
      },
    ],
  };
  final allRatingUp = {
    "data": [
      {
        "model": "Chicken Monster",
        "img": "assets/images/menu_img/chicken_monster.jpg",
        "dsc":
            "Ayam goreng utuh dengan bumbu special dari Chickenise yang disajikan dengan kentang goreng, mayonaise, dan sambel",
        "price": 80000,
        "rating": 4.1
      },
      {
        "model": "Honey Chicken",
        "img": "assets/images/menu_img/honey_chicken.jpg",
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan madu special dari Chickenise.",
        "price": 40000,
        "rating": 4.3
      },
      {
        "model": "Mexican Taco",
        "img": "assets/images/menu_img/mexican_taco.jpg",
        "dsc":
            "Taco dengan isian daging sapi dan sayuran segar dengan saus salsa, alpukat, daun ketumbar, guacamole, tomat, irisan bawang bombai, dan daun selada.",
        "price": 40000,
        "rating": 4.3
      },
      {
        "model": "Bubble Tea",
        "img": "assets/images/menu_img/bubble_tea.jpg",
        "dsc": "Teh special dengan boba special dari Chickenise",
        "price": 25000,
        "rating": 4.3
      },
      {
        "model": "Gochujang Chicken",
        "img": "assets/images/menu_img/gochujang_chicken.jpg",
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan saus gochujang asli dari korea.",
        "price": 50000,
        "rating": 4.4
      },
      {
        "model": "Barbeque Chicken",
        "img": "assets/images/menu_img/barbeque_chicken.jpg",
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan saus barbeque special dari Chickenise.",
        "price": 40000,
        "rating": 4.4
      },
      {
        "model": "French Fries",
        "img": "assets/images/menu_img/french_fries.jpg",
        "dsc":
            "Kentang goreng crispy yang ditaburi dengan bumbu special dari Chickenise dan disajikan dengan sambal dan mayonaise",
        "price": 35000,
        "rating": 4.4
      },
      {
        "model": "Barbeque Spaghetti",
        "img": "assets/images/menu_img/barbeque_spaghetti.jpg",
        "dsc":
            "Spaghetti yang dilumuri dengan saus barbeque special dari Chickenise dengan taburan parsley dan oregano",
        "price": 38000,
        "rating": 4.4
      },
      {
        "model": "Milkshake",
        "img": "assets/images/menu_img/milkshake.jpg",
        "dsc":
            "Campuran susu, es, krim, dan sirup yang diblender lalu ditambah dengan sirup coklat",
        "price": 25000,
        "rating": 4.4
      },
      {
        "model": "Coca Cola",
        "img": "assets/images/menu_img/coca_cola.jpg",
        "dsc": "Minuman ringan berkarbonasi",
        "price": 15000,
        "rating": 4.4
      },
      {
        "model": "Cheese Burger",
        "img": "assets/images/menu_img/cheese_burger.jpg",
        "dsc":
            "Perpaduan roti burger dengan 2 Lapisan daging gurih dan 2 lapisan keju disajikan dengan saus tomat, acar, potongan bawang dan mustard.",
        "price": 30000,
        "rating": 4.5
      },
      {
        "model": "Ice Cream",
        "img": "assets/images/menu_img/ice_cream.jpg",
        "dsc": "Es krim vanilla khas Chickenise disajikan dengan cone renyah",
        "price": 20000,
        "rating": 4.5
      },
      {
        "model": "Americano",
        "img": "assets/images/menu_img/americano.jpg",
        "dsc": "Espresso yang terbuat dari kopi asli yang dicampur dengan air",
        "price": 20000,
        "rating": 4.5
      },
      {
        "model": "Grilled Chicken Wings",
        "img": "assets/images/menu_img/grilled_chicken_wings.jpg",
        "dsc":
            "Chickeng wing yang di grill dengan saus special dari Chickenise yang memiliki cita rasa gurih dan manis.",
        "price": 30000,
        "rating": 4.6
      },
      {
        "model": "Frappuccino",
        "img": "assets/images/menu_img/frappuccino.jpg",
        "dsc": "Ice blended espresso dengan susu segar dan Hazelnut syrup",
        "price": 30000,
        "rating": 4.6
      },
    ],
  };
  final allRatingDown = {
    "data": [
      {
        "model": "Grilled Chicken Wings",
        "img": "assets/images/menu_img/grilled_chicken_wings.jpg",
        "dsc":
            "Chickeng wing yang di grill dengan saus special dari Chickenise yang memiliki cita rasa gurih dan manis.",
        "price": 30000,
        "rating": 4.6
      },
      {
        "model": "Frappuccino",
        "img": "assets/images/menu_img/frappuccino.jpg",
        "dsc": "Ice blended espresso dengan susu segar dan Hazelnut syrup",
        "price": 30000,
        "rating": 4.6
      },
      {
        "model": "Cheese Burger",
        "img": "assets/images/menu_img/cheese_burger.jpg",
        "dsc":
            "Perpaduan roti burger dengan 2 Lapisan daging gurih dan 2 lapisan keju disajikan dengan saus tomat, acar, potongan bawang dan mustard.",
        "price": 30000,
        "rating": 4.5
      },
      {
        "model": "Ice Cream",
        "img": "assets/images/menu_img/ice_cream.jpg",
        "dsc": "Es krim vanilla khas Chickenise disajikan dengan cone renyah",
        "price": 20000,
        "rating": 4.5
      },
      {
        "model": "Americano",
        "img": "assets/images/menu_img/americano.jpg",
        "dsc": "Espresso yang terbuat dari kopi asli yang dicampur dengan air",
        "price": 20000,
        "rating": 4.5
      },
      {
        "model": "Gochujang Chicken",
        "img": "assets/images/menu_img/gochujang_chicken.jpg",
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan saus gochujang asli dari korea.",
        "price": 50000,
        "rating": 4.4
      },
      {
        "model": "Barbeque Chicken",
        "img": "assets/images/menu_img/barbeque_chicken.jpg",
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan saus barbeque special dari Chickenise.",
        "price": 40000,
        "rating": 4.4
      },
      {
        "model": "French Fries",
        "img": "assets/images/menu_img/french_fries.jpg",
        "dsc":
            "Kentang goreng crispy yang ditaburi dengan bumbu special dari Chickenise dan disajikan dengan sambal dan mayonaise",
        "price": 35000,
        "rating": 4.4
      },
      {
        "model": "Barbeque Spaghetti",
        "img": "assets/images/menu_img/barbeque_spaghetti.jpg",
        "dsc":
            "Spaghetti yang dilumuri dengan saus barbeque special dari Chickenise dengan taburan parsley dan oregano",
        "price": 38000,
        "rating": 4.4
      },
      {
        "model": "Milkshake",
        "img": "assets/images/menu_img/milkshake.jpg",
        "dsc":
            "Campuran susu, es, krim, dan sirup yang diblender lalu ditambah dengan sirup coklat",
        "price": 25000,
        "rating": 4.4
      },
      {
        "model": "Coca Cola",
        "img": "assets/images/menu_img/coca_cola.jpg",
        "dsc": "Minuman ringan berkarbonasi",
        "price": 15000,
        "rating": 4.4
      },
      {
        "model": "Honey Chicken",
        "img": "assets/images/menu_img/honey_chicken.jpg",
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan madu special dari Chickenise.",
        "price": 40000,
        "rating": 4.3
      },
      {
        "model": "Mexican Taco",
        "img": "assets/images/menu_img/mexican_taco.jpg",
        "dsc":
            "Taco dengan isian daging sapi dan sayuran segar dengan saus salsa, alpukat, daun ketumbar, guacamole, tomat, irisan bawang bombai, dan daun selada.",
        "price": 40000,
        "rating": 4.3
      },
      {
        "model": "Bubble Tea",
        "img": "assets/images/menu_img/bubble_tea.jpg",
        "dsc": "Teh special dengan boba special dari Chickenise",
        "price": 25000,
        "rating": 4.3
      },
      {
        "model": "Chicken Monster",
        "img": "assets/images/menu_img/chicken_monster.jpg",
        "dsc":
            "Ayam goreng utuh dengan bumbu special dari Chickenise yang disajikan dengan kentang goreng, mayonaise, dan sambel",
        "price": 80000,
        "rating": 4.1
      },
    ],
  };
  final allABCUp = {
    "data": [
      {
        "model": "Americano",
        "img": "assets/images/menu_img/americano.jpg",
        "dsc": "Espresso yang terbuat dari kopi asli yang dicampur dengan air",
        "price": 20000,
        "rating": 4.5
      },
      {
        "model": "Barbeque Chicken",
        "img": "assets/images/menu_img/barbeque_chicken.jpg",
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan saus barbeque special dari Chickenise.",
        "price": 40000,
        "rating": 4.4
      },
      {
        "model": "Barbeque Spaghetti",
        "img": "assets/images/menu_img/barbeque_spaghetti.jpg",
        "dsc":
            "Spaghetti yang dilumuri dengan saus barbeque special dari Chickenise dengan taburan parsley dan oregano",
        "price": 38000,
        "rating": 4.4
      },
      {
        "model": "Bubble Tea",
        "img": "assets/images/menu_img/bubble_tea.jpg",
        "dsc": "Teh special dengan boba special dari Chickenise",
        "price": 25000,
        "rating": 4.3
      },
      {
        "model": "Cheese Burger",
        "img": "assets/images/menu_img/cheese_burger.jpg",
        "dsc":
            "Perpaduan roti burger dengan 2 Lapisan daging gurih dan 2 lapisan keju disajikan dengan saus tomat, acar, potongan bawang dan mustard.",
        "price": 30000,
        "rating": 4.5
      },
      {
        "model": "Chicken Monster",
        "img": "assets/images/menu_img/chicken_monster.jpg",
        "dsc":
            "Ayam goreng utuh dengan bumbu special dari Chickenise yang disajikan dengan kentang goreng, mayonaise, dan sambel",
        "price": 80000,
        "rating": 4.1
      },
      {
        "model": "Coca Cola",
        "img": "assets/images/menu_img/coca_cola.jpg",
        "dsc": "Minuman ringan berkarbonasi",
        "price": 15000,
        "rating": 4.4
      },
      {
        "model": "Frappuccino",
        "img": "assets/images/menu_img/frappuccino.jpg",
        "dsc": "Ice blended espresso dengan susu segar dan Hazelnut syrup",
        "price": 30000,
        "rating": 4.6
      },
      {
        "model": "French Fries",
        "img": "assets/images/menu_img/french_fries.jpg",
        "dsc":
            "Kentang goreng crispy yang ditaburi dengan bumbu special dari Chickenise dan disajikan dengan sambal dan mayonaise",
        "price": 35000,
        "rating": 4.4
      },
      {
        "model": "Gochujang Chicken",
        "img": "assets/images/menu_img/gochujang_chicken.jpg",
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan saus gochujang asli dari korea.",
        "price": 50000,
        "rating": 4.4
      },
      {
        "model": "Grilled Chicken Wings",
        "img": "assets/images/menu_img/grilled_chicken_wings.jpg",
        "dsc":
            "Chickeng wing yang di grill dengan saus special dari Chickenise yang memiliki cita rasa gurih dan manis.",
        "price": 30000,
        "rating": 4.6
      },
      {
        "model": "Honey Chicken",
        "img": "assets/images/menu_img/honey_chicken.jpg",
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan madu special dari Chickenise.",
        "price": 40000,
        "rating": 4.3
      },
      {
        "model": "Ice Cream",
        "img": "assets/images/menu_img/ice_cream.jpg",
        "dsc": "Es krim vanilla khas Chickenise disajikan dengan cone renyah",
        "price": 20000,
        "rating": 4.5
      },
      {
        "model": "Mexican Taco",
        "img": "assets/images/menu_img/mexican_taco.jpg",
        "dsc":
            "Taco dengan isian daging sapi dan sayuran segar dengan saus salsa, alpukat, daun ketumbar, guacamole, tomat, irisan bawang bombai, dan daun selada.",
        "price": 40000,
        "rating": 4.3
      },
      {
        "model": "Milkshake",
        "img": "assets/images/menu_img/milkshake.jpg",
        "dsc":
            "Campuran susu, es, krim, dan sirup yang diblender lalu ditambah dengan sirup coklat",
        "price": 25000,
        "rating": 4.4
      },
    ],
  };
  final allABCDown = {
    "data": [
      {
        "model": "Milkshake",
        "img": "assets/images/menu_img/milkshake.jpg",
        "dsc":
            "Campuran susu, es, krim, dan sirup yang diblender lalu ditambah dengan sirup coklat",
        "price": 25000,
        "rating": 4.4
      },
      {
        "model": "Mexican Taco",
        "img": "assets/images/menu_img/mexican_taco.jpg",
        "dsc":
            "Taco dengan isian daging sapi dan sayuran segar dengan saus salsa, alpukat, daun ketumbar, guacamole, tomat, irisan bawang bombai, dan daun selada.",
        "price": 40000,
        "rating": 4.3
      },
      {
        "model": "Ice Cream",
        "img": "assets/images/menu_img/ice_cream.jpg",
        "dsc": "Es krim vanilla khas Chickenise disajikan dengan cone renyah",
        "price": 20000,
        "rating": 4.5
      },
      {
        "model": "Honey Chicken",
        "img": "assets/images/menu_img/honey_chicken.jpg",
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan madu special dari Chickenise.",
        "price": 40000,
        "rating": 4.3
      },
      {
        "model": "Grilled Chicken Wings",
        "img": "assets/images/menu_img/grilled_chicken_wings.jpg",
        "dsc":
            "Chickeng wing yang di grill dengan saus special dari Chickenise yang memiliki cita rasa gurih dan manis.",
        "price": 30000,
        "rating": 4.6
      },
      {
        "model": "Gochujang Chicken",
        "img": "assets/images/menu_img/gochujang_chicken.jpg",
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan saus gochujang asli dari korea.",
        "price": 50000,
        "rating": 4.4
      },
      {
        "model": "French Fries",
        "img": "assets/images/menu_img/french_fries.jpg",
        "dsc":
            "Kentang goreng crispy yang ditaburi dengan bumbu special dari Chickenise dan disajikan dengan sambal dan mayonaise",
        "price": 35000,
        "rating": 4.4
      },
      {
        "model": "Frappuccino",
        "img": "assets/images/menu_img/frappuccino.jpg",
        "dsc": "Ice blended espresso dengan susu segar dan Hazelnut syrup",
        "price": 30000,
        "rating": 4.6
      },
      {
        "model": "Coca Cola",
        "img": "assets/images/menu_img/coca_cola.jpg",
        "dsc": "Minuman ringan berkarbonasi",
        "price": 15000,
        "rating": 4.4
      },
      {
        "model": "Chicken Monster",
        "img": "assets/images/menu_img/chicken_monster.jpg",
        "dsc":
            "Ayam goreng utuh dengan bumbu special dari Chickenise yang disajikan dengan kentang goreng, mayonaise, dan sambel",
        "price": 80000,
        "rating": 4.1
      },
      {
        "model": "Cheese Burger",
        "img": "assets/images/menu_img/cheese_burger.jpg",
        "dsc":
            "Perpaduan roti burger dengan 2 Lapisan daging gurih dan 2 lapisan keju disajikan dengan saus tomat, acar, potongan bawang dan mustard.",
        "price": 30000,
        "rating": 4.5
      },
      {
        "model": "Bubble Tea",
        "img": "assets/images/menu_img/bubble_tea.jpg",
        "dsc": "Teh special dengan boba special dari Chickenise",
        "price": 25000,
        "rating": 4.3
      },
      {
        "model": "Barbeque Spaghetti",
        "img": "assets/images/menu_img/barbeque_spaghetti.jpg",
        "dsc":
            "Spaghetti yang dilumuri dengan saus barbeque special dari Chickenise dengan taburan parsley dan oregano",
        "price": 38000,
        "rating": 4.4
      },
      {
        "model": "Barbeque Chicken",
        "img": "assets/images/menu_img/barbeque_chicken.jpg",
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan saus barbeque special dari Chickenise.",
        "price": 40000,
        "rating": 4.4
      },
      {
        "model": "Americano",
        "img": "assets/images/menu_img/americano.jpg",
        "dsc": "Espresso yang terbuat dari kopi asli yang dicampur dengan air",
        "price": 20000,
        "rating": 4.5
      },
    ],
  };

  //CHICKEN
  final chicken = {
    "data": [
      {
        "model": "Grilled Chicken Wings",
        "img": "assets/images/menu_img/grilled_chicken_wings.jpg",
        "dsc":
            "Chickeng wing yang di grill dengan saus special dari Chickenise yang memiliki cita rasa gurih dan manis.",
        "price": 30000,
        "rating": 4.6
      },
      {
        "model": "Barbeque Chicken",
        "img": "assets/images/menu_img/barbeque_chicken.jpg",
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan saus barbeque special dari Chickenise.",
        "price": 40000,
        "rating": 4.4
      },
      {
        "model": "Chicken Monster",
        "img": "assets/images/menu_img/chicken_monster.jpg",
        "dsc":
            "Ayam goreng utuh dengan bumbu special dari Chickenise yang disajikan dengan kentang goreng, mayonaise, dan sambel",
        "price": 80000,
        "rating": 4.1
      },
      {
        "model": "Gochujang Chicken",
        "img": "assets/images/menu_img/gochujang_chicken.jpg",
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan saus gochujang asli dari korea.",
        "price": 50000,
        "rating": 4.4
      },
      {
        "model": "Honey Chicken",
        "img": "assets/images/menu_img/honey_chicken.jpg",
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan madu special dari Chickenise.",
        "price": 40000,
        "rating": 4.3
      },
    ],
  };
  final chickenRatingUp = {
    "data": [
      {
        "model": "Chicken Monster",
        "img": "assets/images/menu_img/chicken_monster.jpg",
        "dsc":
            "Ayam goreng utuh dengan bumbu special dari Chickenise yang disajikan dengan kentang goreng, mayonaise, dan sambel",
        "price": 80000,
        "rating": 4.1
      },
      {
        "model": "Honey Chicken",
        "img": "assets/images/menu_img/honey_chicken.jpg",
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan madu special dari Chickenise.",
        "price": 40000,
        "rating": 4.3
      },
      {
        "model": "Barbeque Chicken",
        "img": "assets/images/menu_img/barbeque_chicken.jpg",
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan saus barbeque special dari Chickenise.",
        "price": 40000,
        "rating": 4.4
      },
      {
        "model": "Gochujang Chicken",
        "img": "assets/images/menu_img/gochujang_chicken.jpg",
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan saus gochujang asli dari korea.",
        "price": 50000,
        "rating": 4.4
      },
      {
        "model": "Grilled Chicken Wings",
        "img": "assets/images/menu_img/grilled_chicken_wings.jpg",
        "dsc":
            "Chickeng wing yang di grill dengan saus special dari Chickenise yang memiliki cita rasa gurih dan manis.",
        "price": 30000,
        "rating": 4.6
      },
    ],
  };
  final chickenRatingDown = {
    "data": [
      {
        "model": "Grilled Chicken Wings",
        "img": "assets/images/menu_img/grilled_chicken_wings.jpg",
        "price": 30000,
        "dsc":
            "Chickeng wing yang di grill dengan saus special dari Chickenise yang memiliki cita rasa gurih dan manis.",
        "rating": 4.6
      },
      {
        "model": "Barbeque Chicken",
        "img": "assets/images/menu_img/barbeque_chicken.jpg",
        "price": 40000,
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan saus barbeque special dari Chickenise.",
        "rating": 4.4
      },
      {
        "model": "Gochujang Chicken",
        "img": "assets/images/menu_img/gochujang_chicken.jpg",
        "price": 50000,
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan saus gochujang asli dari korea.",
        "rating": 4.4
      },
      {
        "model": "Honey Chicken",
        "img": "assets/images/menu_img/honey_chicken.jpg",
        "price": 40000,
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan madu special dari Chickenise.",
        "rating": 4.3
      },
      {
        "model": "Chicken Monster",
        "img": "assets/images/menu_img/chicken_monster.jpg",
        "price": 80000,
        "dsc":
            "Ayam goreng utuh dengan bumbu special dari Chickenise yang disajikan dengan kentang goreng, mayonaise, dan sambel",
        "rating": 4.1
      },
    ],
  };
  final chickenABCUp = {
    "data": [
      {
        "model": "Barbeque Chicken",
        "img": "assets/images/menu_img/barbeque_chicken.jpg",
        "price": 40000,
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan saus barbeque special dari Chickenise.",
        "rating": 4.4
      },
      {
        "model": "Chicken Monster",
        "img": "assets/images/menu_img/chicken_monster.jpg",
        "price": 80000,
        "dsc":
            "Ayam goreng utuh dengan bumbu special dari Chickenise yang disajikan dengan kentang goreng, mayonaise, dan sambel",
        "rating": 4.1
      },
      {
        "model": "Grilled Chicken Wings",
        "img": "assets/images/menu_img/grilled_chicken_wings.jpg",
        "price": 30000,
        "dsc":
            "Chickeng wing yang di grill dengan saus special dari Chickenise yang memiliki cita rasa gurih dan manis.",
        "rating": 4.6
      },
      {
        "model": "Gochujang Chicken",
        "img": "assets/images/menu_img/gochujang_chicken.jpg",
        "price": 50000,
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan saus gochujang asli dari korea.",
        "rating": 4.4
      },
      {
        "model": "Honey Chicken",
        "img": "assets/images/menu_img/honey_chicken.jpg",
        "price": 40000,
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan madu special dari Chickenise.",
        "rating": 4.3
      },
    ],
  };
  final chickenABCDown = {
    "data": [
      {
        "model": "Honey Chicken",
        "img": "assets/images/menu_img/honey_chicken.jpg",
        "price": 40000,
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan madu special dari Chickenise.",
        "rating": 4.3
      },
      {
        "model": "Gochujang Chicken",
        "img": "assets/images/menu_img/gochujang_chicken.jpg",
        "price": 50000,
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan saus gochujang asli dari korea.",
        "rating": 4.4
      },
      {
        "model": "Grilled Chicken Wings",
        "img": "assets/images/menu_img/grilled_chicken_wings.jpg",
        "price": 30000,
        "dsc":
            "Chickeng wing yang di grill dengan saus special dari Chickenise yang memiliki cita rasa gurih dan manis.",
        "rating": 4.6
      },
      {
        "model": "Chicken Monster",
        "img": "assets/images/menu_img/chicken_monster.jpg",
        "price": 80000,
        "dsc":
            "Ayam goreng utuh dengan bumbu special dari Chickenise yang disajikan dengan kentang goreng, mayonaise, dan sambel",
        "rating": 4.1
      },
      {
        "model": "Barbeque Chicken",
        "img": "assets/images/menu_img/barbeque_chicken.jpg",
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan saus barbeque special dari Chickenise.",
        "price": 40000,
        "rating": 4.4
      },
    ],
  };
  final chickenPriceUp = {
    "data": [
      {
        "model": "Grilled Chicken Wings",
        "img": "assets/images/menu_img/grilled_chicken_wings.jpg",
        "price": 30000,
        "dsc":
            "Chickeng wing yang di grill dengan saus special dari Chickenise yang memiliki cita rasa gurih dan manis.",
        "rating": 4.6
      },
      {
        "model": "Barbeque Chicken",
        "img": "assets/images/menu_img/barbeque_chicken.jpg",
        "price": 40000,
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan saus barbeque special dari Chickenise.",
        "rating": 4.4
      },
      {
        "model": "Honey Chicken",
        "img": "assets/images/menu_img/honey_chicken.jpg",
        "price": 40000,
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan madu special dari Chickenise.",
        "rating": 4.3
      },
      {
        "model": "Gochujang Chicken",
        "img": "assets/images/menu_img/gochujang_chicken.jpg",
        "price": 50000,
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan saus gochujang asli dari korea.",
        "rating": 4.4
      },
      {
        "model": "Chicken Monster",
        "img": "assets/images/menu_img/chicken_monster.jpg",
        "price": 80000,
        "dsc":
            "Ayam goreng utuh dengan bumbu special dari Chickenise yang disajikan dengan kentang goreng, mayonaise, dan sambel",
        "rating": 4.1
      },
    ],
  };
  final chickenPriceDown = {
    "data": [
      {
        "model": "Chicken Monster",
        "img": "assets/images/menu_img/chicken_monster.jpg",
        "price": 80000,
        "dsc":
            "Ayam goreng utuh dengan bumbu special dari Chickenise yang disajikan dengan kentang goreng, mayonaise, dan sambel",
        "rating": 4.1
      },
      {
        "model": "Gochujang Chicken",
        "img": "assets/images/menu_img/gochujang_chicken.jpg",
        "price": 50000,
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan saus gochujang asli dari korea.",
        "rating": 4.4
      },
      {
        "model": "Barbeque Chicken",
        "img": "assets/images/menu_img/barbeque_chicken.jpg",
        "price": 40000,
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan saus barbeque special dari Chickenise.",
        "rating": 4.4
      },
      {
        "model": "Honey Chicken",
        "img": "assets/images/menu_img/honey_chicken.jpg",
        "price": 40000,
        "dsc":
            "Ayam goreng cripsy yang dilumuri dengan madu special dari Chickenise.",
        "rating": 4.3
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

  //SNACK
  final snack = {
    "data": [
      {
        "model": "French Fries",
        "img": "assets/images/menu_img/french_fries.jpg",
        "price": 35000,
        "dsc":
            "Kentang goreng crispy yang ditaburi dengan bumbu special dari Chickenise dan disajikan dengan sambal dan mayonaise",
        "rating": 4.4
      },
      {
        "model": "Cheese Burger",
        "img": "assets/images/menu_img/cheese_burger.jpg",
        "dsc":
            "Perpaduan roti burger dengan 2 Lapisan daging gurih dan 2 lapisan keju disajikan dengan saus tomat, acar, potongan bawang dan mustard.",
        "price": 30000,
        "rating": 4.5
      },
      {
        "model": "Mexican Taco",
        "img": "assets/images/menu_img/mexican_taco.jpg",
        "dsc":
            "Taco dengan isian daging sapi dan sayuran segar dengan saus salsa, alpukat, daun ketumbar, guacamole, tomat, irisan bawang bombai, dan daun selada.",
        "price": 40000,
        "rating": 4.3
      },
      {
        "model": "Barbeque Spaghetti",
        "img": "assets/images/menu_img/barbeque_spaghetti.jpg",
        "dsc":
            "Spaghetti yang dilumuri dengan saus barbeque special dari Chickenise dengan taburan parsley dan oregano",
        "price": 38000,
        "rating": 4.4
      },
      {
        "model": "Ice Cream",
        "img": "assets/images/menu_img/ice_cream.jpg",
        "price": 20000,
        "dsc": "Es krim vanilla khas Chickenise disajikan dengan cone renyah",
        "rating": 4.5
      },
    ]
  };
  final snackRatingUp = {
    "data": [
      {
        "model": "Mexican Taco",
        "img": "assets/images/menu_img/mexican_taco.jpg",
        "price": 40000,
        "dsc":
            "Taco dengan isian daging sapi dan sayuran segar dengan saus salsa, alpukat, daun ketumbar, guacamole, tomat, irisan bawang bombai, dan daun selada.",
        "rating": 4.3
      },
      {
        "model": "French Fries",
        "img": "assets/images/menu_img/french_fries.jpg",
        "price": 35000,
        "dsc":
            "Kentang goreng crispy yang ditaburi dengan bumbu special dari Chickenise dan disajikan dengan sambal dan mayonaise",
        "rating": 4.4
      },
      {
        "model": "Barbeque Spaghetti",
        "img": "assets/images/menu_img/barbeque_spaghetti.jpg",
        "dsc":
            "Spaghetti yang dilumuri dengan saus barbeque special dari Chickenise dengan taburan parsley dan oregano",
        "price": 38000,
        "rating": 4.4
      },
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
    ]
  };
  final snackRatingDown = {
    "data": [
      {
        "model": "Ice Cream",
        "img": "assets/images/menu_img/ice_cream.jpg",
        "price": 20000,
        "dsc": "Es krim vanilla khas Chickenise disajikan dengan cone renyah",
        "rating": 4.5
      },
      {
        "model": "Cheese Burger",
        "img": "assets/images/menu_img/cheese_burger.jpg",
        "price": 30000,
        "dsc":
            "Perpaduan roti burger dengan 2 Lapisan daging gurih dan 2 lapisan keju disajikan dengan saus tomat, acar, potongan bawang dan mustard.",
        "rating": 4.5
      },
      {
        "model": "Barbeque Spaghetti",
        "img": "assets/images/menu_img/barbeque_spaghetti.jpg",
        "price": 38000,
        "dsc":
            "Spaghetti yang dilumuri dengan saus barbeque special dari Chickenise dengan taburan parsley dan oregano",
        "rating": 4.4
      },
      {
        "model": "French Fries",
        "img": "assets/images/menu_img/french_fries.jpg",
        "price": 35000,
        "dsc":
            "Kentang goreng crispy yang ditaburi dengan bumbu special dari Chickenise dan disajikan dengan sambal dan mayonaise",
        "rating": 4.4
      },
      {
        "model": "Mexican Taco",
        "img": "assets/images/menu_img/mexican_taco.jpg",
        "price": 40000,
        "dsc":
            "Taco dengan isian daging sapi dan sayuran segar dengan saus salsa, alpukat, daun ketumbar, guacamole, tomat, irisan bawang bombai, dan daun selada.",
        "rating": 4.3
      },
    ]
  };
  final snackABCUp = {
    "data": [
      {
        "model": "Barbeque Spaghetti",
        "img": "assets/images/menu_img/barbeque_spaghetti.jpg",
        "price": 38000,
        "dsc":
            "Spaghetti yang dilumuri dengan saus barbeque special dari Chickenise dengan taburan parsley dan oregano",
        "rating": 4.4
      },
      {
        "model": "Cheese Burger",
        "img": "assets/images/menu_img/cheese_burger.jpg",
        "price": 30000,
        "dsc":
            "Perpaduan roti burger dengan 2 Lapisan daging gurih dan 2 lapisan keju disajikan dengan saus tomat, acar, potongan bawang dan mustard.",
        "rating": 4.5
      },
      {
        "model": "French Fries",
        "img": "assets/images/menu_img/french_fries.jpg",
        "price": 35000,
        "dsc":
            "Kentang goreng crispy yang ditaburi dengan bumbu special dari Chickenise dan disajikan dengan sambal dan mayonaise",
        "rating": 4.4
      },
      {
        "model": "Ice Cream",
        "img": "assets/images/menu_img/ice_cream.jpg",
        "price": 20000,
        "dsc": "Es krim vanilla khas Chickenise disajikan dengan cone renyah",
        "rating": 4.5
      },
      {
        "model": "Mexican Taco",
        "img": "assets/images/menu_img/mexican_taco.jpg",
        "price": 40000,
        "dsc":
            "Taco dengan isian daging sapi dan sayuran segar dengan saus salsa, alpukat, daun ketumbar, guacamole, tomat, irisan bawang bombai, dan daun selada.",
        "rating": 4.3
      },
    ]
  };
  final snackABCDown = {
    "data": [
      {
        "model": "Mexican Taco",
        "img": "assets/images/menu_img/mexican_taco.jpg",
        "price": 40000,
        "dsc":
            "Taco dengan isian daging sapi dan sayuran segar dengan saus salsa, alpukat, daun ketumbar, guacamole, tomat, irisan bawang bombai, dan daun selada.",
        "rating": 4.3
      },
      {
        "model": "Ice Cream",
        "img": "assets/images/menu_img/ice_cream.jpg",
        "price": 20000,
        "dsc": "Es krim vanilla khas Chickenise disajikan dengan cone renyah",
        "rating": 4.5
      },
      {
        "model": "French Fries",
        "img": "assets/images/menu_img/french_fries.jpg",
        "price": 35000,
        "dsc":
            "Kentang goreng crispy yang ditaburi dengan bumbu special dari Chickenise dan disajikan dengan sambal dan mayonaise",
        "rating": 4.4
      },
      {
        "model": "Cheese Burger",
        "img": "assets/images/menu_img/cheese_burger.jpg",
        "price": 30000,
        "dsc":
            "Perpaduan roti burger dengan 2 Lapisan daging gurih dan 2 lapisan keju disajikan dengan saus tomat, acar, potongan bawang dan mustard.",
        "rating": 4.5
      },
      {
        "model": "Barbeque Spaghetti",
        "img": "assets/images/menu_img/barbeque_spaghetti.jpg",
        "dsc":
            "Spaghetti yang dilumuri dengan saus barbeque special dari Chickenise dengan taburan parsley dan oregano",
        "price": 38000,
        "rating": 4.4
      },
    ]
  };
  final snackPriceUp = {
    "data": [
      {
        "model": "Ice Cream",
        "img": "assets/images/menu_img/ice_cream.jpg",
        "price": 20000,
        "dsc": "Es krim vanilla khas Chickenise disajikan dengan cone renyah",
        "rating": 4.5
      },
      {
        "model": "Cheese Burger",
        "img": "assets/images/menu_img/cheese_burger.jpg",
        "price": 30000,
        "dsc":
            "Perpaduan roti burger dengan 2 Lapisan daging gurih dan 2 lapisan keju disajikan dengan saus tomat, acar, potongan bawang dan mustard.",
        "rating": 4.5
      },
      {
        "model": "French Fries",
        "img": "assets/images/menu_img/french_fries.jpg",
        "price": 35000,
        "dsc":
            "Kentang goreng crispy yang ditaburi dengan bumbu special dari Chickenise dan disajikan dengan sambal dan mayonaise",
        "rating": 4.4
      },
      {
        "model": "Barbeque Spaghetti",
        "img": "assets/images/menu_img/barbeque_spaghetti.jpg",
        "price": 38000,
        "dsc":
            "Spaghetti yang dilumuri dengan saus barbeque special dari Chickenise dengan taburan parsley dan oregano",
        "rating": 4.4
      },
      {
        "model": "Mexican Taco",
        "img": "assets/images/menu_img/mexican_taco.jpg",
        "price": 40000,
        "dsc":
            "Taco dengan isian daging sapi dan sayuran segar dengan saus salsa, alpukat, daun ketumbar, guacamole, tomat, irisan bawang bombai, dan daun selada.",
        "rating": 4.3
      },
    ]
  };
  final snackPriceDown = {
    "data": [
      {
        "model": "Mexican Taco",
        "img": "assets/images/menu_img/mexican_taco.jpg",
        "price": 40000,
        "dsc":
            "Taco dengan isian daging sapi dan sayuran segar dengan saus salsa, alpukat, daun ketumbar, guacamole, tomat, irisan bawang bombai, dan daun selada.",
        "rating": 4.3
      },
      {
        "model": "Barbeque Spaghetti",
        "img": "assets/images/menu_img/barbeque_spaghetti.jpg",
        "price": 38000,
        "dsc":
            "Spaghetti yang dilumuri dengan saus barbeque special dari Chickenise dengan taburan parsley dan oregano",
        "rating": 4.4
      },
      {
        "model": "French Fries",
        "img": "assets/images/menu_img/french_fries.jpg",
        "price": 35000,
        "dsc":
            "Kentang goreng crispy yang ditaburi dengan bumbu special dari Chickenise dan disajikan dengan sambal dan mayonaise",
        "rating": 4.4
      },
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
    ]
  };

  //DRINK
  final drink = {
    "data": [
      {
        "model": "Milkshake",
        "img": "assets/images/menu_img/milkshake.jpg",
        "price": 25000,
        "dsc":
            "Campuran susu, es, krim, dan sirup yang diblender lalu ditambah dengan sirup coklat",
        "rating": 4.4
      },
      {
        "model": "Americano",
        "img": "assets/images/menu_img/americano.jpg",
        "price": 20000,
        "dsc": "Espresso yang terbuat dari kopi asli yang dicampur dengan air",
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
        "model": "Bubble Tea",
        "img": "assets/images/menu_img/bubble_tea.jpg",
        "price": 25000,
        "dsc": "Teh special dengan boba special dari Chickenise",
        "rating": 4.3
      },
      {
        "model": "Coca Cola",
        "img": "assets/images/menu_img/coca_cola.jpg",
        "price": 15000,
        "dsc": "Minuman ringan berkarbonasi",
        "rating": 4.4
      },
    ]
  };
  final drinkRatingUp = {
    "data": [
      {
        "model": "Bubble Tea",
        "img": "assets/images/menu_img/bubble_tea.jpg",
        "price": 25000,
        "dsc": "Teh special dengan boba special dari Chickenise",
        "rating": 4.3
      },
      {
        "model": "Coca Cola",
        "img": "assets/images/menu_img/coca_cola.jpg",
        "price": 15000,
        "dsc": "Minuman ringan berkarbonasi",
        "rating": 4.4
      },
      {
        "model": "Milkshake",
        "img": "assets/images/menu_img/milkshake.jpg",
        "price": 25000,
        "dsc": "Ice blended espresso dengan susu segar dan Hazelnut syrup",
        "rating": 4.4
      },
      {
        "model": "Americano",
        "img": "assets/images/menu_img/americano.jpg",
        "price": 20000,
        "dsc": "Espresso yang terbuat dari kopi asli yang dicampur dengan air",
        "rating": 4.5
      },
      {
        "model": "Frappuccino",
        "img": "assets/images/menu_img/frappuccino.jpg",
        "price": 30000,
        "dsc":
            "Campuran susu, es, krim, dan sirup yang diblender lalu ditambah dengan sirup coklat",
        "rating": 4.6
      },
    ]
  };
  final drinkRatingDown = {
    "data": [
      {
        "model": "Frappuccino",
        "img": "assets/images/menu_img/frappuccino.jpg",
        "price": 30000,
        "dsc":
            "Campuran susu, es, krim, dan sirup yang diblender lalu ditambah dengan sirup coklat",
        "rating": 4.6
      },
      {
        "model": "Americano",
        "img": "assets/images/menu_img/americano.jpg",
        "price": 20000,
        "dsc": "Espresso yang terbuat dari kopi asli yang dicampur dengan air",
        "rating": 4.5
      },
      {
        "model": "Milkshake",
        "img": "assets/images/menu_img/milkshake.jpg",
        "price": 25000,
        "dsc": "Ice blended espresso dengan susu segar dan Hazelnut syrup",
        "rating": 4.4
      },
      {
        "model": "Coca Cola",
        "img": "assets/images/menu_img/coca_cola.jpg",
        "price": 15000,
        "dsc": "Minuman ringan berkarbonasi",
        "rating": 4.4
      },
      {
        "model": "Bubble Tea",
        "img": "assets/images/menu_img/bubble_tea.jpg",
        "price": 25000,
        "dsc": "Teh special dengan boba special dari Chickenise",
        "rating": 4.3
      },
    ]
  };
  final drinkABCUp = {
    "data": [
      {
        "model": "Americano",
        "img": "assets/images/menu_img/americano.jpg",
        "price": 20000,
        "dsc": "Espresso yang terbuat dari kopi asli yang dicampur dengan air",
        "rating": 4.5
      },
      {
        "model": "Bubble Tea",
        "img": "assets/images/menu_img/bubble_tea.jpg",
        "price": 25000,
        "dsc": "Teh special dengan boba special dari Chickenise",
        "rating": 4.3
      },
      {
        "model": "Coca Cola",
        "img": "assets/images/menu_img/coca_cola.jpg",
        "price": 15000,
        "dsc": "Minuman ringan berkarbonasi",
        "rating": 4.4
      },
      {
        "model": "Frappuccino",
        "img": "assets/images/menu_img/frappuccino.jpg",
        "price": 30000,
        "dsc":
            "Campuran susu, es, krim, dan sirup yang diblender lalu ditambah dengan sirup coklat",
        "rating": 4.6
      },
      {
        "model": "Milkshake",
        "img": "assets/images/menu_img/milkshake.jpg",
        "price": 25000,
        "dsc": "Ice blended espresso dengan susu segar dan Hazelnut syrup",
        "rating": 4.4
      },
    ]
  };
  final drinkABCDown = {
    "data": [
      {
        "model": "Milkshake",
        "img": "assets/images/menu_img/milkshake.jpg",
        "price": 25000,
        "dsc": "Ice blended espresso dengan susu segar dan Hazelnut syrup",
        "rating": 4.4
      },
      {
        "model": "Frappuccino",
        "img": "assets/images/menu_img/frappuccino.jpg",
        "price": 30000,
        "dsc":
            "Campuran susu, es, krim, dan sirup yang diblender lalu ditambah dengan sirup coklat",
        "rating": 4.6
      },
      {
        "model": "Coca Cola",
        "img": "assets/images/menu_img/coca_cola.jpg",
        "price": 15000,
        "dsc": "Minuman ringan berkarbonasi",
        "rating": 4.4
      },
      {
        "model": "Bubble Tea",
        "img": "assets/images/menu_img/bubble_tea.jpg",
        "price": 25000,
        "dsc": "Teh special dengan boba special dari Chickenise",
        "rating": 4.3
      },
      {
        "model": "Americano",
        "img": "assets/images/menu_img/americano.jpg",
        "price": 20000,
        "dsc": "Espresso yang terbuat dari kopi asli yang dicampur dengan air",
        "rating": 4.5
      },
    ]
  };
  final drinkPriceUp = {
    "data": [
      {
        "model": "Coca Cola",
        "img": "assets/images/menu_img/coca_cola.jpg",
        "price": 15000,
        "dsc": "Minuman ringan berkarbonasi",
        "rating": 4.4
      },
      {
        "model": "Americano",
        "img": "assets/images/menu_img/americano.jpg",
        "price": 20000,
        "dsc": "Espresso yang terbuat dari kopi asli yang dicampur dengan air",
        "rating": 4.5
      },
      {
        "model": "Bubble Tea",
        "img": "assets/images/menu_img/bubble_tea.jpg",
        "price": 25000,
        "dsc": "Teh special dengan boba special dari Chickenise",
        "rating": 4.3
      },
      {
        "model": "Milkshake",
        "img": "assets/images/menu_img/milkshake.jpg",
        "price": 25000,
        "dsc": "Ice blended espresso dengan susu segar dan Hazelnut syrup",
        "rating": 4.4
      },
      {
        "model": "Frappuccino",
        "img": "assets/images/menu_img/frappuccino.jpg",
        "price": 30000,
        "dsc":
            "Campuran susu, es, krim, dan sirup yang diblender lalu ditambah dengan sirup coklat",
        "rating": 4.6
      },
    ]
  };
  final drinkPriceDown = {
    "data": [
      {
        "model": "Frappuccino",
        "img": "assets/images/menu_img/frappuccino.jpg",
        "price": 30000,
        "dsc":
            "Campuran susu, es, krim, dan sirup yang diblender lalu ditambah dengan sirup coklat",
        "rating": 4.6
      },
      {
        "model": "Bubble Tea",
        "img": "assets/images/menu_img/bubble_tea.jpg",
        "price": 25000,
        "dsc": "Teh special dengan boba special dari Chickenise",
        "rating": 4.3
      },
      {
        "model": "Milkshake",
        "img": "assets/images/menu_img/milkshake.jpg",
        "price": 25000,
        "dsc": "Ice blended espresso dengan susu segar dan Hazelnut syrup",
        "rating": 4.4
      },
      {
        "model": "Americano",
        "img": "assets/images/menu_img/americano.jpg",
        "price": 20000,
        "dsc": "Espresso yang terbuat dari kopi asli yang dicampur dengan air",
        "rating": 4.5
      },
      {
        "model": "Coca Cola",
        "img": "assets/images/menu_img/coca_cola.jpg",
        "price": 15000,
        "dsc": "Minuman ringan berkarbonasi",
        "rating": 4.4
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

  ubahList(val) {
    if (val == "All") {
      setData = all;
    } else if (val == "Chicken") {
      setData = chicken;
    } else if (val == "Snacks") {
      setData = snack;
    } else if (val == "Drink") {
      setData = drink;
    }
  }

  ubahListUp(val1, val2, val3) {
    if (val1 == "Chicken" && val2 == true) {
      if (val3 == "Price") {
        setData = chickenPriceUp;
      } else if (val3 == "Rating") {
        setData = chickenRatingUp;
      } else if (val3 == "ABC") {
        setData = chickenABCUp;
      }
    } else if (val1 == "Snacks" && val2 == true) {
      if (val3 == "Price") {
        setData = snackPriceUp;
      } else if (val3 == "Rating") {
        setData = snackRatingUp;
      } else if (val3 == "ABC") {
        setData = snackABCUp;
      }
    } else if (val1 == "All" && val2 == true) {
      if (val3 == "Price") {
        setData = allPriceUp;
      } else if (val3 == "Rating") {
        setData = allRatingUp;
      } else if (val3 == "ABC") {
        setData = allABCUp;
      }
    } else if (val1 == "Drink" && val2 == true) {
      if (val3 == "Price") {
        setData = drinkPriceUp;
      } else if (val3 == "Rating") {
        setData = drinkRatingUp;
      } else if (val3 == "ABC") {
        setData = drinkABCUp;
      }
    }
  }

  ubahListDown(val1, val2, val3) {
    if (val1 == "All" && val2 == true) {
      if (val3 == "Price") {
        setData = allPriceDown;
      } else if (val3 == "Rating") {
        setData = allRatingDown;
      } else if (val3 == "ABC") {
        setData = allABCDown;
      }
    } else if (val1 == "Chicken" && val2 == true) {
      if (val3 == "Price") {
        setData = chickenPriceDown;
      } else if (val3 == "Rating") {
        setData = chickenRatingDown;
      } else if (val3 == "ABC") {
        setData = chickenABCDown;
      }
    } else if (val1 == "Snacks" && val2 == true) {
      if (val3 == "Price") {
        setData = snackPriceDown;
      } else if (val3 == "Rating") {
        setData = snackRatingDown;
      } else if (val3 == "ABC") {
        setData = snackABCDown;
      }
    } else if (val1 == "Drink" && val2 == true) {
      if (val3 == "Price") {
        setData = drinkPriceDown;
      } else if (val3 == "Rating") {
        setData = drinkRatingDown;
      } else if (val3 == "ABC") {
        setData = drinkABCDown;
      }
    }
  }
}

class chipMenu extends ChangeNotifier {
  List<Map> items = [
    {"type": "All", "iconItem": Icon(Icons.menu_book), "state": true},
    {"type": "Chicken", "iconItem": Icon(Icons.food_bank), "state": false},
    {"type": "Snacks", "iconItem": Icon(Icons.fastfood), "state": false},
    {"type": "Drink", "iconItem": Icon(Icons.coffee), "state": false},
  ];
  String type = "All";
  bool state = true;
  String type2 = "Price";

  void setChip(val) {
    if (val == "All") {
      items[0]["state"] = true;
      items[1]["state"] = false;
      items[2]["state"] = false;
      items[3]["state"] = false;
    } else if (val == "Chicken") {
      items[1]["state"] = true;
      items[0]["state"] = false;
      items[2]["state"] = false;
      items[3]["state"] = false;
    } else if (val == "Snacks") {
      items[2]["state"] = true;
      items[1]["state"] = false;
      items[0]["state"] = false;
      items[3]["state"] = false;
    } else if (val == "Drink") {
      items[3]["state"] = true;
      items[1]["state"] = false;
      items[2]["state"] = false;
      items[0]["state"] = false;
    }
    notifyListeners();
  }
}
