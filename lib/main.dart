import 'package:flutter/material.dart';
import 'package:grade_calculator/constants/theme.dart';
import 'package:grade_calculator/providers/module_provider.dart';
import 'package:grade_calculator/providers/theme_provider.dart';
import 'package:grade_calculator/screens/grade_list_screen.dart';
import 'package:grade_calculator/screens/home_screen.dart';
import 'package:grade_calculator/screens/module_form_screen.dart';
import 'package:grade_calculator/screens/module_list_screen.dart';
import 'package:grade_calculator/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'screens/settings_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ModuleProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeProvider.themeData,
      initialRoute: SplashScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        ModuleListScreen.routeName: (context) => const ModuleListScreen(),
        ModuleFormScreen.routeName: (context) => const ModuleFormScreen(),
        GradeListScreen.routeName: (context) => const GradeListScreen(),
        SettingsScreen.routeName: (context) => const SettingsScreen(),
      },
    );
  }
}
