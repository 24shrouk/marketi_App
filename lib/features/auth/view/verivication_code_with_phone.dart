import 'package:flutter/material.dart';
import 'package:marketi/core/constants/assets_constant.dart';
import 'package:marketi/core/utils/My_font_style.dart';
import 'package:marketi/core/utils/my_colors.dart';
import 'package:marketi/core/widgets/custom_button.dart';
import 'package:marketi/features/auth/view/create_new_password_screen.dart';
import 'package:marketi/features/auth/widgets/appbar_container_widget.dart';
import 'package:pinput/pinput.dart';

class VerivicationCodeWithPhoneScreen extends StatefulWidget {
  const VerivicationCodeWithPhoneScreen({super.key});
  static const String routeName = 'VerivicationCodeWithPhoneScreen';

  @override
  State<VerivicationCodeWithPhoneScreen> createState() =>
      _VerivicationCodeWithPhoneScreenState();
}

class _VerivicationCodeWithPhoneScreenState
    extends State<VerivicationCodeWithPhoneScreen> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.lightBlue700Color),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: MyColors.lightBlue100Color),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: MyColors.whiteColor,
        title: Text(
          'Verification Code',
          style: MyFontStyle.font16Meduim.copyWith(color: MyColors.navyColor),
        ),
        leading: AppBarContainer(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(AssetsConstant.validationCodeWithPhone),
              SizedBox(height: 22),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Please enter the 4 digit code\n   sent to:',
                    ),
                    TextSpan(
                      text: ' +20 1501142409 ',
                      style: MyFontStyle.font16Meduim.copyWith(
                        color: MyColors.lightBlue100Color,
                      ),
                    ),
                  ],
                ),
                style: MyFontStyle.font16Meduim.copyWith(
                  color: MyColors.navyColor,
                ),
              ),
              SizedBox(height: 25),
              Pinput(
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
              ),
              SizedBox(height: 22),
              CustomButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    CreateNewPasswordScreen.routeName,
                  );
                },
                text: 'Verify Code',
                width: double.infinity,
              ),
              SizedBox(height: 22),

              Text(
                '00:46',
                style: MyFontStyle.font16SemiBold.copyWith(
                  color: MyColors.navyColor,
                ),
              ),
              SizedBox(height: 22),
              Text(
                'Resend Code',
                style: MyFontStyle.font16SemiBold.copyWith(
                  color: MyColors.navyColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
