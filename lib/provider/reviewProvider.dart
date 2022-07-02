import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class dataReview extends ChangeNotifier {
  List allReview = [];
  double rating = 0;
  TextEditingController review = TextEditingController();
  DateTime Date = DateTime.now();
  String DateFromat(BuildContext context) {
    return '${DateFormat('dd MMMM yyyy').format(Date)}';
  }

  void addNewItem(
      String type, String waktu, String nama, String rating, String review) {
    final newData = {
      "type": type,
      "waktu": waktu,
      "name": nama,
      "rating": rating,
      "review": review,
    };
    allReview.add(newData);
    notifyListeners();
  }

  FunctionLength(String type) {
    int i = 0;
    int length = 0;
    for (i; i < allReview.length; i++) {
      if (allReview[i]["type"] == type) {
        length += 1;
      }
    }
    return length;
  }

  FunctionReview(String type) {
    int i = 0;
    List review = [];
    for (i; i < allReview.length; i++) {
      if (allReview[i]["type"] == type) {
        review.add(allReview[i]["review"]);
      }
    }
    return review;
  }

  FunctionWaktu(String type) {
    int i = 0;
    List waktu = [];
    for (i; i < allReview.length; i++) {
      if (allReview[i]["type"] == type) {
        waktu.add(allReview[i]["waktu"]);
      }
    }
    return waktu;
  }

  FunctionName(String type) {
    int i = 0;
    List name = [];
    for (i; i < allReview.length; i++) {
      if (allReview[i]["type"] == type) {
        name.add(allReview[i]["name"]);
      }
    }
    return name;
  }

  FunctionRating(String type) {
    int i = 0;
    List rating = [];
    for (i; i < allReview.length; i++) {
      if (allReview[i]["type"] == type) {
        rating.add(allReview[i]["rating"]);
      }
    }
    return rating;
  }
}
