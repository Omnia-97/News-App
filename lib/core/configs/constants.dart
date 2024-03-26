import 'package:flutter/material.dart';
import 'package:news_app/main.dart';

class Constants{
  static var theme = Theme.of(navigatorKey.currentState!.context);
  static var mediaQuery =MediaQuery.of(navigatorKey.currentState!.context);
  static String baseURl = 'newsapi.org';
  static String apiKeyValue = 'd629e941c1de4b81b1ec4d816b6b0074';
}