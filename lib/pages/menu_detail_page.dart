import 'package:chickenise_app_frontend/provider/dataMenu.dart';
import 'package:chickenise_app_frontend/provider/datadiriController.dart';
import 'package:chickenise_app_frontend/provider/reviewProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MenuDetails extends StatefulWidget {
  final Map item;
  const MenuDetails({Key? key, required this.item}) : super(key: key);

  @override
  State<MenuDetails> createState() => _MenuDetailsState();
}

class _MenuDetailsState extends State<MenuDetails> {
  @override
  Widget build(BuildContext context) {
    var review = Provider.of<dataReview>(context);
    var dataDiri = Provider.of<dataDiriController>(context);
    var prov2 = Provider.of<dataMenu>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 500,
                  height: 230,
                  child: Image.asset(widget.item['img']),
                ),
                Positioned(
                  top: 45,
                  left: 25,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 237, 237, 237)
                                .withOpacity(0.8),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset:
                                Offset(0.5, 0.5), // changes position of shadow
                          ),
                        ],
                        color: Colors.orange,
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                        padding: EdgeInsets.only(left: 10),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white)),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item['model'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(
                    width: 15,
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(Icons.star_rounded, color: Colors.orange, size: 20),
                      Icon(Icons.star_rounded, color: Colors.orange, size: 20),
                      Icon(Icons.star_rounded, color: Colors.orange, size: 20),
                      Icon(Icons.star_rounded, color: Colors.orange, size: 20),
                      Icon(Icons.star_half_rounded,
                          color: Colors.orange, size: 20),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.item['rating'].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      widget.item['dsc'].toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 172, 40),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        NumberFormat.currency(
                                locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                            .format(widget.item['price'])
                            .toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        onPressed: () {
                          prov2.addItem(widget.item);
                        },
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Color.fromARGB(255, 255, 172, 40),
                        ),
                        label: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Reviews",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                        itemCount: review.FunctionLength(widget.item['model']),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 35,
                                        child: Text(
                                            dataDiri.usernamee.substring(0, 1)),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                          review.FunctionName(
                                              widget.item['model'])[index],
                                          style: TextStyle(fontSize: 22))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 8),
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 255, 242, 201),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              review.FunctionWaktu(
                                                  widget.item['model'])[index],
                                              style: TextStyle(fontSize: 20)),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Rating: ",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 18),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "${review.FunctionRating(widget.item['model'])[index]}/5.0",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 18),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            review.FunctionReview(
                                                widget.item['model'])[index],
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 16),
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: TextField(
                            controller: review.review,
                            decoration: InputDecoration(
                              fillColor: Colors.orange,
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 5),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50)),
                              labelText: 'Type Something . . .',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Ink(
                        decoration: const ShapeDecoration(
                          color: Colors.orange,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.send_outlined),
                          color: Colors.black,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      title: const Text('Rate Us Food'),
                                      content: RatingBar.builder(
                                        initialRating: 0,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          review.rating = rating;
                                        },
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                            child: const Text('OK'),
                                            onPressed: () {
                                              review.addNewItem(
                                                  widget.item['model'],
                                                  review.DateFromat(context),
                                                  dataDiri.usernamee,
                                                  review.rating.toString(),
                                                  review.review.text);
                                              Navigator.pop(context, 'OK');
                                              review.review.clear();
                                            }),
                                      ],
                                    ));
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
