import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _currentTheme = ThemeData.light();

  ThemeData get currentTheme => _currentTheme;

  ThemeProvider({bool isDark = false}) {
    if (isDark) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }
  }

  void toggleTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (_currentTheme == ThemeData.light()) {
      _currentTheme = ThemeData.dark();
      sharedPreferences.setBool("isDark", true);
    } else {
      _currentTheme = ThemeData.light();
      sharedPreferences.setBool("isDark", false);
    }
    notifyListeners();
  }
}