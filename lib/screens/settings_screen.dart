import 'package:flutter/material.dart';
import 'package:grade_calculator/providers/module_provider.dart';
import 'package:grade_calculator/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  static const routeName = '/settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var moduleProvider = Provider.of<ModuleProvider>(context, listen: false);
    var themeProvider = Provider.of<ThemeProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: <Widget>[
          const ListTile(
            title: Text('Grade Weight'),
          ),
          RadioListTile<double>(
            title: const Text('50% - 50%'),
            value: 0.5,
            groupValue: moduleProvider.gradeWeight,
            onChanged: (double? value) {
              setState(() => moduleProvider.gradeWeight = value!);
            },
          ),
          RadioListTile<double>(
            title: const Text('60% - 40%'),
            value: 0.6,
            groupValue: moduleProvider.gradeWeight,
            onChanged: (double? value) {
              setState(() => moduleProvider.gradeWeight = value!);
            },
          ),
          Switch(
            value: themeProvider.isLight(),
            onChanged: (value) {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
    );
  }
}
