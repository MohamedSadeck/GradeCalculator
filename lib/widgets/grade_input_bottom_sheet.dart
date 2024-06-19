import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/module.dart';
import '../providers/module_provider.dart';
import 'grade_picker.dart';

class GradeInputBottomSheet extends StatefulWidget {
  final Module module;

  const GradeInputBottomSheet({super.key, required this.module});

  @override
  State<GradeInputBottomSheet> createState() => _GradeInputBottomSheetState();
}

class _GradeInputBottomSheetState extends State<GradeInputBottomSheet> {
  double tpGrade = 0;
  double tdGrade = 0;
  double examGrade = 0;

  bool hasTP = false;
  bool hasTD = false;

  int fields = 1;

  @override
  void initState() {
    super.initState();
    tpGrade = widget.module.tpGrade;
    tdGrade = widget.module.tdGrade;
    examGrade = widget.module.examGrade;
    hasTP = widget.module.hasTP;
    hasTD = widget.module.hasTD;
    fields += hasTP ? 1 : 0;
    fields += hasTD ? 1 : 0;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.primary),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      height: 108 + height * 0.16 * fields,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GradePicker(
            name: 'Exam',
            grade: examGrade,
            onChanged: (value) => setState(() {
              examGrade = value;
            }),
          ),
          if (hasTP)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: GradePicker(
                name: 'TP',
                grade: tpGrade,
                onChanged: (value) => setState(() {
                  tpGrade = value;
                }),
              ),
            ),
          if (hasTD)
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: GradePicker(
                name: 'TD',
                grade: tdGrade,
                onChanged: (value) => setState(() {
                  tdGrade = value;
                }),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              child: const Text('Save'),
              onPressed: () {
                Provider.of<ModuleProvider>(context, listen: false)
                    .updateGrades(
                        module: widget.module,
                        examGrade: examGrade,
                        tdGrade: tdGrade,
                        tpGrade: tpGrade);
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
