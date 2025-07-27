import 'package:flutter/material.dart';
import 'package:marketi/features/app_section/app_section.dart';
import 'package:marketi/features/auth/view/congratolation_screen.dart';
import 'package:marketi/features/auth/view/forget_password_with_email_screen.dart';
import 'package:marketi/features/auth/view/forget_password_with_phone_screen.dart';
import 'package:marketi/features/auth/view/login_screen.dart';
import 'package:marketi/features/auth/view/register_screen.dart';
import 'package:marketi/features/auth/view/verivication_code_with_phone.dart';
import 'package:marketi/features/cart/views/cart_screen.dart';
import 'package:marketi/features/checkout/chechout_screen.dart';
import 'package:marketi/features/favorite/Views/favorite_screen.dart';
import 'package:marketi/features/home/views/all_brands.dart';
import 'package:marketi/features/home/views/all_categories_screen.dart';
import 'package:marketi/features/home/views/best_for_you.dart';
import 'package:marketi/features/home/views/buy_again.dart';
import 'package:marketi/features/home/views/home_screen.dart';
import 'package:marketi/features/home/views/popular_product.dart';
import 'package:marketi/features/menue/views/menu_screen.dart';
import 'package:marketi/features/onboard/view/onboarding_screen.dart';
import 'package:marketi/features/search/search_not_found_screen.dart';
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
        // VerivicationCodeWithEmailScreen.routeName: (context) =>
        //     VerivicationCodeWithEmailScreen(),
        // CreateNewPasswordScreen.routeName: (context) =>
        //     CreateNewPasswordScreen(),
        CongratulationsScreen.routeName: (context) => CongratulationsScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        CartScreen.routeName: (context) => CartScreen(),
        FavoriteScreen.routeName: (context) => FavoriteScreen(),
        MenuScreen.routeName: (context) => MenuScreen(),
        CheckoutScreen.routename: (context) => CheckoutScreen(),
        SearchNotFoundScreen.routename: (context) => SearchNotFoundScreen(),
        AppSection.routeName: (context) => AppSection(),
        PopularProduct.routeName: (context) => PopularProduct(),
        BuyAgain.routeName: (context) => BuyAgain(),
        BestForYou.routeName: (context) => BestForYou(),
        AllBrandsScreen.routeName: (context) => AllBrandsScreen(),
        AllCategoriesScreen.routeName: (context) => AllCategoriesScreen(),
      },
    );
  }
}
