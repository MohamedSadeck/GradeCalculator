import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightTheme;

  ThemeProvider() {
    loadTheme();
  }

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLight = prefs.getBool('isLight') ?? true;
    _themeData = isLight ? lightTheme : darkTheme;
    notifyListeners();
  }

  void toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLight = _themeData == lightTheme;
    await prefs.setBool('isLight', !isLight);
    themeData = isLight ? darkTheme : lightTheme;
  }

  bool isLight() => _themeData == lightTheme;
}
