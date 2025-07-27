import 'package:flutter/material.dart';
import 'package:marketi/core/constants/assets_constant.dart';
import 'package:marketi/core/utils/my_colors.dart';

class BrandItemWidget extends StatelessWidget {
  const BrandItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: MyColors.lightBlue100Color, width: 0.4),
      ),
      child: Image.asset(AssetsConstant.electronucsImage),
    );
  }
}
