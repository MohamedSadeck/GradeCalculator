import 'package:flutter/material.dart';

// final lightPrimaryColor = Colors.grey.shade300;
// final lightSecondaryColor = Colors.grey.shade200;
// const lightContentColor = Colors.black87;
// final darkPrimaryColor = Colors.grey.shade800;
// final darkSecondaryColor = Colors.grey.shade700;
// const darkContentColor = Colors.white;

// ThemeData lightMode = ThemeData(
//   brightness: Brightness.light,
//   colorScheme: ColorScheme.light(
//       primary: lightPrimaryColor,
//       secondary: lightSecondaryColor,
//       surface: Colors.white,
//       onPrimary: Colors.black87),
//   floatingActionButtonTheme: FloatingActionButtonThemeData(
//     backgroundColor: lightPrimaryColor,
//     foregroundColor: Colors.black87,
//   ),
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ButtonStyle(
//       backgroundColor: WidgetStateProperty.all(lightSecondaryColor),
//       foregroundColor: WidgetStateProperty.all(Colors.black87),
//       padding: WidgetStateProperty.all(
//         const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//       ),
//       shape: WidgetStatePropertyAll(
//         RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//       ),
//     ),
//   ),
//   textTheme: const TextTheme(
//     titleSmall: TextStyle(
//       color: lightContentColor,
//       fontSize: 16,
//     ),
//     titleMedium: TextStyle(
//       color: lightContentColor,
//       fontSize: 19,
//     ),
//     titleLarge: TextStyle(
//       color: lightContentColor,
//       fontSize: 23,
//     ),
//   ),
// );
// ThemeData darkMode = ThemeData(
//   brightness: Brightness.dark,
//   colorScheme: ColorScheme.dark(
//       primary: darkPrimaryColor,
//       secondary: darkSecondaryColor,
//       surface: Colors.grey.shade700,
//       onPrimary: Colors.white),
//   floatingActionButtonTheme: FloatingActionButtonThemeData(
//     backgroundColor: darkPrimaryColor,
//   ),
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ButtonStyle(
//       backgroundColor: WidgetStateProperty.all(darkSecondaryColor),
//       padding: WidgetStateProperty.all(
//         const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//       ),
//       shape: WidgetStatePropertyAll(
//         RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//       ),
//     ),
//   ),
//   textTheme: const TextTheme(
//     titleSmall: TextStyle(
//       color: darkContentColor,
//       fontSize: 16,
//     ),
//     titleMedium: TextStyle(
//       color: darkContentColor,
//       fontSize: 19,
//     ),
//     titleLarge: TextStyle(
//       color: darkContentColor,
//       fontSize: 23,
//     ),
//   ),
// );
ThemeData lightTheme = ThemeData(
  primaryColor: const Color(0xFF2196F3),
  primaryColorDark: const Color(0xFF1976D2),
  hintColor: const Color(0xFFBBDEFB),
  scaffoldBackgroundColor: Colors.white,
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF2196F3),
    onPrimary: Colors.white,
    secondary: Color(0xFFBBDEFB),
    onSecondary: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
    error: Colors.redAccent,
  ).copyWith(surface: Colors.white),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: const WidgetStatePropertyAll(
          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
      backgroundColor: WidgetStateProperty.all(
        Colors.white,
      ),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xFF2196F3)),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  primaryColor: const Color(0xFFBBDEFB),
  primaryColorDark: const Color(0xFF2196F3),
  hintColor: const Color(0xFF1976D2),
  scaffoldBackgroundColor: const Color(0xFF121212),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFFBBDEFB),
    onPrimary: Colors.black,
    secondary: Color(0xFF1976D2),
    onSecondary: Colors.white,
    surface: Color(0xFF121212),
    onSurface: Colors.white,
    error: Colors.redAccent,
  ).copyWith(surface: Colors.black),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: const WidgetStatePropertyAll(
          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
      // backgroundColor: WidgetStateProperty.all(Color(0xFFBBDEFB)),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xFFBBDEFB)),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  ),
);
