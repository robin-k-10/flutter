import 'package:chickenise_app_frontend/provider/dataMenu.dart';
import 'package:chickenise_app_frontend/screens/checkout_screen.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<dataMenu>(context, listen: true);
    // print(prov.cart_list.length);

    int totalPrice = 0;
    setState(() {
      for (var i = 0; i < prov.cart_list.length; i++) {
        totalPrice += prov.cart_list[i]['tmpPrice'] as int;
      }
    });

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Cart',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 251, 165, 36),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: prov.cart_list.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 242, 201),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          width: 80,
                                          child: Image.asset(
                                              // 'https://images.unsplash.com/photo-1582395787198-630d7fb2bfbf?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8NTAwJTIwcGl4ZWx8ZW58MHx8MHx8&auto=format&fit=crop&w=500'
                                              prov.cart_list[index]['img']),
                                        ),
                                      ),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.7,
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        prov.cart_list[index]
                                                            ['model'],
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      IconButton(
                                                          onPressed: () {
                                                            prov.delete(index);
                                                          },
                                                          icon: Icon(
                                                              Icons.close,
                                                              color:
                                                                  Colors.red))
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.7,
                                                  padding: EdgeInsets.only(
                                                      right: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          IconButton(
                                                            onPressed: () {
                                                              prov.subsQuantity(
                                                                  index);
                                                            },
                                                            icon: Icon(
                                                                Icons.remove,
                                                                color: Colors
                                                                    .orange),
                                                          ),
                                                          Text(
                                                            prov.cart_list[
                                                                    index]
                                                                    ['quantity']
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 18),
                                                          ),
                                                          IconButton(
                                                            onPressed: () {
                                                              prov.addQuantity(
                                                                  index);
                                                            },
                                                            icon: Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .orange),
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        NumberFormat.currency(
                                                                locale: 'id',
                                                                symbol: 'Rp ',
                                                                decimalDigits:
                                                                    0)
                                                            .format(
                                                                prov.cart_list[
                                                                        index][
                                                                    'tmpPrice'])
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  TextField(
                                    maxLines: 2,
                                    decoration: InputDecoration(
                                      fillColor: Colors.orange,
                                      filled: true,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      labelText: 'add a note . . .',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Subtotal",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(
                        NumberFormat.currency(
                                locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                            .format(totalPrice)
                            .toString(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))
                  ],
                ),
                ElevatedButton(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Proceed to payment method',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Checkout(totalPrice: totalPrice);
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(
                        width: 5, color: Color.fromRGBO(123, 246, 158, 1)),
                    primary: Color.fromARGB(255, 12, 148, 50),
                    minimumSize: Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
