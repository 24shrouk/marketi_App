import 'package:flutter/material.dart';
import 'package:marketi/core/constants/assets_constant.dart';
import 'package:marketi/core/utils/My_font_style.dart';
import 'package:marketi/core/utils/my_colors.dart';
import 'package:marketi/core/utils/validator.dart';
import 'package:marketi/core/widgets/custom_button.dart';
import 'package:marketi/core/widgets/custom_textbox.dart';
import 'package:marketi/features/auth/view/forget_password_with_email_screen.dart';
import 'package:marketi/features/auth/view/verivication_code_with_phone.dart';
import 'package:marketi/features/auth/widgets/appbar_container_widget.dart';

class ForgetPasswordWithPhoneScreen extends StatefulWidget {
  const ForgetPasswordWithPhoneScreen({super.key});
  static const String routeName = 'ForgetPasswordWithPhoneScreen';

  @override
  State<ForgetPasswordWithPhoneScreen> createState() =>
      _ForgetPasswordWithPhoneScreenState();
}

class _ForgetPasswordWithPhoneScreenState
    extends State<ForgetPasswordWithPhoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: MyColors.whiteColor,
        title: Text(
          'Forgot Password',
          style: MyFontStyle.font16Meduim.copyWith(color: MyColors.navyColor),
        ),
        leading: AppBarContainer(),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16.0, bottom: 16, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              Image.asset(AssetsConstant.forgotPasswordWithPhoneImage),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Please enter your phone number to\n        receive a verification code',
                  style: MyFontStyle.font16Meduim.copyWith(
                    color: MyColors.navyColor,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Phone Number',
                  style: MyFontStyle.font12Meduim.copyWith(
                    color: MyColors.darkBlue900Color,
                  ),
                ),
              ),
              CustomTextFormFeild(
                validator: Validator.validatePhoneNumber,
                keyboardType: TextInputType.phone,
                hint: 'phone number',
                hintStyle: MyFontStyle.font12Regular.copyWith(
                  color: MyColors.hintColor,
                ),
                prefixIcon: const Icon(
                  Icons.phone_iphone,
                  color: MyColors.darkBlue900Color,
                ),
              ),
              SizedBox(height: 34),
              CustomButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    VerivicationCodeWithPhoneScreen.routeName,
                  );
                },
                text: "Send Code",
                width: double.infinity,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    ForgetPasswordWithEmailScreen.routeName,
                  );
                },
                child: Text(
                  "Try Another Way",
                  style: MyFontStyle.font16SemiBold.copyWith(
                    color: MyColors.lightBlue100Color,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
