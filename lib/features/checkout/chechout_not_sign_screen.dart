import 'package:flutter/material.dart';
import 'package:marketi/core/constants/assets_constant.dart';
import 'package:marketi/core/utils/My_font_style.dart';
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
        Image.asset(AssetsConstant.logInvalidation),
        SizedBox(height: 22),
        Text(
          'You\'re Not Signed In',
          style: MyFontStyle.font24Meduim.copyWith(
            color: MyColors.darkBlue900Color,
          ),
        ),
        SizedBox(height: 30),
        Text(
          'Please sign in and enjoy our services\n    and big offers',

          textAlign: TextAlign.center,
          style: MyFontStyle.font16Meduim.copyWith(
            color: MyColors.navyColor,
            overflow: TextOverflow.fade,
          ),
        ),
        SizedBox(height: 30),
        CustomButton(onPressed: () {}, text: "Sign In", width: double.infinity),
      ],
    );
  }
}
