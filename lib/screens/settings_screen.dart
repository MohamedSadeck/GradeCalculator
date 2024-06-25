import 'package:flutter/material.dart';
import 'package:grade_calculator/providers/module_provider.dart';
import 'package:grade_calculator/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:country_flags/country_flags.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  static const routeName = '/settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var moduleProvider = Provider.of<ModuleProvider>(context, listen: false);
    var themeProvider = Provider.of<ThemeProvider>(context, listen: true);

    final height = MediaQuery.of(context).size.height;

    CountryFlag selectedLanguage = CountryFlag.fromCountryCode('us');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Card(
              elevation: 5,
              color: Theme.of(context).colorScheme.surfaceBright,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.percent),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Grade Weight",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      moduleProvider.gradeWeight == 0.5
                          ? "50% - 50%"
                          : "60% - 40%",
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: Container(
                              width: 40,
                              height: 5,
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(2.5),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  title: const Text('50% - 50%'),
                                  leading: Radio<double>(
                                    value: 0.5,
                                    groupValue: moduleProvider.gradeWeight,
                                    onChanged: (double? value) {
                                      setState(() {
                                        moduleProvider.gradeWeight = value!;
                                        Navigator.pop(
                                            context); // Close the bottom sheet
                                      });
                                    },
                                  ),
                                  onTap: () {
                                    setState(() {
                                      moduleProvider.gradeWeight = 0.5;
                                      Navigator.pop(
                                          context); // Close the bottom sheet
                                    });
                                  },
                                ),
                                const Divider(),
                                ListTile(
                                  title: const Text('60% - 40%'),
                                  leading: Radio<double>(
                                    value: 0.6,
                                    groupValue: moduleProvider.gradeWeight,
                                    onChanged: (double? value) {
                                      setState(() {
                                        moduleProvider.gradeWeight = value!;
                                        Navigator.pop(
                                            context); // Close the bottom sheet
                                      });
                                    },
                                  ),
                                  onTap: () {
                                    setState(() {
                                      moduleProvider.gradeWeight = 0.6;
                                      Navigator.pop(
                                          context); // Close the bottom sheet
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            Card(
              elevation: 5,
              color: Theme.of(context).colorScheme.surfaceBright,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Icon(
                  Theme.of(context).brightness == Brightness.dark
                      ? Icons.brightness_2
                      : Icons.brightness_6,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Theme",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Switch(
                      value: themeProvider.isLight(),
                      onChanged: (value) {
                        themeProvider.toggleTheme();
                      },
                      activeTrackColor: Colors.lightGreenAccent,
                      activeColor: Colors.green,
                      inactiveThumbColor: Colors.grey,
                      inactiveTrackColor: Colors.grey.shade400,
                    ),
                  ],
                ),
                onTap: () {
                  themeProvider.toggleTheme();
                },
              ),
            ),
            Card(
              elevation: 5,
              color: Theme.of(context).colorScheme.surfaceBright,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Language",
                      style: TextStyle(fontSize: 20),
                    ),
                    selectedLanguage,
                  ],
                ),
                leading: const Icon(Icons.language),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SafeArea(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Center(
                              child: Container(
                                width: 40,
                                height: 5,
                                margin:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(2.5),
                                ),
                              ),
                            ),
                            Wrap(
                              children: <Widget>[
                                ListTile(
                                  leading: CountryFlag.fromCountryCode('us'),
                                  title: const Text('English'),
                                  onTap: () {
                                    selectedLanguage =
                                        CountryFlag.fromCountryCode('us');
                                    Navigator.pop(context);
                                  },
                                ),
                                const Divider(
                                    color: Colors.grey,
                                    thickness: 1), // Tiny divider
                                const SizedBox(
                                    height: 8), // Space between tiles

                                ListTile(
                                  leading: CountryFlag.fromCountryCode('fr'),
                                  title: const Text('French'),
                                  onTap: () {
                                    selectedLanguage =
                                        CountryFlag.fromCountryCode('fr');
                                    Navigator.pop(context);
                                  },
                                ),
                                const Divider(
                                    color: Colors.grey,
                                    thickness: 1), // Tiny divider
                                const SizedBox(
                                    height: 8), // Space between tiles

                                ListTile(
                                  leading: CountryFlag.fromCountryCode('dz'),
                                  title: const Text('العربية'),
                                  onTap: () {
                                    selectedLanguage =
                                        CountryFlag.fromCountryCode('dz');
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
