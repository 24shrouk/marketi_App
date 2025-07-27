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
import 'package:marketi/features/auth/view/create_new_password_screen.dart';
import 'package:marketi/features/auth/view_model/active_reset_password_cubit/active_reset_password_cubit.dart';
import 'package:marketi/features/auth/view_model/reset_password_cubit/reset_password_cubit.dart';
import 'package:marketi/features/auth/widgets/appbar_container_widget.dart';
import 'package:pinput/pinput.dart';
import 'package:toastification/toastification.dart';

class VerivicationCodeWithEmailScreen extends StatefulWidget {
  const VerivicationCodeWithEmailScreen({super.key, required this.email});
  static const String routeName = 'VerivicationCodeWithEmailScreen';
  final String email;

  @override
  State<VerivicationCodeWithEmailScreen> createState() =>
      _VerivicationCodeWithEmailScreenState();
}

class _VerivicationCodeWithEmailScreenState
    extends State<VerivicationCodeWithEmailScreen> {
  TextEditingController code = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
    return BlocListener<ActiveResetPasswordCubit, ActiveResetPasswordState>(
      listener: (context, state) {
        if (state is ActiveResetPasswordLoading) {
          AppDialog.showLoading(context);
        }
        if (state is ActiveResetPasswordError) {
          Navigator.pop(context);
          AppToast.showToast(
            context: context,
            title: "Error",
            description: state.message,
            type: ToastificationType.error,
          );
        }
        if (state is ActiveResetPasswordSuccess) {
          Navigator.pop(context);
          AppToast.showToast(
            context: context,
            title: "Successs",
            description: "code is correct",
            type: ToastificationType.success,
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => ResetPasswordCubit(),
                child: CreateNewPasswordScreen(email: widget.email),
              ),
            ),
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
              'Verification Code',
              style: MyFontStyle.font16Meduim.copyWith(
                color: MyColors.navyColor,
              ),
            ),
            leading: AppBarContainer(),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(AssetsConstant.validationCodeWithEmail),
                  SizedBox(height: 22),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Please enter the 6 digit code\n   sent to:',
                        ),
                        TextSpan(
                          text: widget.email,
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
                    length: 6,
                    validator: Validator.validateCode,
                    controller: code,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                  ),
                  SizedBox(height: 22),
                  CustomButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context
                            .read<ActiveResetPasswordCubit>()
                            .activeResetPassword(widget.email, code.text);

                        log(widget.email);
                        log(code.text);
                      }
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
        ),
      ),
    );
  }
}
