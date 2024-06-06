import 'package:flutter/material.dart';
import 'package:grade_calculator/providers/module_provider.dart';
import 'package:provider/provider.dart';
import 'grade_list_screen.dart';
import 'module_list_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grade Calculator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).pushNamed(SettingsScreen.routeName);
            },
          ),
        ],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(ModuleListScreen.routeName);
              },
              title: const Text('Modules'),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(GradeListScreen.routeName);
              },
              title: const Text('Grades'),
            ),
            Consumer<ModuleProvider>(
              builder: (context, moduleProvider, child) {
                return ListTile(
                  title: Text(
                    'Total average: ${moduleProvider.average.toStringAsFixed(2)}/20',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
