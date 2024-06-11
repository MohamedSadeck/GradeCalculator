// splash_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
      themeProvider.updateTheme(context);
    });
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Loading...'),
      ),
    );
  }
}
