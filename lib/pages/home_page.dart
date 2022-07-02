import 'package:chickenise_app_frontend/pages/menu_detail_page.dart';
import 'package:chickenise_app_frontend/provider/dataMenu.dart';
import 'package:chickenise_app_frontend/provider/dataRecomended.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Recommend extends StatefulWidget {
  const Recommend({Key? key}) : super(key: key);

  @override
  State<Recommend> createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  @override
  void initState() {
    Future.microtask(() {
      Provider.of<dataRecomended>(context, listen: false).initMyData();
    });
    super.initState();
  }

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Recommended',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 251, 165, 36),
        
      ),

      body: body(context),
    );
  }

  body(BuildContext context) {
    final prov = Provider.of<dataRecomended>(context);
    final prov2 = Provider.of<dataMenu>(context);
    if (prov.data == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: List.generate(prov.data["data"].length, (index) {
                  var item = prov.data["data"]![index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color.fromARGB(255, 255, 223, 117),
                      ),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                      width: 120,
                                      child: GestureDetector(
                                        child: Image.asset(
                                          item["img"],
                                          width: 118,
                                          height: 118,
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: ((context) =>
                                                      MenuDetails(
                                                          item: item))));
                                        },
                                      )))
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
                                    prov2.addItem(item);
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
