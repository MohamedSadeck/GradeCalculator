import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grade_calculator/models/module.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModuleProvider extends ChangeNotifier {
  double _average = 0;
  double _gradeWeight = 0.6;
  List<Module> _modules = [];

  double get average => _average;
  double get gradeWeight => _gradeWeight;
  List<Module> get modules => _modules;

  set gradeWeight(double value) {
    _gradeWeight = value;
    for (Module m in _modules) {
      m.calculateGrades(examWeight: _gradeWeight);
    }
    _calculateAverage();
    _saveGradeWeightToPrefs();
  }

  ModuleProvider() {
    _loadGradeWeightFromPrefs();
    _loadModulesFromPrefs();
  }

  void addModule(Module module) {
    _modules.add(module);
    _modules.sort((a, b) => b.coefficient.compareTo(a.coefficient));
    _calculateAverage();
    _saveModulesToPrefs();
  }

  void removeModule(String id) {
    _modules.removeWhere((module) => module.id == id);
    _calculateAverage();
    _saveModulesToPrefs();
  }

  void updateGrades({
    required Module module,
    required double tdGrade,
    required double tpGrade,
    required double examGrade,
  }) {
    module.updateGrades(
      tdGrade: tdGrade,
      tpGrade: tpGrade,
      examGrade: examGrade,
      examWeight: _gradeWeight,
    );
    _calculateAverage();
    _saveModulesToPrefs();
  }

  void _calculateAverage() {
    double sum = 0;
    double coeff = 0;
    for (var module in _modules) {
      sum += module.finalGrade * module.coefficient;
      coeff += module.coefficient;
    }
    _average = coeff != 0 ? sum / coeff : 0;
    notifyListeners();
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

  Future<void> _loadModulesFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final moduleData = prefs.getStringList('modules') ?? [];
    _modules =
        moduleData.map((data) => Module.fromJson(jsonDecode(data))).toList();
    _calculateAverage();
    print(modules);
    notifyListeners();
  }

  Future<void> _saveModulesToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final moduleData = _modules.map((module) => jsonEncode(module.toJson()));
    prefs.setStringList('modules', moduleData.toList());
  }
}
