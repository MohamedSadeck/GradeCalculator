import 'package:flutter/material.dart';
import 'package:grade_calculator/models/module.dart';

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
                Stack(
                  children: [
                    Container(
                      height: height * 0.08,
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      decoration: const BoxDecoration(
                        color: Colors.white,
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
                              module.finalGrade.toStringAsFixed(2),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (module.finalGrade > 0)
                      Positioned(
                        bottom: 1,
                        left: 0,
                        child: Container(
                          height: 2, // You can adjust this as needed
                          width: MediaQuery.of(context).size.width *
                                  (module.finalGrade / 20) -
                              23, // Assuming finalGrade is out of 20
                          color: getColorBasedOnGrade(module.finalGrade),
                        ),
                      ),
                  ],
                ),
                Container(
                  height: height * 0.05,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
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
        ),
      ),
    );
  }

  Color? getColorBasedOnGrade(double grade) {
    // Map the grade range to the color range
    final t = grade / 20; // Assuming grade is out of 20
    // Interpolate between the colors
    Color? color =
        Color.lerp(Colors.red, const Color.fromARGB(255, 12, 154, 16), t);

    // Convert the color to HSL
    HSLColor hslColor = HSLColor.fromColor(color!);

    // Increase the saturation by 20%
    double increasedSaturation = hslColor.saturation + 0.2;
    increasedSaturation = increasedSaturation > 1.0 ? 1.0 : increasedSaturation;

    // Convert back to a color
    return hslColor.withSaturation(increasedSaturation).toColor();
  }
}
