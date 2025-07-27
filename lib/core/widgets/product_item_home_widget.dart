import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi/core/constants/assets_constant.dart';
import 'package:marketi/core/utils/My_font_style.dart';
import 'package:marketi/core/utils/my_colors.dart';
import 'package:marketi/features/home/model/response/get_products.dart';

// class ProductItemHome extends StatelessWidget {
//   const ProductItemHome({super.key, required this.product});
//   final ProductItem product;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 160,

//       padding: EdgeInsets.symmetric(horizontal: 4),
//       margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             blurRadius: 0.5,
//             spreadRadius: 0.5,
//             offset: Offset(0.2, 1),
//             color: MyColors.lightBlue900Color,
//           ),
//         ],
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: CachedNetworkImage(
//                   imageUrl:
//                       product.images?[0] ??
//                       "http://via.placeholder.com/350x150",
//                   placeholder: (context, url) => const SizedBox(
//                     height: 100,
//                     child: Center(child: CircularProgressIndicator()),
//                   ),
//                   errorWidget: (context, url, error) =>
//                       const Icon(Icons.error),
//                   fit: BoxFit.cover,
//                   width: double.infinity,
//                   height: 100,
//                 ),
//               ),
//               // CachedNetworkImage(imageUrl: imageUrl),
//               // CachedNetworkImage(
//               //   imageUrl:
//               //       product.images?[0] ?? "http://via.placeholder.com/350x150",
//               //   placeholder: (context, url) => CircularProgressIndicator(),
//               //   errorWidget: (context, url, error) => Icon(Icons.error),
//               //   fit: BoxFit.cover,
//               //   width: double.infinity,
//               //   height: 240,
//               // ),
//               //Image.asset(AssetsConstant.testImage, fit: BoxFit.cover),
//               Positioned(
//                 top: 6,
//                 right: 6,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(13),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(2.0),
//                     child: Icon(
//                       Icons.favorite_border_outlined,
//                       color: MyColors.darkBlue900Color,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           // Row(
//           //   spacing: 4,
//           //   children: [
//           //     Text(
//           //       "${product.price}LE",
//           //       style: MyFontStyle.font12Meduim.copyWith(
//           //         color: MyColors.darkBlue900Color,
//           //       ),
//           //     ),
//           //     Spacer(),
//           //     SvgPicture.asset(
//           //       AssetsConstant.ratingIcon,
//           //       width: 14,
//           //       height: 14,
//           //     ),

//           //     Text(
//           //       product.rating.toString(),
//           //       style: MyFontStyle.font12Meduim.copyWith(
//           //         color: MyColors.darkBlue900Color,
//           //       ),
//           //     ),
//           //   ],
//           // ),
//           Row(
//             children: [
//               Text(
//                 "${product.price} LE",
//                 style: MyFontStyle.font12Meduim.copyWith(
//                   color: MyColors.darkBlue900Color,
//                 ),
//               ),
//               const Spacer(),
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   SvgPicture.asset(
//                     AssetsConstant.ratingIcon,
//                     width: 14,
//                     height: 14,
//                   ),
//                   const SizedBox(width: 4),
//                   Text(
//                     product.rating.toString(),
//                     style: MyFontStyle.font12Meduim.copyWith(
//                       color: MyColors.darkBlue900Color,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),

//           Text(
//             product.title ?? "Undifined Item",
//             style: MyFontStyle.font12Meduim.copyWith(
//               color: MyColors.darkBlue900Color,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class ProductItemHome extends StatelessWidget {
  const ProductItemHome({super.key, required this.product});
  final ProductItem product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 210, // ✅ حددي ارتفاع ثابت مناسب
      padding: const EdgeInsets.symmetric(horizontal: 4),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl:
                      product.images?[0] ??
                      "http://via.placeholder.com/350x150",
                  placeholder: (context, url) => const SizedBox(
                    height: 100,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 100,
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Icon(Icons.favorite_border_outlined),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // ✅ استخدمي بدل Spacer
            children: [
              Text(
                "${product.price} LE",
                style: MyFontStyle.font12Meduim.copyWith(
                  color: MyColors.darkBlue900Color,
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AssetsConstant.ratingIcon,
                      width: 14,
                      height: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      product.rating?.toStringAsFixed(1) ?? '0.0',
                      style: MyFontStyle.font12Meduim.copyWith(
                        color: MyColors.darkBlue900Color,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            product.title ?? "Undefined Item",
            maxLines: 1,
            overflow: TextOverflow.ellipsis, // ✅ تمنعي الكسر
            style: MyFontStyle.font12Meduim.copyWith(
              color: MyColors.darkBlue900Color,
            ),
          ),
        ],
      ),
    );
  }
}
