import 'package:flutter/material.dart';
import 'package:grade_calculator/models/module.dart';
import 'package:grade_calculator/screens/module_form_screen.dart';
import 'package:provider/provider.dart';

import '../providers/module_provider.dart';
import '../widgets/module_tile.dart';

class ModuleListScreen extends StatelessWidget {
  const ModuleListScreen({super.key});
  static const routeName = '/moduleList';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modules'),
      ),
      body: Consumer<ModuleProvider>(
        builder: (context, moduleProvider, child) => ListView.builder(
            itemCount: moduleProvider.modules.length,
            itemBuilder: (context, index) => ModuleTile(
                moduleProvider: moduleProvider,
                module: moduleProvider.modules[index],
                context: context)),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () =>
            Navigator.of(context).pushNamed(ModuleFormScreen.routeName),
        icon: const Icon(Icons.add),
        label: const Text("Add Module"),
      ),
    );
  }
}
