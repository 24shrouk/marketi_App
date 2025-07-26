import 'package:flutter/material.dart';
import 'package:marketi/core/constants/assets_constant.dart';
import 'package:marketi/core/utils/My_font_style.dart';
import 'package:marketi/core/utils/my_colors.dart';
import 'package:marketi/core/utils/validator.dart';
import 'package:marketi/core/widgets/custom_button.dart';
import 'package:marketi/core/widgets/custom_textbox.dart';
import 'package:marketi/features/auth/view/congratolation_screen.dart';
import 'package:marketi/features/auth/view/verivication_code_with_email.dart';
import 'package:marketi/features/auth/widgets/appbar_container_widget.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});
  static const String routeName = 'CreateNewPasswordScreen';

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: MyColors.whiteColor,
        title: Text(
          'Create New Password',
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
              Image.asset(AssetsConstant.createNewPassword),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  '    New password must be\n different from last password',
                  style: MyFontStyle.font16Meduim.copyWith(
                    color: MyColors.navyColor,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Password',
                  style: MyFontStyle.font12Meduim.copyWith(
                    color: MyColors.darkBlue900Color,
                  ),
                ),
              ),
              CustomTextFormFeild(
                keyboardType: TextInputType.visiblePassword,
                validator: Validator.validatePassword,
                obscurText: !isPasswordVisible,
                hint: 'Enter your password',
                hintStyle: MyFontStyle.font12Regular.copyWith(
                  color: MyColors.hintColor,
                ),
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  color: MyColors.darkBlue900Color,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: MyColors.darkBlue900Color,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
              ),

              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Confirm Password',
                  style: MyFontStyle.font12Meduim.copyWith(
                    color: MyColors.darkBlue900Color,
                  ),
                ),
              ),
              CustomTextFormFeild(
                // validator: Validator.validateConfirmPassword(),
                keyboardType: TextInputType.visiblePassword,
                obscurText: !isConfirmPasswordVisible,
                hint: 'confirm password',
                hintStyle: MyFontStyle.font12Regular.copyWith(
                  color: MyColors.hintColor,
                ),
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  color: MyColors.darkBlue900Color,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    isConfirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: MyColors.darkBlue900Color,
                  ),
                  onPressed: () {
                    setState(() {
                      isConfirmPasswordVisible = !isConfirmPasswordVisible;
                    });
                  },
                ),
              ),
              SizedBox(height: 34),
              CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, CongratulationsScreen.routeName);
                },
                text: "Save Password",
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
