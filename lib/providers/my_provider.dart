import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String text1 = '';
  String text2 = '';
  String result = '';

  bool isDarkTheme = false;

  Color color = Colors.blue;

  void changeColor() {
    isDarkTheme = !isDarkTheme;
    color = isDarkTheme ? Colors.grey : Colors.blue;
    notifyListeners();
  }

  void getData() {
    result = text1 + text2;
    notifyListeners();
  }
}