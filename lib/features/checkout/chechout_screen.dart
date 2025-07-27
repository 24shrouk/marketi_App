import 'package:flutter/material.dart';
import 'package:marketi/core/constants/assets_constant.dart';
import 'package:marketi/core/utils/My_font_style.dart' show MyFontStyle;
import 'package:marketi/core/utils/my_colors.dart';
import 'package:marketi/core/widgets/custom_button.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});
  static const routename = 'CheckoutScreen';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AssetsConstant.emptyCart),
        SizedBox(height: 22),
        Text(
          'Thank You!',
          style: MyFontStyle.font24Meduim.copyWith(
            color: MyColors.darkBlue900Color,
          ),
        ),
        SizedBox(height: 30),
        Text(
          'Woah, You Have sucessfully orderd',

          textAlign: TextAlign.center,
          style: MyFontStyle.font16Meduim.copyWith(
            color: MyColors.navyColor,
            overflow: TextOverflow.fade,
          ),
        ),
        SizedBox(height: 30),
        CustomButton(onPressed: () {}, text: "Go Home", width: double.infinity),
      ],
    );
  }
}
