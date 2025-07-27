import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi/core/constants/assets_constant.dart';
import 'package:marketi/core/utils/My_font_style.dart';
import 'package:marketi/core/utils/my_colors.dart';
import 'package:marketi/core/widgets/custom_textbox.dart';
import 'package:marketi/core/widgets/product_item_add_widget.dart';
import 'package:marketi/features/auth/widgets/appbar_container_widget.dart';

class BestForYou extends StatefulWidget {
  const BestForYou({super.key});
  static const String routeName = 'BestForYou';

  @override
  State<BestForYou> createState() => _BestForYouState();
}

class _BestForYouState extends State<BestForYou> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: MyColors.whiteColor,
        leading: AppBarContainer(),
        centerTitle: true,
        title: Text(
          "Best for You",
          style: MyFontStyle.font20Meduim.copyWith(
            color: MyColors.darkBlue900Color,
          ),
        ),

        actions: [
          Container(
            margin: EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: MyColors.lightBlue100Color, width: 2),
            ),
            padding: const EdgeInsets.all(4),
            child: const Icon(
              Icons.person,
              size: 16,
              color: MyColors.navyColor,
            ),
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 16),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 14,
          children: [
            CustomTextFormFeild(
              border: 14,
              prefixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search_outlined,
                  size: 30,
                  color: MyColors.darkBlue900Color,
                ),
              ),
              hint: 'What are you looking for ?',
              hintStyle: MyFontStyle.font16Regular.copyWith(
                color: MyColors.hintColor,
              ),
              suffixIcon: GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    AssetsConstant.suffixSearchIcon,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ),

            Text(
              'All Products',
              style: MyFontStyle.font20SemiBold.copyWith(
                color: MyColors.darkBlue900Color,
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,

                  mainAxisSpacing: 5,
                  childAspectRatio: 164 / 176,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SizedBox(height: 300, child: ProductItemAdd());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
