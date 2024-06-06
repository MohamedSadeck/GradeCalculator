import 'package:flutter/material.dart';
import 'package:grade_calculator/models/module.dart';
import 'package:grade_calculator/providers/module_provider.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class ModuleFormScreen extends StatefulWidget {
  const ModuleFormScreen({super.key});
  static const routeName = '/moduleForm';

  @override
  State<ModuleFormScreen> createState() => _ModuleFormScreenState();
}

class _ModuleFormScreenState extends State<ModuleFormScreen> {
  late String name;
  late int coefficient;
  late int credit;
  late bool hasTP;
  late bool hasTD;
  Module? module;

  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    name = '';
    coefficient = 1;
    credit = 0;
    hasTP = false;
    hasTD = false;

    nameController = TextEditingController(text: name);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    module = ModalRoute.of(context)!.settings.arguments as Module?;
    if (module != null) {
      name = module!.name;
      coefficient = module!.coefficient;
      credit = module!.credit;
      hasTP = module!.hasTP;
      hasTD = module!.hasTD;
    }
    nameController.text = name;
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Module Form'),
        leading: TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Consumer<ModuleProvider>(
        builder: (context, moduleProvider, child) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Text('Module Name: '),
                  Expanded(
                    child: TextField(
                      controller: nameController,
                      onChanged: (value) {
                        setState(() => name = value);
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  const Text('Coefficient: '),
                  Expanded(
                    child: NumberPicker(
                      value: coefficient,
                      minValue: 1,
                      maxValue: 9,
                      onChanged: (value) => setState(() => coefficient = value),
                    ),
                  ),
                  const Text('Credit: '),
                  Expanded(
                    child: NumberPicker(
                      value: credit,
                      minValue: 0,
                      maxValue: 9,
                      onChanged: (value) => setState(() => credit = value),
                    ),
                  ),
                ],
              ),
              CheckboxListTile(
                title: const Text('TD'),
                value: hasTD,
                onChanged: (bool? newValue) {
                  setState(() => hasTD = newValue!);
                },
              ),
              CheckboxListTile(
                title: const Text('TP'),
                value: hasTP,
                onChanged: (bool? newValue) {
                  setState(() => hasTP = newValue!);
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (module == null) {
                    moduleProvider.addModule(
                      Module(
                        name: name,
                        coefficient: coefficient,
                        credit: credit,
                        hasTP: hasTP,
                        hasTD: hasTD,
                      ),
                    );
                  } else {
                    module!.update(
                      name: name,
                      coefficient: coefficient,
                      credit: credit,
                      hasTP: hasTP,
                      hasTD: hasTD,
                    );
                  }
                  Navigator.of(context).pop();
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
