import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  String languageCode = 'en';

  void changeLanguge(String languge) {
    if (languageCode == languge) return;
    languageCode = languge;
    notifyListeners();
  }
}
