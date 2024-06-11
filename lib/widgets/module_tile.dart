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
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 4),
      child: Dismissible(
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
          widthFactor: 0.3,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
            ),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
        ),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
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
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: FittedBox(
                  child: Text(module.name[0]),
                ),
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }
}
