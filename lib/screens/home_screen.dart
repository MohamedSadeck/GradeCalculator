import 'package:flutter/material.dart';
import 'package:grade_calculator/constants/constants.dart';
import 'package:grade_calculator/providers/module_provider.dart';
import 'package:grade_calculator/utils/progress_color.dart';
import 'package:provider/provider.dart';
import 'grade_list_screen.dart';
import 'module_list_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('Grade Calculator'),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Navigator.of(context).pushNamed(SettingsScreen.routeName);
          },
        ),
      ],
    );
    final appBarHeight = appBar.preferredSize.height;
    final height = getScreenHeight(context) -
        appBarHeight -
        MediaQuery.of(context).padding.top;
    final width = getScreenWidth(context);
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Consumer<ModuleProvider>(
              builder: (context, moduleProvider, child) {
                return Container(
                  height: height * 0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Total average:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 45),
                      ),
                      Text(
                        "${moduleProvider.average.toStringAsFixed(2)}/20",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                            color:
                                getColorBasedOnGrade(moduleProvider.average)),
                      ),
                    ],
                  ),
                );
              },
            ),
            Container(
              height: height * 0.25,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MyContainer(
                    width: width,
                    text: 'Modules',
                    route: ModuleListScreen.routeName,
                  ),
                  MyContainer(
                    width: width,
                    text: 'Grades',
                    route: GradeListScreen.routeName,
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

class MyContainer extends StatelessWidget {
  const MyContainer({
    super.key,
    required this.width,
    required this.text,
    required this.route,
  });

  final double width;
  final String route;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
      child: Card(
        elevation: 9,
        color: Colors.white,
        child: Container(
          width: width * 0.45,
          height: double.infinity,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 2,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.grade_outlined,
                size: 40,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
