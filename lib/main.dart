import 'package:flutter/material.dart';
import 'package:grade_calculator/providers/module_provider.dart';
import 'package:grade_calculator/screens/grade_input_screen.dart';
import 'package:grade_calculator/screens/grade_list_screen.dart';
import 'package:grade_calculator/screens/home_screen.dart';
import 'package:grade_calculator/screens/module_form_screen.dart';
import 'package:grade_calculator/screens/module_list_screen.dart';
import 'package:provider/provider.dart';

import 'providers/settings_provider.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SettingsProvider()),
        ChangeNotifierProvider(
          create: (context) => ModuleProvider(),
        ),
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        ModuleListScreen.routeName: (context) => const ModuleListScreen(),
        ModuleFormScreen.routeName: (context) => const ModuleFormScreen(),
        GradeListScreen.routeName: (context) => const GradeListScreen(),
        GradeInputScreen.routeName: (context) => const GradeInputScreen(),
        SettingsScreen.routeName: (context) => const SettingsScreen(),
      },
    );
  }
}
