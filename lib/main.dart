import 'package:flutter/material.dart';
import 'package:grade_calculator/providers/module_provider.dart';
import 'package:grade_calculator/screens/grade_list_screen.dart';
import 'package:grade_calculator/screens/home_screen.dart';
import 'package:grade_calculator/screens/module_form_screen.dart';
import 'package:grade_calculator/screens/module_list_screen.dart';
import 'package:provider/provider.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ModuleProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        colorScheme: ThemeData.light().colorScheme.copyWith(
              secondary: Colors.black87,
            ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(color: Colors.black),
              bodyMedium: const TextStyle(color: Colors.black87),
              titleLarge: const TextStyle(color: Colors.black, fontSize: 20),
            ),
        appBarTheme: const AppBarTheme(
          elevation: 2,
          centerTitle: true,
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.white),
            foregroundColor: WidgetStateProperty.all(Colors.black87),
            textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 16)),
            padding: WidgetStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 36, vertical: 12)),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(
                    color:
                        Colors.black) // add this line to make the border black
                )),
          ),
        ),
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        ModuleListScreen.routeName: (context) => const ModuleListScreen(),
        ModuleFormScreen.routeName: (context) => const ModuleFormScreen(),
        GradeListScreen.routeName: (context) => const GradeListScreen(),
        SettingsScreen.routeName: (context) => const SettingsScreen(),
      },
    );
  }
}
