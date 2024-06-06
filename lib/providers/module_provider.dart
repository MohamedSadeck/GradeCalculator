import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grade_calculator/models/module.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModuleProvider extends ChangeNotifier {
  List<Module> _modules = [];

  List<Module> get modules => _modules;

  ModuleProvider() {
    _loadModulesFromPrefs();
  }

  void addModule(Module module) {
    _modules.add(module);
    notifyListeners();
    _saveModulesToPrefs();
  }

  void removeModule(int id) {
    _modules.removeWhere((module) => module.id == id);
    notifyListeners();
    _saveModulesToPrefs();
  }

  Future<void> _loadModulesFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final moduleData = prefs.getStringList('modules') ?? [];
    _modules =
        moduleData.map((data) => Module.fromJson(jsonDecode(data))).toList();
    notifyListeners();
  }

  Future<void> _saveModulesToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final moduleData = _modules.map((module) => jsonEncode(module.toJson()));
    prefs.setStringList('modules', moduleData.toList());
  }
}
