import 'package:flutter/material.dart';
import 'package:marketi/features/home/views/home_screen.dart';
import 'package:marketi/features/onboard/view/onboarding_screen.dart';
import 'package:marketi/features/splach_screen.dart';

void main() {
  runApp(const MarketiApp());
}

class MarketiApp extends StatelessWidget {
  const MarketiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}
