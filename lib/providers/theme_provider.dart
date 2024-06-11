import 'package:flutter/material.dart';

import '../constants/theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void updateTheme(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    _themeData = brightness == Brightness.dark ? darkMode : lightMode;
    notifyListeners();
  }

  void toggleTheme() {
    themeData = isLight() ? darkMode : lightMode;
  }

  bool isLight() => _themeData == lightMode;
}
