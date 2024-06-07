import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grade_calculator/models/module.dart';
import 'package:grade_calculator/screens/grade_input_screen.dart';

class GradeItem extends StatelessWidget {
  final Module module;

  const GradeItem({super.key, required this.module});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final Module module = this.module;
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(GradeInputScreen.routeName, arguments: module),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: height * 0.08,
              padding: const EdgeInsets.only(left: 12, right: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                border: Border(
                  top: BorderSide(
                    color: Colors.grey[200]!,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  left: BorderSide(
                    color: Colors.grey[200]!,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  right: BorderSide(
                    color: Colors.grey[200]!,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1, 0),
                    child: Text(
                      module.name,
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1, 0),
                    child: Text(
                      module.finalGrade.toString(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: height * 0.05,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[300]!,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  left: BorderSide(
                    color: Colors.grey[300]!,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  right: BorderSide(
                    color: Colors.grey[300]!,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text('Exam'),
                        Text(module.examGrade.toString()),
                      ],
                    ),
                  ),
                  if (module.hasTD) const VerticalDivider(),
                  if (module.hasTD)
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text('TD'),
                          Text(module.tdGrade.toString()),
                        ],
                      ),
                    ),
                  if (module.hasTP) const VerticalDivider(),
                  if (module.hasTP)
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text('TP'),
                          Text(module.tpGrade.toString()),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
