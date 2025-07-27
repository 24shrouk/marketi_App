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
import 'package:marketi/features/auth/view/forget_password_with_email_screen.dart';
import 'package:marketi/features/auth/view/register_screen.dart';
import 'package:marketi/features/auth/view_model/login_cubit/login_cubit.dart';
import 'package:marketi/features/auth/view_model/register_cubit/register_cubit.dart';
import 'package:marketi/features/auth/view_model/send_password_email_cubit/send_password_email_cubit.dart';
import 'package:marketi/features/auth/widgets/plateform_container.dart';
import 'package:marketi/features/home/views/home_screen.dart';
import 'package:toastification/toastification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = false;
  bool isChecked = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            AppDialog.showLoading(context);
          }
          if (state is LoginError) {
            Navigator.pop(context);
            AppToast.showToast(
              context: context,
              title: "Error",
              description: state.message,
              type: ToastificationType.error,
            );
          }
          if (state is LoginSuccess) {
            Navigator.pop(context);
            AppToast.showToast(
              context: context,
              title: "Successs",
              description: "Login done successfully",
              type: ToastificationType.success,
            );
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          }
        },
        child: Scaffold(
          backgroundColor: MyColors.whiteColor,
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                children: [
                  Expanded(child: Image.asset(AssetsConstant.splashLogo)),

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
                  SizedBox(height: 14),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Checkbox(
                        side: BorderSide(color: MyColors.lightBlue100Color),
                        checkColor: MyColors.whiteColor,
                        activeColor: MyColors.lightBlue100Color,
                        value: isChecked,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                        onChanged: (bool? newValue) {
                          setState(() {
                            isChecked = newValue!;
                          });
                        },
                      ),
                      Text(
                        "Remember me",
                        style: MyFontStyle.font12Regular.copyWith(
                          color: MyColors.navyColor,
                        ),
                      ),
                      // const SizedBox(width: 170),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) => SendPasswordEmailCubit(),
                                child: ForgetPasswordWithEmailScreen(),
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Forget password ?",
                          style: MyFontStyle.font12Meduim.copyWith(
                            color: MyColors.lightBlue100Color,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await context.read<LoginCubit>().login(
                          email.text,
                          password.text,
                        );
                        log(email.text);
                        log(password.text);
                      }
                    },
                    text: "Log In",
                    width: double.infinity,
                  ),
                  SizedBox(height: 14),
                  Text(
                    'Or Continue With',
                    style: MyFontStyle.font12Regular.copyWith(
                      color: MyColors.navyColor,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    spacing: 16,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PlateFormContainer(image: AssetsConstant.googleIcon),
                      PlateFormContainer(image: AssetsConstant.appleIcon),
                      PlateFormContainer(image: AssetsConstant.facebookIcon),
                    ],
                  ),
                  SizedBox(height: 14),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => RegisterCubit(),
                            child: RegisterScreen(),
                          ),
                        ),
                      );
                    },
                    child: Text.rich(
                      TextSpan(
                        text: "Are you new in Marketi",
                        style: MyFontStyle.font12Regular.copyWith(
                          color: MyColors.navyColor,
                        ),
                        children: [
                          TextSpan(
                            text: " register?",
                            style: MyFontStyle.font12Meduim.copyWith(
                              color: MyColors.lightBlue100Color,
                            ),
                          ),
                        ],
                      ),
                    ),
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
