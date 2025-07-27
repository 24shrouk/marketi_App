import 'package:flutter/material.dart';
import 'package:marketi/core/utils/My_font_style.dart';
import 'package:marketi/core/utils/my_colors.dart';

class RowTypesOfProducts extends StatelessWidget {
  const RowTypesOfProducts({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: MyFontStyle.font20SemiBold.copyWith(
            color: MyColors.darkBlue900Color,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            "View all",
            style: MyFontStyle.font16Meduim.copyWith(
              color: MyColors.lightBlue100Color,
            ),
          ),
        ),
      ],
    );
  }
}
