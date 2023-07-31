import 'package:flutter/material.dart';

class ChangeColorProvider extends ChangeNotifier{
  bool isDarkTheme = false;

  Color color = Colors.blue;

  void changeColor() {
    isDarkTheme = !isDarkTheme;
    color = isDarkTheme ? Colors.grey : Colors.blue;
    notifyListeners();
}

}