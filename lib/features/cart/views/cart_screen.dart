import 'package:flutter/material.dart';
import 'package:marketi/core/utils/My_font_style.dart';
import 'package:marketi/core/utils/my_colors.dart';
import 'package:marketi/core/widgets/custom_button.dart';
import 'package:marketi/features/auth/widgets/appbar_container_widget.dart';
import 'package:marketi/features/cart/widgets/checkout_item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const String routeName = 'CartScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: MyColors.whiteColor,
        leading: AppBarContainer(),
        centerTitle: true,
        title: Text(
          "Cart",
          style: MyFontStyle.font20Meduim.copyWith(
            color: MyColors.darkBlue900Color,
          ),
        ),

        actions: [
          Container(
            margin: EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: MyColors.lightBlue100Color, width: 2),
            ),
            padding: const EdgeInsets.all(4),
            child: const Icon(
              Icons.person,
              size: 16,
              color: MyColors.navyColor,
            ),
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 16),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => CheckoutItmeWidget(),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  spreadRadius: 1,
                  offset: Offset(0, 0),
                  color: MyColors.lightBlue900Color,
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Suptotal (3 items)",
                        style: MyFontStyle.font16SemiBold.copyWith(
                          color: MyColors.darkBlue900Color,
                        ),
                      ),
                      Text(
                        "EGP 1,120,00",
                        style: MyFontStyle.font16SemiBold.copyWith(
                          color: MyColors.darkBlue900Color,
                        ),
                      ),
                    ], //
                  ),
                ),
                CustomButton(
                  outSidePadding: EdgeInsetsGeometry.all(8),
                  onPressed: () {},
                  text: 'Checkout',
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
