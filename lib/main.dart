import 'package:dollar/exchange_rate/screens/lebanon_rate_widegt.dart';
import 'package:dollar/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: Themes.darkTheme,
      child: GetMaterialApp(
        title: 'Dollar Today Lebanon',
        darkTheme: Themes.darkTheme,
        theme: Themes.lightTheme,
        themeMode: ThemeMode.system,
        home: const LebanonRateWidget(),
      ),
    );
  }
}
