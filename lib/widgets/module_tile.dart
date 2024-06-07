import 'package:flutter/material.dart';

import '../models/module.dart';
import '../providers/module_provider.dart';
import '../screens/module_form_screen.dart';
import '../utils/delete_dialog.dart';

class ModuleTile extends StatelessWidget {
  final ModuleProvider moduleProvider;
  final Module module;

  const ModuleTile(
      {super.key,
      required this.moduleProvider,
      required this.module,
      required BuildContext context});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(module.id),
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
}
