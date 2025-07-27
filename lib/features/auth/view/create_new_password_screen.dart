import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/constants/assets_constant.dart';
import 'package:marketi/core/utils/My_font_style.dart';
import 'package:marketi/core/utils/app_dialog.dart';
import 'package:marketi/core/utils/app_toast.dart';
import 'package:marketi/core/utils/my_colors.dart';
import 'package:marketi/core/utils/validator.dart';
import 'package:marketi/core/widgets/custom_button.dart';
import 'package:marketi/core/widgets/custom_textbox.dart';
import 'package:marketi/features/auth/view/congratolation_screen.dart';
import 'package:marketi/features/auth/view_model/reset_password_cubit/reset_password_cubit.dart';
import 'package:marketi/features/auth/widgets/appbar_container_widget.dart';
import 'package:toastification/toastification.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key, required this.email});
  static const String routeName = 'CreateNewPasswordScreen';
  final String email;

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordLoading) {
          AppDialog.showLoading(context);
        }
        if (state is ResetPasswordError) {
          Navigator.pop(context);
          AppToast.showToast(
            context: context,
            title: "Error",
            description: state.message,
            type: ToastificationType.error,
          );
        }
        if (state is ResetPasswordSuccess) {
          Navigator.pop(context);
          AppToast.showToast(
            context: context,
            title: "Successs",
            description: "Password Updated successfully",
            type: ToastificationType.success,
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CongratulationsScreen()),
          );
        }
      },
      child: Form(
        key: formKey,
        child: Scaffold(
          backgroundColor: MyColors.whiteColor,
          appBar: AppBar(
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            backgroundColor: MyColors.whiteColor,
            title: Text(
              'Create New Password',
              style: MyFontStyle.font16Meduim.copyWith(
                color: MyColors.navyColor,
              ),
            ),
            leading: AppBarContainer(),
          ),
          body: Padding(
            padding: EdgeInsets.only(
              top: 16.0,
              bottom: 16,
              left: 16,
              right: 16,
            ),
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
                    controller: password,
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
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
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
                    validator: (value) {
                      return Validator.validateConfirmPassword(
                        value,
                        password.text,
                      );
                    },
                    controller: confirmPassword,
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
                      if (formKey.currentState!.validate()) {
                        context.read<ResetPasswordCubit>().resetPassword(
                          widget.email,
                          password.text,
                          confirmPassword.text,
                        );
                      }
                    },
                    text: "Save Password",
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
