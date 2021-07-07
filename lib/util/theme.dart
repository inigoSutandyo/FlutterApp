import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTheme with ChangeNotifier {
  static bool _darkTheme = false;

  ThemeMode currentTheme() {
    return _darkTheme ? ThemeMode.dark : ThemeMode.light;

  }

  void switchTheme() {
    _darkTheme = !_darkTheme;
    notifyListeners();
  }

}