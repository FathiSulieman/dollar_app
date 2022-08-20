import 'package:flutter/material.dart';

class Themes {
  static ThemeData darkTheme = ThemeData(
    toggleableActiveColor: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
        .copyWith(secondary: Colors.blueAccent, brightness: Brightness.dark),
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
    iconTheme: const IconThemeData(color: Colors.white),
    appBarTheme: const AppBarTheme(
        actionsIconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
        titleTextStyle: TextStyle(color: Colors.white),
        toolbarTextStyle: TextStyle(color: Colors.white)),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.amber,
      disabledColor: Colors.grey,
    ),
  );
  static ThemeData lightTheme = ThemeData(
    toggleableActiveColor: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
        .copyWith(secondary: Colors.blueAccent, brightness: Brightness.light),
    brightness: Brightness.light,
    iconTheme: const IconThemeData(color: Colors.white),
    primaryColor: Colors.blue,
    appBarTheme: const AppBarTheme(
        actionsIconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(color: Colors.white),
        toolbarTextStyle: TextStyle(color: Colors.white)),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      disabledColor: Colors.grey,
    ),
  );
}
