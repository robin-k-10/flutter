import 'package:chickenise_app_frontend/pages/menu_detail_page.dart';
import 'package:chickenise_app_frontend/provider/dataMenu.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String dropdownValue = 'Price';
  @override
  void initState() {
    Future.microtask(() {
      Provider.of<dataMenu>(context, listen: false).initMyData();
    });
    super.initState();
  }

  final tmp = [];
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: body(context));
  }

  body(BuildContext context) {
    final prov = Provider.of<dataMenu>(context);
    final prov1 = Provider.of<chipMenu>(context);
    if (prov.data == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 83, 83, 83)
                                .withOpacity(0.8),
                            spreadRadius: 0.2,
                            blurRadius: 2,
                            offset: Offset(1, 1), // changes position of shadow
                          ),
                        ],
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                        padding: EdgeInsets.only(left: 10),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white)),
                  ),
                  Text(
                    'Our Menu',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
                  ),
                  SizedBox(
                    width: 15,
                  )
                ],
              ),
            ),
            Container(
              height: 45,
              width: double.infinity,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 242, 201),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none,
                        ),
                        labelText: 'Search',
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        )),
                    onChanged: (val) {
                      setState(() {
                        final item = prov.data["data"].where(
                          (item) =>
                              item['model'].toString().toLowerCase().contains(
                                    val.toLowerCase(),
                                  ),
                        );
                        tmp.clear();
                        tmp.addAll(item);
                        count = val.length;
                      });
                    },
                  ),
                ),
              ),
            ),
            Container(
              height: 70,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  itemCount: prov1.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: ChoiceChip(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        backgroundColor: Color.fromARGB(255, 255, 242, 201),
                        label: Text(
                          prov1.items[index]['type'],
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        labelPadding: EdgeInsets.all(5),
                        avatar: prov1.items[index]['iconItem'],
                        selected: prov1.items[index]["state"],
                        selectedColor: true
                            ? Color.fromARGB(255, 249, 172, 18)
                            : Colors.orange,
                        onSelected: (bool val) {
                          setState(() {
                            prov.ubahList(
                                prov1.items[index]["type"].toString());
                            prov1
                                .setChip(prov1.items[index]["type"].toString());
                            prov1.type = prov1.items[index]["type"];
                            prov1.state = prov1.items[index]["state"];
                          });
                        },
                      ),
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Color.fromARGB(255, 255, 242, 201),
                    ),
                    alignment: Alignment.centerLeft,
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Colors.black),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                          prov1.type2 = newValue.toString();
                        });
                      },
                      items: <String>['Price', 'Rating', 'ABC']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      underline:
                          DropdownButtonHideUnderline(child: Container()),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 255, 223, 117),
                        child: IconButton(
                          onPressed: () {
                            prov.ubahListUp(prov1.type.toString(), prov1.state,
                                prov1.type2);
                          },
                          icon: Icon(Icons.arrow_upward_outlined,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 255, 223, 117),
                        child: IconButton(
                          onPressed: () {
                            prov.ubahListDown(prov1.type.toString(),
                                prov1.state, prov1.type2);
                          },
                          icon: Icon(Icons.arrow_downward_outlined,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: List.generate(
                    count == 0 ? prov.data["data"].length : tmp.length,
                    (index) {
                  var item =
                      count == 0 ? prov.data["data"]![index] : tmp[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color.fromARGB(255, 255, 242, 201),
                      ),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: 120,
                                    child: GestureDetector(
                                      child: Image.asset(
                                        item["img"],
                                        width: 115,
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    MenuDetails(item: item))));
                                      },
                                    ),
                                  ))
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: TextButton(
                                    child: Text(
                                      item["model"],
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  MenuDetails(item: item))));
                                    },
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star_rounded,
                                        color: Colors.orange, size: 28),
                                    Icon(Icons.star_rounded,
                                        color: Colors.orange, size: 28),
                                    Icon(Icons.star_rounded,
                                        color: Colors.orange, size: 28),
                                    Icon(Icons.star_rounded,
                                        color: Colors.orange, size: 28),
                                    Icon(Icons.star_half_rounded,
                                        color: Colors.orange, size: 28),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      item["rating"].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: Text(
                                    NumberFormat.currency(
                                            locale: 'id',
                                            symbol: 'Rp ',
                                            decimalDigits: 0)
                                        .format(item['price'])
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                ElevatedButton.icon(
                                  label: Text('Add to cart'),
                                  icon: Icon(Icons.shopping_cart,
                                      color: Colors.orange),
                                  onPressed: () {
                                    prov.addItem(item);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(9))),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }))
          ],
        ),
      );
    }
  }
}
