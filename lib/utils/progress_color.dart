import 'package:flutter/material.dart';

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
