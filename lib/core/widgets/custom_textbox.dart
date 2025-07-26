import 'package:flutter/material.dart';
import 'package:marketi/core/utils/my_colors.dart';

class CustomTextFormFeild extends StatelessWidget {
  CustomTextFormFeild({
    super.key,
    this.hint,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.obscurText = false,
    this.controller,
    this.validator,
    this.hintStyle,
    this.keyboardType,
  });

  final String? hint;
  final int? maxLines;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  bool obscurText;
  TextEditingController? controller;
  String? Function(String?)? validator;
  TextStyle? hintStyle;
  TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      maxLines: maxLines,
      minLines: 1,
      obscureText: obscurText,
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      onSaved: onSaved,

      cursorColor: MyColors.greyColor,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: hintStyle ?? const TextStyle(color: MyColors.greyColor),
        border: buildBorder(),
        enabledBorder: buildBorder(enabledBorderColor),
        focusedBorder: buildBorder(focusedBorderColor),
        errorBorder: buildBorder(MyColors.darkRed200Color),
        focusedErrorBorder: buildBorder(MyColors.darkRed200Color),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color ?? MyColors.lightBlue700Color),
    );
  }
}
