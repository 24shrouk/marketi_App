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
import 'package:marketi/features/auth/view/verivication_code_with_email.dart';
import 'package:marketi/features/auth/view_model/active_reset_password_cubit/active_reset_password_cubit.dart';
import 'package:marketi/features/auth/view_model/send_password_email_cubit/send_password_email_cubit.dart';
import 'package:marketi/features/auth/widgets/appbar_container_widget.dart';
import 'package:toastification/toastification.dart';

class ForgetPasswordWithEmailScreen extends StatefulWidget {
  const ForgetPasswordWithEmailScreen({super.key});
  static const String routeName = 'ForgetPasswordWithEmailScreen';

  @override
  State<ForgetPasswordWithEmailScreen> createState() =>
      _ForgetPasswordWithEmailScreenState();
}

class _ForgetPasswordWithEmailScreenState
    extends State<ForgetPasswordWithEmailScreen> {
  TextEditingController email = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<SendPasswordEmailCubit, SendPasswordEmailState>(
      listener: (context, state) {
        if (state is SendPasswordEmailLoading) {
          AppDialog.showLoading(context);
        }
        if (state is SendPasswordEmailError) {
          Navigator.pop(context);
          AppToast.showToast(
            context: context,
            title: "Error",
            description: state.message,
            type: ToastificationType.error,
          );
        }
        if (state is SendPasswordEmailSuccess) {
          Navigator.pop(context);
          AppToast.showToast(
            context: context,
            title: "Successs",
            description: "Email Send done successfully",
            type: ToastificationType.success,
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => ActiveResetPasswordCubit(),
                child: VerivicationCodeWithEmailScreen(email: email.text),
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
              'Forgot Password',
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
                  Image.asset(AssetsConstant.forgotPasswordWithEmailImage),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Please enter your email address to\n        receive a verification code',
                      style: MyFontStyle.font16Meduim.copyWith(
                        color: MyColors.navyColor,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Email',
                      style: MyFontStyle.font12Meduim.copyWith(
                        color: MyColors.darkBlue900Color,
                      ),
                    ),
                  ),
                  CustomTextFormFeild(
                    controller: email,
                    validator: Validator.validateEmail,
                    keyboardType: TextInputType.emailAddress,
                    hint: 'You@gmail.com',
                    hintStyle: MyFontStyle.font12Regular.copyWith(
                      color: MyColors.hintColor,
                    ),
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: MyColors.darkBlue900Color,
                    ),
                  ),
                  SizedBox(height: 34),
                  CustomButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context
                            .read<SendPasswordEmailCubit>()
                            .sendPasswordEmail(email.text);
                      }
                    },
                    text: "Send Code",
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
