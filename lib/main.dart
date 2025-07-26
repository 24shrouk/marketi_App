import 'package:flutter/material.dart';
import 'package:marketi/features/auth/view/congratolation_screen.dart';
import 'package:marketi/features/auth/view/create_new_password_screen.dart';
import 'package:marketi/features/auth/view/forget_password_with_email_screen.dart';
import 'package:marketi/features/auth/view/forget_password_with_phone_screen.dart';
import 'package:marketi/features/auth/view/login_screen.dart';
import 'package:marketi/features/auth/view/register_screen.dart';
import 'package:marketi/features/auth/view/verivication_code_with_email.dart';
import 'package:marketi/features/auth/view/verivication_code_with_phone.dart';
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
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        ForgetPasswordWithPhoneScreen.routeName: (context) =>
            const ForgetPasswordWithPhoneScreen(),
        ForgetPasswordWithEmailScreen.routeName: (context) =>
            const ForgetPasswordWithEmailScreen(),
        VerivicationCodeWithPhoneScreen.routeName: (context) =>
            VerivicationCodeWithPhoneScreen(),
        VerivicationCodeWithEmailScreen.routeName: (context) =>
            VerivicationCodeWithEmailScreen(),
        CreateNewPasswordScreen.routeName: (context) =>
            CreateNewPasswordScreen(),
        CongratulationsScreen.routeName: (context) => CongratulationsScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}
