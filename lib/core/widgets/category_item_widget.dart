import 'package:flutter/material.dart';
import 'package:marketi/core/constants/assets_constant.dart';
import 'package:marketi/core/utils/My_font_style.dart';
import 'package:marketi/core/utils/my_colors.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AssetsConstant.electronucsImage), //هنحولها cached network
        Text(
          "Electronics",
          style: MyFontStyle.font16Meduim.copyWith(
            color: MyColors.darkBlue900Color,
          ),
        ),
      ],
    );
  }
}
