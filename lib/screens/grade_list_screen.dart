import 'package:flutter/material.dart';
import 'package:grade_calculator/providers/module_provider.dart';
import 'package:grade_calculator/screens/grade_input_screen.dart';
import 'package:provider/provider.dart';

class GradeListScreen extends StatelessWidget {
  const GradeListScreen({super.key});
  static const routeName = '/gradeList';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grade List'),
      ),
      body: Consumer<ModuleProvider>(
        builder: (context, moduleProvider, child) {
          return ListView.builder(
            itemCount: moduleProvider.modules.length,
            itemBuilder: (context, index) {
              final module = moduleProvider.modules[index];
              final finalGrade = module.finalGrade ?? 0;
              return ListTile(
                title: Text(module.name),
                subtitle: Text(
                  finalGrade.toStringAsFixed(2),
                ),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(GradeInputScreen.routeName, arguments: module);
                },
              );
            },
          );
        },
      ),
    );
  }
}
