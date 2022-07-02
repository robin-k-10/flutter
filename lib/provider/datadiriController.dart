import 'package:flutter/material.dart';

class dataDiriController extends ChangeNotifier {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController handphone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  int index = 2;

  String usernamee = '-';
  String emaill = '-';
  String handphonee = '-';
  String birth = '-';

  bool isUsernameEmpty = true;
  bool isemailEmpty = true;
  bool ishandphoneEmpty = true;
  bool isPasswordEmpty = true;
  bool isconfirmPasswordEmpty = true;

  void checkRegister() {
    if (username.text.isNotEmpty) {
      isUsernameEmpty = true;
      notifyListeners();
    }
    if (email.text.isNotEmpty) {
      isemailEmpty = true;
      notifyListeners();
    }
    if (handphone.text.isNotEmpty) {
      ishandphoneEmpty = true;
      notifyListeners();
    }
    if (password.text.isNotEmpty) {
      isPasswordEmpty = true;
      notifyListeners();
    }
    if (confirmpassword.text.isNotEmpty &&
        confirmpassword.text != password.text) {
      isconfirmPasswordEmpty = false;
      notifyListeners();
    }
    if (confirmpassword.text.isNotEmpty &&
        confirmpassword.text == password.text) {
      isconfirmPasswordEmpty = true;
      notifyListeners();
    }
    if (username.text.isEmpty) {
      isUsernameEmpty = false;
      notifyListeners();
    }
    if (email.text.isEmpty) {
      isemailEmpty = false;
      notifyListeners();
    }
    if (handphone.text.isEmpty) {
      ishandphoneEmpty = false;
      notifyListeners();
    }
    if (password.text.isEmpty) {
      isPasswordEmpty = false;
      notifyListeners();
    }
    if (confirmpassword.text.isEmpty) {
      isconfirmPasswordEmpty = false;
      notifyListeners();
    }
  }

  void checkLogin() {
    if (username.text.isEmpty) {
      isUsernameEmpty = false;
      notifyListeners();
    }
    if (password.text.isEmpty) {
      isPasswordEmpty = false;
      notifyListeners();
    }
    if (username.text.isNotEmpty) {
      isUsernameEmpty = true;
      notifyListeners();
    }
    if (password.text.isNotEmpty) {
      isPasswordEmpty = true;
      notifyListeners();
    }
  }
}
