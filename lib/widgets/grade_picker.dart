import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class GradePicker extends StatefulWidget {
  final double grade;
  final ValueChanged<double> onChanged;

  const GradePicker({
    super.key,
    required this.grade,
    required this.onChanged,
  });

  @override
  State<GradePicker> createState() => _GradePickerState();
}

class _GradePickerState extends State<GradePicker> {
  late double grade;
  late int fraction = 0;

  @override
  void initState() {
    super.initState();
    grade = widget.grade;
    fraction = ((grade - grade.toInt()) * 100).toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Grade'),
        Expanded(
          child: NumberPicker(
            value: grade.toInt(),
            minValue: 0,
            maxValue: 20,
            onChanged: (value) {
              setState(() {
                if (value == 20) fraction = 0;
                grade = value.toDouble() + (fraction / 100);
              });
              widget.onChanged(grade);
            },
          ),
        ),
        Expanded(
          child: NumberPicker(
            value: fraction,
            minValue: 0,
            maxValue: grade.toInt() == 20 ? 0 : 75,
            step: 25,
            onChanged: (value) {
              setState(() {
                fraction = value;
                grade = grade.toInt() + (fraction / 100);
              });
              widget.onChanged(grade);
            },
          ),
        ),
      ],
    );
  }
}
