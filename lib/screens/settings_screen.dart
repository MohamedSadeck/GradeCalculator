import 'package:flutter/material.dart';
import 'package:grade_calculator/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  static const routeName = '/settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider =
        Provider.of<SettingsProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          const ListTile(
            title: Text('Grade Weight'),
          ),
          RadioListTile<double>(
            title: const Text('50% - 50%'),
            value: 0.5,
            groupValue: settingsProvider.gradeWeight,
            onChanged: (double? value) {
              setState(() => settingsProvider.gradeWeight = value!);
            },
          ),
          RadioListTile<double>(
            title: const Text('60% - 40%'),
            value: 0.6,
            groupValue: settingsProvider.gradeWeight,
            onChanged: (double? value) {
              setState(() => settingsProvider.gradeWeight = value!);
            },
          ),
        ],
      ),
    );
  }
}
