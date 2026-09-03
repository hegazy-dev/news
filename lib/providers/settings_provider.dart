import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  String languageCode = 'en';
  ThemeMode themeMode = ThemeMode.dark;

  void changeLanguge(String languge) {
    if (languageCode == languge) return;
    languageCode = languge;
    notifyListeners();
  }

  void changeTheme(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }
}
