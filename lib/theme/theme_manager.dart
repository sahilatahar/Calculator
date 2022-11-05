import 'package:flutter/material.dart';

class ThemeManager extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  get themeMode => _themeMode;

  toggleTheme(isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.blue,
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    primaryColor: Colors.black);

ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF151515),
    backgroundColor: Colors.blue,
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    primaryColor: Colors.white);
