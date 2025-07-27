import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/constants/assets_constant.dart';
import 'package:marketi/core/utils/My_font_style.dart';
import 'package:marketi/core/utils/my_colors.dart';
import 'package:marketi/core/widgets/custom_button.dart';
import 'package:marketi/features/auth/view/login_screen.dart';
import 'package:marketi/features/auth/view_model/login_cubit/login_cubit.dart';
import 'package:marketi/features/auth/widgets/appbar_container_widget.dart';

class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({super.key});
  static const String routeName = 'CongratulationsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarContainer(),
        backgroundColor: MyColors.whiteColor,
      ),
      backgroundColor: MyColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsConstant.congratulations),
            SizedBox(height: 22),
            Text(
              'Congratulations',
              style: MyFontStyle.font20SemiBold.copyWith(
                color: MyColors.darkBlue900Color,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'You have updated the password. please\n  login again with your latest password',

              textAlign: TextAlign.center,
              style: MyFontStyle.font12Meduim.copyWith(
                color: MyColors.darkBlue900Color,
                overflow: TextOverflow.fade,
              ),
            ),
            SizedBox(height: 30),
            CustomButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => LoginCubit(),
                      child: LoginScreen(),
                    ),
                  ),
                );
              },
              text: "Log In",
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
