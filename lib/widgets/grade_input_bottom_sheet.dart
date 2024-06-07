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

  @override
  void initState() {
    super.initState();
    tpGrade = widget.module.tpGrade;
    tdGrade = widget.module.tdGrade;
    examGrade = widget.module.examGrade;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
      height: height * 0.8,
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
          if (widget.module.hasTP)
            GradePicker(
              name: 'TP',
              grade: tpGrade,
              onChanged: (value) => setState(() {
                tpGrade = value;
              }),
            ),
          if (widget.module.hasTD)
            GradePicker(
              name: 'TD',
              grade: tdGrade,
              onChanged: (value) => setState(() {
                tdGrade = value;
              }),
            ),
          ElevatedButton(
            child: const Text('Save'),
            onPressed: () {
              Provider.of<ModuleProvider>(context, listen: false).updateGrades(
                  module: widget.module,
                  examGrade: examGrade,
                  tdGrade: tdGrade,
                  tpGrade: tpGrade);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
