import 'package:flutter/material.dart';
import 'package:grade_calculator/constants/constants.dart';
import 'package:numberpicker/numberpicker.dart';

class GradePicker extends StatefulWidget {
  final String name;
  final double grade;
  final ValueChanged<double> onChanged;

  const GradePicker({
    super.key,
    required this.grade,
    required this.onChanged,
    required this.name,
  });

  @override
  State<GradePicker> createState() => _GradePickerState();
}

class _GradePickerState extends State<GradePicker> {
  late String name;
  late double grade;
  late int fraction = 0;

  @override
  void initState() {
    super.initState();
    name = widget.name;
    grade = widget.grade;
    fraction = ((grade - grade.toInt()) * 100).toInt();
  }

  @override
  Widget build(BuildContext context) {
    double width = getScreenWidth(context);
    double height = getScreenHeight(context);
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: width * 0.2,
            child: Text(
              name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: NumberPicker(
                      itemHeight: height * 0.04,
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
                  const Text(
                    '.',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: NumberPicker(
                      itemHeight: height * 0.04,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
