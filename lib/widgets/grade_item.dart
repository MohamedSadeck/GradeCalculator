import 'package:flutter/material.dart';
import 'package:grade_calculator/models/module.dart';

import '../utils/progress_color.dart';
import 'grade_input_bottom_sheet.dart';

class GradeItem extends StatelessWidget {
  final Module module;

  const GradeItem({super.key, required this.module});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final Module module = this.module;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return GradeInputBottomSheet(module: module);
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  return Stack(
                    children: [
                      Container(
                        height: height * 0.08,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          color: Theme.of(context).colorScheme.surfaceBright,
                        ),
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1, 0),
                              child: Text(
                                module.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(1, 0),
                              child: Text(
                                module.finalGrade.toStringAsFixed(2),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (module.finalGrade > 0)
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Container(
                            height: 2, // You can adjust this as needed
                            width: constraints.maxWidth *
                                (module.finalGrade /
                                    20), // finalGrade is out of 20
                            color: getColorBasedOnGrade(module.finalGrade),
                          ),
                        ),
                    ],
                  );
                }),
                Container(
                  height: height * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    color: Theme.of(context).colorScheme.surfaceContainer,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Exam',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              module.examGrade.toString(),
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      if (module.hasTD)
                        const VerticalDivider(
                          thickness: 0.75,
                        ),
                      if (module.hasTD)
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'TD',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                module.tdGrade.toString(),
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      if (module.hasTP)
                        const VerticalDivider(
                          thickness: 0.75,
                        ),
                      if (module.hasTP)
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'TP',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                module.tpGrade.toString(),
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
