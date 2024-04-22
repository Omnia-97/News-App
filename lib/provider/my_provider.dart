import 'package:flutter/foundation.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = "en";

  void changeLanguage(String langCode) {
    if (langCode == languageCode) {
      return;
    }
    languageCode = langCode;
    notifyListeners();
  }
}
