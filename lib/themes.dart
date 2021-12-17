import 'package:flutter/material.dart';

class Themes {
  static const darkModeCode = 0;
  static const lighModeCode = 1;

  static final _dark = ThemeData(
      primaryColor: Colors.black,
      hintColor: Colors.white,
      disabledColor: Colors.green);

  static final _light = ThemeData(
      primaryColor: Colors.white,
      hintColor: Colors.black,
      disabledColor: Colors.green);

  static ThemeData getTheme(int code) {
    if (code == lighModeCode) {
      return _light;
    }
    return _dark;
  }
}
