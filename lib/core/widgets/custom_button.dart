import 'package:flutter/material.dart';
import 'package:marketi/core/utils/My_font_style.dart';
import 'package:marketi/core/utils/my_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.outSidePadding = const EdgeInsets.all(0),
    this.inSidePadding = const EdgeInsets.all(0),
    this.alignment = Alignment.center,
    this.raduis = 10,
    this.width,
  });
  final void Function() onPressed;
  final String text;
  final EdgeInsetsGeometry outSidePadding;
  final EdgeInsetsGeometry inSidePadding;
  final AlignmentGeometry alignment;
  final double raduis;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outSidePadding,
      child: Align(
        alignment: alignment,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            minimumSize: width != null ? Size(width!, 48) : null,
            padding: inSidePadding,
            backgroundColor: MyColors.lightBlue100Color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(raduis),
            ),
          ),
          child: Text(
            text,
            style: MyFontStyle.font18Meduim.copyWith(
              color: MyColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
