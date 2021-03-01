import 'package:flutter/material.dart';

class AppTheme {

  AppTheme._();

  static final Color myGreen = Color(0xff53b276);

  static final ThemeData lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.white,
    accentColor: myGreen,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      textTheme: TextTheme(
        headline6: TextStyle(
          // color: Colors.black,
          fontSize: 25.0,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.white,
      onPrimary: Colors.white,
      primaryVariant: Colors.white38,
      secondary: myGreen,
    ),
    cardTheme: CardTheme(
      color: myGreen,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.black,
      ),
      headline6: TextStyle(
        color: Colors.black,
      ),
      subtitle2: TextStyle(
        color: Colors.black,
      ),
    ),
  );
}