import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi/core/utils/my_colors.dart';

class PlateFormContainer extends StatelessWidget {
  const PlateFormContainer({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: MyColors.whiteColor,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: MyColors.lightBlue700Color),
      ),
      child: SvgPicture.asset(image, width: 40, height: 40),
    );
  }
}
