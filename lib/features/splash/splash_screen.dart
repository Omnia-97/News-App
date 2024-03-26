import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/core/configs/pages_route_name.dart';
import 'package:news_app/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      navigatorKey.currentState! .pushReplacementNamed(PageRouteName.home);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
     return Scaffold(
      body: Image(
        image: const AssetImage(
          'assets/images/splash_screen.png',
        ),
        fit: BoxFit.fill,
        width: mediaQuery.width,
        height: mediaQuery.height,
      ),
    );
  }
}
