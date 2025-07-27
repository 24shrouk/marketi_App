import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi/core/constants/assets_constant.dart';
import 'package:marketi/core/utils/My_font_style.dart';
import 'package:marketi/core/utils/my_colors.dart';

class ProductItemHome extends StatelessWidget {
  const ProductItemHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 150,
      padding: EdgeInsets.symmetric(horizontal: 4),
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 0.5,
            spreadRadius: 0.5,
            offset: Offset(0.2, 1),
            color: MyColors.lightBlue900Color,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // CachedNetworkImage(imageUrl: imageUrl),
              Image.asset(AssetsConstant.testImage, fit: BoxFit.cover),
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: MyColors.darkBlue900Color,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            spacing: 4,
            children: [
              Text(
                "499 LE",
                style: MyFontStyle.font12Meduim.copyWith(
                  color: MyColors.darkBlue900Color,
                ),
              ),
              Spacer(),
              SvgPicture.asset(AssetsConstant.ratingIcon),

              Text(
                '4.9',
                style: MyFontStyle.font12Meduim.copyWith(
                  color: MyColors.darkBlue900Color,
                ),
              ),
            ],
          ),
          Text(
            'Smart Watch',
            style: MyFontStyle.font12Meduim.copyWith(
              color: MyColors.darkBlue900Color,
            ),
          ),
        ],
      ),
    );
  }
}
