import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi/core/constants/assets_constant.dart';
import 'package:marketi/core/utils/my_colors.dart';
import 'package:marketi/features/cart/views/cart_screen.dart';
import 'package:marketi/features/favorite/Views/favorite_screen.dart';
import 'package:marketi/features/home/view_model/products_cubit/home_products_cubit.dart';
import 'package:marketi/features/home/views/home_screen.dart';
import 'package:marketi/features/menue/views/menu_screen.dart';

class AppSection extends StatefulWidget {
  static const String routeName = 'AppSection';
  const AppSection({super.key});

  @override
  State<AppSection> createState() => _AppSectionState();
}

class _AppSectionState extends State<AppSection> {
  List<Widget> widgetList = [
    HomeScreen(),
    CartScreen(),
    FavoriteScreen(),
    MenuScreen(),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    Widget currentPage = widgetList[index];
    if (index == 0) {
      currentPage = BlocProvider(
        create: (context) => HomeProductsCubit()..getHomeProducts(),
        child: currentPage,
      );
    }
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: MyColors.whiteColor,
        unselectedFontSize: 13,
        selectedFontSize: 14,
        selectedItemColor: MyColors.lightBlue100Color,
        // unselectedItemColor: MyColors.greyScaleColor,
        type: BottomNavigationBarType.fixed,

        showSelectedLabels: true,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: MyColors.lightBlue100Color,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          color: MyColors.greyScaleColor,
        ),
        currentIndex: index,
        onTap: (selectedIndex) {
          index = selectedIndex;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsConstant.homeIcon,
              height: 23,
              width: 23,
              fit: BoxFit.cover,
              color: index == 0
                  ? MyColors.lightBlue100Color
                  : MyColors.greyScaleColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsConstant.cartIcon,
              height: 23,
              width: 23,
              fit: BoxFit.cover,
              color: index == 1
                  ? MyColors.lightBlue100Color
                  : MyColors.greyScaleColor,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsConstant.favoriteIcon,
              height: 23,
              width: 23,
              fit: BoxFit.cover,
              color: index == 2
                  ? MyColors.lightBlue100Color
                  : MyColors.greyScaleColor,
            ),
            label: ' Favorite',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsConstant.menueIcon,
              height: 23,
              width: 23,
              fit: BoxFit.cover,
              color: index == 3
                  ? MyColors.lightBlue100Color
                  : MyColors.greyScaleColor,
            ),
            label: 'Menu',
          ),
        ],
      ),
      body: SafeArea(child: currentPage),
    );
  }
}
