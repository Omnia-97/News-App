import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/configs/app_theme_manager.dart';
import 'package:news_app/core/configs/pages_route_name.dart';
import 'package:news_app/core/configs/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/provider/my_provider.dart';
import 'package:provider/provider.dart';

import 'observer.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
    ChangeNotifierProvider<MyProvider>(
      create: (context) => MyProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.languageCode),
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      initialRoute: PageRouteName.initial,
      onGenerateRoute: Routes.onGenerateRoute,
      theme: AppThemeManager.applicationThemeData,
    );
  }
}
