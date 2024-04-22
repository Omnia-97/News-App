import 'package:flutter/material.dart';
import 'package:news_app/core/configs/pages_route_name.dart';
import 'package:news_app/features/layout/pages/title_page.dart';
import 'package:news_app/features/settings/pages/setting_view.dart';
import 'package:news_app/features/splash/splash_screen.dart';
import '../../features/layout/pages/home_page.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: settings,
        );
      case PageRouteName.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: settings,
        );
      case PageRouteName.settings:
        return MaterialPageRoute(
          builder: (context) => const SettingView(),
          settings: settings,
        );
      case PageRouteName.titlePage:
        return MaterialPageRoute(
          builder: (context) => const TitlePage(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: settings,
        );
    }
  }
}
