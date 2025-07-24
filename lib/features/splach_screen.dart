import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:marketi/core/constants/assets_constant.dart';
import 'package:marketi/core/utils/my_colors.dart';
import 'package:marketi/features/home/views/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      body: FadeInDown(
        duration: const Duration(seconds: 1),
        child: Center(
          child: Image.asset(
            AssetsConstant.splashLogo,
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}
