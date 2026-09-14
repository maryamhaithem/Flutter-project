import 'package:flutter/material.dart';

class AppTheme {
  ThemeData lighttheme() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
    );
  }

  ThemeData darktheme() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
    );
  }
}