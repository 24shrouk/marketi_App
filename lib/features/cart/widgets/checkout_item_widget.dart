import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi/core/constants/assets_constant.dart';
import 'package:marketi/core/utils/My_font_style.dart';
import 'package:marketi/core/utils/my_colors.dart';

class CheckoutItmeWidget extends StatefulWidget {
  const CheckoutItmeWidget({super.key});

  @override
  State<CheckoutItmeWidget> createState() => _CheckoutItmeWidgetState();
}

class _CheckoutItmeWidgetState extends State<CheckoutItmeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            spreadRadius: 1,
            offset: Offset(0, 0),
            color: MyColors.lightBlue900Color,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(AssetsConstant.testImage),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pampers Swaddlers',
                        style: MyFontStyle.font12Meduim.copyWith(
                          color: MyColors.darkBlue900Color,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.only(right: 4),
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border_outlined,
                          color: MyColors.darkBlue900Color,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '84 Diapers',
                    style: MyFontStyle.font12Meduim.copyWith(
                      color: MyColors.greyScaleColor,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Row(
                    children: [
                      Text(
                        'Price: 345,00 EGP',
                        style: MyFontStyle.font12Meduim.copyWith(
                          color: MyColors.darkBlue900Color,
                        ),
                      ),
                      Spacer(),
                      SvgPicture.asset(AssetsConstant.ratingIcon),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0, left: 4),
                        child: Text(
                          '4.9',
                          style: MyFontStyle.font12Meduim.copyWith(
                            color: MyColors.darkBlue900Color,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(top: 6, right: 8, bottom: 8),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: MyColors.lightBlue900Color,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: SvgPicture.asset(AssetsConstant.deleteIcon),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: MyColors.lightBlue900Color,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Text(
                            '1',
                            style: MyFontStyle.font16Meduim.copyWith(
                              color: MyColors.lightBlue100Color,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: MyColors.lightBlue900Color,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: SvgPicture.asset(AssetsConstant.plus),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
