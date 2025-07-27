import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi/core/constants/assets_constant.dart';
import 'package:marketi/core/utils/My_font_style.dart';
import 'package:marketi/core/utils/my_colors.dart';
import 'package:marketi/core/widgets/brand_item.dart';
import 'package:marketi/core/widgets/category_item_widget.dart';
import 'package:marketi/core/widgets/custom_textbox.dart';
import 'package:marketi/core/widgets/product_item_add_widget.dart';
import 'package:marketi/core/widgets/product_item_home_widget.dart';
import 'package:marketi/features/home/views/all_brands.dart';
import 'package:marketi/features/home/views/all_categories_screen.dart';
import 'package:marketi/features/home/views/best_for_you.dart';
import 'package:marketi/features/home/views/buy_again.dart';
import 'package:marketi/features/home/views/popular_product.dart';
import 'package:marketi/features/home/widgets/row_types_of_product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.whiteColor,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: MyColors.whiteColor,
          leading: Container(
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

          title: Text(
            "Hi Shrouk !",
            style: MyFontStyle.font20Meduim.copyWith(
              color: MyColors.darkBlue900Color,
            ),
          ),

          actions: [
            Icon(
              Icons.notifications_on_outlined,
              color: MyColors.lightBlue100Color,
            ),
          ],
          actionsPadding: EdgeInsets.only(right: 16),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
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
                SizedBox(height: 14),
                Image.asset(AssetsConstant.offerImage),
                SizedBox(height: 14),
                RowTypesOfProducts(
                  text: 'Popular Product',
                  onPressed: () {
                    Navigator.pushNamed(context, PopularProduct.routeName);
                  },
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 160,
                  child: ListView.builder(
                    itemBuilder: (context, index) => ProductItemHome(),
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                RowTypesOfProducts(
                  text: 'Category',
                  onPressed: () {
                    Navigator.pushNamed(context, AllCategoriesScreen.routeName);
                  },
                ),
                Wrap(
                  spacing: 5,
                  children: [
                    CategoryItemWidget(),
                    CategoryItemWidget(),
                    CategoryItemWidget(),
                    CategoryItemWidget(),
                    CategoryItemWidget(),
                    CategoryItemWidget(),
                  ],
                ),
                RowTypesOfProducts(
                  text: 'Best for You',
                  onPressed: () {
                    Navigator.pushNamed(context, BestForYou.routeName);
                  },
                ),

                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemBuilder: (context, index) => ProductItemAdd(),
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                RowTypesOfProducts(
                  text: 'Brands',
                  onPressed: () {
                    Navigator.pushNamed(context, AllBrandsScreen.routeName);
                  },
                ),
                Wrap(
                  runSpacing: 5,
                  spacing: 10,
                  children: [
                    BrandItemWidget(),
                    BrandItemWidget(),
                    BrandItemWidget(),
                  ],
                ),
                RowTypesOfProducts(
                  text: 'Buy Again',
                  onPressed: () {
                    Navigator.pushNamed(context, BuyAgain.routeName);
                  },
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemBuilder: (context, index) => ProductItemAdd(),
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
