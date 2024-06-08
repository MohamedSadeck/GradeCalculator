import 'package:flutter/material.dart';
import 'package:grade_calculator/screens/module_form_screen.dart';
import 'package:provider/provider.dart';

import '../providers/module_provider.dart';
import '../widgets/module_tile.dart';

class ModuleListScreen extends StatefulWidget {
  const ModuleListScreen({super.key});
  static const routeName = '/moduleList';

  @override
  State<ModuleListScreen> createState() => _ModuleListScreenState();
}

class _ModuleListScreenState extends State<ModuleListScreen> {
  bool _isSnackBarActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modules'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              if (!_isSnackBarActive) {
                _isSnackBarActive = true;
                final scaffoldMessenger = ScaffoldMessenger.of(context);
                scaffoldMessenger
                    .showSnackBar(
                      const SnackBar(
                        content: Text('Slide left on a module to remove it.'),
                        duration: Duration(seconds: 5),
                        behavior: SnackBarBehavior.floating,
                      ),
                    )
                    .closed
                    .then((reason) {
                  _isSnackBarActive = false;
                });
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 6, left: 5, right: 5),
        child: Consumer<ModuleProvider>(
          builder: (context, moduleProvider, child) => ListView.builder(
              itemCount: moduleProvider.modules.length,
              itemBuilder: (context, index) => ModuleTile(
                  moduleProvider: moduleProvider,
                  module: moduleProvider.modules[index],
                  context: context)),
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
}
