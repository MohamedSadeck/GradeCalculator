import 'package:flutter/material.dart';
import 'package:grade_calculator/constants/constants.dart';
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
  final _formKey = GlobalKey<FormState>();
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
    final height = getScreenHeight(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const Text('Module Form'),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Consumer<ModuleProvider>(
            builder: (context, moduleProvider, child) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: nameController,
                        textCapitalization: TextCapitalization.words,
                        decoration: const InputDecoration(
                          labelText: 'Module Name',
                          hintText: 'Enter the module name',
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                          labelStyle:
                              TextStyle(color: Colors.black87, fontSize: 18),
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        style: const TextStyle(
                            color: Colors.black87, fontSize: 18),
                        onChanged: (value) {
                          setState(() => name = value);
                        },
                        validator: (value) {
                          String trimmedValue = value!.toLowerCase().trim();
                          if (trimmedValue.isEmpty) {
                            return 'Please enter a name';
                          } else if (!RegExp(r'^[a-zA-Z0-9 ]+$')
                              .hasMatch(trimmedValue)) {
                            return 'Only alphanumeric & spaces allowed';
                          } else if (moduleProvider.modules.any((module) =>
                              module.name.toLowerCase().trim() ==
                              trimmedValue)) {
                            return 'This module already exists';
                          }
                          return null;
                        },
                      ),
                      Container(
                        height: height * 0.2,
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black87),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  const Text(
                                    'Coefficient',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: NumberPicker(
                                      value: coefficient,
                                      minValue: 1,
                                      maxValue: 9,
                                      onChanged: (value) =>
                                          setState(() => coefficient = value),
                                      itemHeight: 33,
                                      textStyle: const TextStyle(
                                          fontSize: 18, color: Colors.black87),
                                      selectedTextStyle: const TextStyle(
                                        fontSize: 26,
                                        color: Color.fromARGB(255, 9, 2, 207),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  const Text(
                                    'Credit',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: NumberPicker(
                                      value: credit,
                                      minValue: 0,
                                      maxValue: 9,
                                      onChanged: (value) =>
                                          setState(() => credit = value),
                                      itemHeight: 33,
                                      textStyle: const TextStyle(
                                          fontSize: 18, color: Colors.black87),
                                      selectedTextStyle: const TextStyle(
                                          fontSize: 26,
                                          color:
                                              Color.fromARGB(255, 9, 2, 207)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black87),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
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
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
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
                          }
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
