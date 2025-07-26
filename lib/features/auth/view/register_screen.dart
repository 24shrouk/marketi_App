import 'dart:developer';
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
import 'package:marketi/features/auth/view_model/register_cubit/register_cubit.dart';
import 'package:marketi/features/auth/widgets/appbar_container_widget.dart';
import 'package:marketi/features/auth/widgets/plateform_container.dart';
import 'package:toastification/toastification.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = "RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isChecked = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmePassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          AppDialog.showLoading(context);
        }
        if (state is RegisterError) {
          Navigator.pop(context);
          AppToast.showToast(
            context: context,
            title: "Error",
            description: state.message,
            type: ToastificationType.error,
          );
        }
        if (state is RegisterSuccess) {
          Navigator.pop(context);
          AppToast.showToast(
            context: context,
            title: "Successs",
            description: "Register done successfully",
            type: ToastificationType.success,
          );
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: MyColors.whiteColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: false,
              floating: true,
              snap: true,
              backgroundColor: MyColors.whiteColor,
              leading: AppBarContainer(),
            ),
            SliverToBoxAdapter(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Center(
                        child: Image.asset(
                          AssetsConstant.splashLogo,
                          width: 138,
                          height: 105,
                        ),
                      ),
                      Text(
                        'Your Name',
                        style: MyFontStyle.font12Meduim.copyWith(
                          color: MyColors.darkBlue900Color,
                        ),
                      ),
                      CustomTextFormFeild(
                        controller: name,
                        validator: Validator.validateName,
                        keyboardType: TextInputType.name,
                        hint: 'full name',
                        hintStyle: MyFontStyle.font12Regular.copyWith(
                          color: MyColors.hintColor,
                        ),
                        prefixIcon: const Icon(
                          Icons.person_outlined,
                          color: MyColors.darkBlue900Color,
                        ),
                      ),

                      Text(
                        'Username',
                        style: MyFontStyle.font12Meduim.copyWith(
                          color: MyColors.darkBlue900Color,
                        ),
                      ),
                      CustomTextFormFeild(
                        controller: userName,
                        validator: Validator.validateName,
                        keyboardType: TextInputType.name,
                        hint: 'username',
                        hintStyle: MyFontStyle.font12Regular.copyWith(
                          color: MyColors.hintColor,
                        ),
                        prefixIcon: const Icon(
                          Icons.person_outline_outlined,
                          color: MyColors.darkBlue900Color,
                        ),
                      ),

                      Text(
                        'Phone Number',
                        style: MyFontStyle.font12Meduim.copyWith(
                          color: MyColors.darkBlue900Color,
                        ),
                      ),
                      CustomTextFormFeild(
                        controller: phone,
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

                      Text(
                        'Email',
                        style: MyFontStyle.font12Meduim.copyWith(
                          color: MyColors.darkBlue900Color,
                        ),
                      ),
                      CustomTextFormFeild(
                        controller: email,
                        validator: Validator.validateEmail,
                        keyboardType: TextInputType.emailAddress,
                        hint: 'Enter your email',
                        hintStyle: MyFontStyle.font12Regular.copyWith(
                          color: MyColors.hintColor,
                        ),
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: MyColors.darkBlue900Color,
                        ),
                      ),

                      Text(
                        'Password',
                        style: MyFontStyle.font12Meduim.copyWith(
                          color: MyColors.darkBlue900Color,
                        ),
                      ),
                      CustomTextFormFeild(
                        controller: password,
                        validator: Validator.validatePassword,
                        keyboardType: TextInputType.visiblePassword,
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

                      Text(
                        'Confirm Password',
                        style: MyFontStyle.font12Meduim.copyWith(
                          color: MyColors.darkBlue900Color,
                        ),
                      ),
                      CustomTextFormFeild(
                        controller: confirmePassword,
                        validator: (value) {
                          Validator.validateConfirmPassword(
                            value,
                            password.text,
                          );
                        },
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
                              isConfirmPasswordVisible =
                                  !isConfirmPasswordVisible;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      CustomButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await context.read<RegisterCubit>().register(
                              name: name.text,
                              phone: phone.text,
                              email: email.text,
                              password: password.text,
                              confirmPassword: confirmePassword.text,
                            );
                            log(email.text);
                            log(password.text);
                          }
                        },
                        text: "Sign Up",
                        width: double.infinity,
                      ),
                      SizedBox(height: 14),
                      Center(
                        child: Text(
                          'Or Continue With',
                          style: MyFontStyle.font12Regular.copyWith(
                            color: MyColors.navyColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        spacing: 16,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PlateFormContainer(image: AssetsConstant.googleIcon),
                          PlateFormContainer(image: AssetsConstant.appleIcon),
                          PlateFormContainer(
                            image: AssetsConstant.facebookIcon,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
