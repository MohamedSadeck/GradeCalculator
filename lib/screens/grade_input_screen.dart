import 'package:flutter/material.dart';
import 'package:grade_calculator/models/module.dart';
import 'package:grade_calculator/widgets/grade_picker.dart';
import 'package:provider/provider.dart';

import '../providers/module_provider.dart';

class GradeInputScreen extends StatefulWidget {
  const GradeInputScreen({super.key});

  static const routeName = '/gradeInput';

  @override
  State<GradeInputScreen> createState() => _GradeInputScreenState();
}

class _GradeInputScreenState extends State<GradeInputScreen> {
  final _formKey = GlobalKey<FormState>();

  Module? module;

  double tpGrade = 0;
  double tdGrade = 0;
  double examGrade = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    module = ModalRoute.of(context)!.settings.arguments as Module;
    tpGrade = module!.tpGrade;
    tdGrade = module!.tdGrade;
    examGrade = module!.examGrade;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grade Input'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            GradePicker(
              grade: examGrade,
              onChanged: (value) => setState(() {
                examGrade = value;
              }),
            ),
            if (module!.hasTP)
              GradePicker(
                grade: tpGrade,
                onChanged: (value) => setState(() {
                  tpGrade = value;
                }),
              ),
            if (module!.hasTD)
              GradePicker(
                grade: tdGrade,
                onChanged: (value) => setState(() {
                  tdGrade = value;
                }),
              ),
            ElevatedButton(
              child: const Text('Save'),
              onPressed: () {
                Provider.of<ModuleProvider>(context, listen: false)
                    .updateGrades(
                        module: module!,
                        examGrade: examGrade,
                        tdGrade: tdGrade,
                        tpGrade: tpGrade);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
