import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  double _gradeWeight = 0.6;

  double get gradeWeight => _gradeWeight;

  set gradeWeight(double value) {
    _gradeWeight = value;
    notifyListeners();
    _saveGradeWeightToPrefs();
  }

  SettingsProvider() {
    _loadGradeWeightFromPrefs();
  }

  Future<void> _loadGradeWeightFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _gradeWeight = prefs.getDouble('gradeWeight') ?? 0.6;
    notifyListeners();
  }

  Future<void> _saveGradeWeightToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('gradeWeight', _gradeWeight);
  }
}
