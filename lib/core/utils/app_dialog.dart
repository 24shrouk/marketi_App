import 'package:flutter/material.dart';
import 'package:marketi/core/utils/My_font_style.dart';
import 'package:marketi/core/utils/my_colors.dart';

abstract class AppDialog {
  static void showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Stack(
        alignment: Alignment.center,
        children: [
          const ModalBarrier(
            dismissible: false,
            color: Color.fromARGB(134, 249, 248, 248),
          ),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }

  static void showErrorDialog(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Title Error ",
          style: MyFontStyle.font16SemiBold.copyWith(
            color: MyColors.darkRed500Color,
          ),
        ),
        content: Text(
          error,
          style: MyFontStyle.font16Regular.copyWith(color: MyColors.navyColor),
        ),
      ),
    );
  }
}
