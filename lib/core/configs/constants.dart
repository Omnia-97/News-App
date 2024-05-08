import 'package:flutter/material.dart';
import 'package:news_app/main.dart';

class Constants {
  static var theme = Theme.of(navigatorKey.currentState!.context);
  static var mediaQuery = MediaQuery.of(navigatorKey.currentState!.context);
  static String baseURl = 'newsapi.org';
  static String apiKeyValue = '28d014269c5e4fe3add1ec43dca1ec14';
  static const Color primaryColor = Color(0xFF0e5c6d);
}
