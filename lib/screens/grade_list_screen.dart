import 'package:flutter/material.dart';
import 'package:grade_calculator/providers/module_provider.dart';
import 'package:grade_calculator/widgets/grade_item.dart';
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
              return GradeItem(module: module);
            },
          );
        },
      ),
    );
  }
}
