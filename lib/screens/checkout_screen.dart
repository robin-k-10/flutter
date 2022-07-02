import 'package:chickenise_app_frontend/display_page.dart';
import 'package:chickenise_app_frontend/provider/dataMenu.dart';
import 'package:chickenise_app_frontend/provider/datadiriController.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Checkout extends StatefulWidget {
  final int totalPrice;

  const Checkout({Key? key, required this.totalPrice}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int _paymentMethod = 0;

  List valueMethod = [1, 2, 3];
  List<String> paymentMethod = ['Paypal', 'E - Wallet', 'Cash on Delivery'];

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<dataMenu>(context);
    final prov2 = Provider.of<dataDiriController>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 17, vertical: 10),
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
                                    offset: Offset(1, 1),
                                  ),
                                ],
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(10)),
                            child: IconButton(
                                padding: EdgeInsets.only(left: 10),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_back_ios,
                                    color: Colors.white)),
                          ),
                          Text(
                            'Checkout',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 26),
                          ),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Payment Method",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      ListView.builder(
                        itemCount: paymentMethod.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: new EdgeInsets.symmetric(vertical: 5.0),
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 83, 83, 83)
                                        .withOpacity(0.8),
                                    spreadRadius: 0.2,
                                    blurRadius: 2,
                                    offset: Offset(
                                        1, 1), // changes position of shadow
                                  ),
                                ],
                                color: Color.fromARGB(255, 255, 242, 201),
                                borderRadius: BorderRadius.circular(10)),
                            child: RadioListTile(
                              value: valueMethod[index] as int,
                              title: Text(
                                paymentMethod[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 20),
                              ),
                              activeColor: Colors.orange,
                              groupValue: _paymentMethod,
                              secondary: Icon(
                                Icons.payment,
                                size: 40,
                                color: Colors.black,
                              ),
                              controlAffinity: ListTileControlAffinity.trailing,
                              onChanged: (val) {
                                setState(
                                  () {
                                    _paymentMethod = val as int;
                                  },
                                );
                              },
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                left: 10, top: 15, bottom: 15, right: 30),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 83, 83, 83)
                                        .withOpacity(0.8),
                                    spreadRadius: 0.2,
                                    blurRadius: 2,
                                    offset: Offset(
                                        1, 1), // changes position of shadow
                                  ),
                                ],
                                color: Color.fromARGB(255, 255, 242, 201),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Selected Menu",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  prov.cart_list.length.toString(),
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 10, top: 15, bottom: 15, right: 30),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 83, 83, 83)
                                        .withOpacity(0.8),
                                    spreadRadius: 0.2,
                                    blurRadius: 2,
                                    offset: Offset(
                                        1, 1), // changes position of shadow
                                  ),
                                ],
                                color: Color.fromARGB(255, 255, 242, 201),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Subtotal",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'Rp ',
                                          decimalDigits: 0)
                                      .format(widget.totalPrice)
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 10, top: 15, bottom: 15, right: 30),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 83, 83, 83)
                                        .withOpacity(0.8),
                                    spreadRadius: 0.2,
                                    blurRadius: 2,
                                    offset: Offset(
                                        1, 1), // changes position of shadow
                                  ),
                                ],
                                color: Color.fromARGB(255, 255, 242, 201),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Delivery",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "Rp. 10.000",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 10, top: 15, bottom: 15, right: 30),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 83, 83, 83)
                                        .withOpacity(0.8),
                                    spreadRadius: 0.2,
                                    blurRadius: 2,
                                    offset: Offset(
                                        1, 1), // changes position of shadow
                                  ),
                                ],
                                color: Color.fromARGB(255, 255, 242, 201),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'Rp ',
                                          decimalDigits: 0)
                                      .format(widget.totalPrice + 10000)
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: ElevatedButton(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'PLACE ORDER',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text(
                                            'Thank for your order :)'),
                                        content: const Text(
                                            'Your order is being processed ...'),
                                        actions: <Widget>[
                                          TextButton(
                                              child: const Text('OK'),
                                              onPressed: () {
                                                prov2.index = 2;
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: ((context) =>
                                                            DisplayPage())));
                                              })
                                        ],
                                      );
                                    });
                              },
                              style: ElevatedButton.styleFrom(
                                side: BorderSide(
                                    width: 5,
                                    color: Color.fromARGB(255, 255, 235, 122)),
                                primary: Colors.amber,
                                minimumSize: Size.fromHeight(50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
