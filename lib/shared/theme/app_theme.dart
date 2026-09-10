import 'package:flutter/material.dart';

class AppTheme {
  static Color black = Color(0xFF171717);
  static Color white = Color(0xFFFFFFFF);
  static Color grey = Color(0xFFA0A0A0);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: white,
    appBarTheme: AppBarThemeData(
      backgroundColor: white,
      foregroundColor: black,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: .w500, color: black),
      centerTitle: true,
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(fontSize: 32, fontWeight: .bold, color: black),
      titleLarge: TextStyle(fontSize: 24, fontWeight: .bold, color: black),
      titleMedium: TextStyle(fontSize: 20, fontWeight: .bold, color: white),
      titleSmall: TextStyle(fontSize: 16, fontWeight: .bold, color: white),
      labelLarge: TextStyle(fontSize: 14, fontWeight: .w500, color: white),
      labelMedium: TextStyle(fontSize: 12, fontWeight: .w500, color: white),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: black,
    appBarTheme: AppBarThemeData(
      backgroundColor: black,
      foregroundColor: white,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: .w500, color: white),
      centerTitle: true,
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(fontSize: 32, fontWeight: .bold, color: black),
      titleLarge: TextStyle(fontSize: 24, fontWeight: .bold, color: black),
      titleMedium: TextStyle(fontSize: 20, fontWeight: .bold, color: white),
      titleSmall: TextStyle(fontSize: 16, fontWeight: .bold, color: white),
      labelLarge: TextStyle(fontSize: 14, fontWeight: .w500, color: white),
      labelMedium: TextStyle(fontSize: 12, fontWeight: .w500, color: grey),
    ),
  );
}
