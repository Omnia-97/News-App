import 'package:flutter/material.dart';
import 'package:news_app/core/configs/app_theme_manager.dart';
import 'package:news_app/core/configs/pages_route_name.dart';
import 'package:news_app/core/configs/routes.dart';
GlobalKey<NavigatorState> navigatorKey =GlobalKey<NavigatorState>();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      initialRoute: PageRouteName.initial,
      onGenerateRoute: Routes.onGenerateRoute,
      theme: AppThemeManager.applicationThemeData,
    );
  }
}
