import 'package:flutter/material.dart';
import 'package:grade_calculator/models/module.dart';
import 'package:grade_calculator/screens/module_form_screen.dart';
import 'package:provider/provider.dart';

import '../providers/module_provider.dart';

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
          itemBuilder: (context, index) => moduleTile(
              moduleProvider, moduleProvider.modules[index], context),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () =>
            Navigator.of(context).pushNamed(ModuleFormScreen.routeName),
        icon: const Icon(Icons.add),
        label: const Text("Add Module"),
      ),
    );
  }

  Widget moduleTile(
    ModuleProvider moduleProvider,
    Module module,
    BuildContext context,
  ) {
    return Dismissible(
      key: Key("${module.id}"),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        return await deleteDialog(context);
      },
      onDismissed: (direction) {
        moduleProvider.removeModule(module.id);
      },
      background: FractionallySizedBox(
        alignment: Alignment.centerRight,
        widthFactor:
            0.3, // Adjust this value to control the width of the background
        child: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          child: const Icon(Icons.delete, color: Colors.white),
        ),
      ),
      child: ListTile(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ModuleFormScreen.routeName, arguments: module);
        },
        title: Text(
          module.name,
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }

  Future<bool?> deleteDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm"),
          content: const Text("Are you sure you wish to delete this item?"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("CANCEL"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.red),
              child: const Text("DELETE"),
            ),
          ],
        );
      },
    );
  }
}
