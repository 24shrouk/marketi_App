import 'package:flutter/material.dart';
import 'package:marketi/core/utils/my_colors.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        color: MyColors.whiteColor,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: MyColors.lightBlue700Color),
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: MyColors.darkBlue900Color,
          size: 30,
        ),
      ),
    );
  }
}
