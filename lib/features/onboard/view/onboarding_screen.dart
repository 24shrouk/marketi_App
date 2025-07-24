import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:marketi/core/constants/assets_constant.dart';
import 'package:marketi/core/utils/My_font_style.dart';
import 'package:marketi/core/utils/my_colors.dart';
import 'package:marketi/core/widgets/custom_button.dart';
import 'package:marketi/features/home/views/home_screen.dart';
import 'package:marketi/features/onboard/model/onboarding_model.dart';
import 'package:marketi/features/onboard/widgets/custom_animated_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  static const String routeName = 'OnBoardingScreen';
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnBoardingModel> onboardingList = [
    OnBoardingModel(
      image: AssetsConstant.onBoardingFirstImage,
      title: 'Welcom to Marketi',
      description:
          'Discover a world of endless possibilities and shop from the comfort of your fingertips Browse through a wide range of products, from fashion and electronics to home.',
    ),
    OnBoardingModel(
      image: AssetsConstant.onBoardingSecondImage,
      title: 'Easy to Buy',
      description:
          'Find the perfect item that suits your style and needs With secure payment options and fast delivery, shopping has never been easier.',
    ),
    OnBoardingModel(
      image: AssetsConstant.onBoardingThirdImage,
      title: 'Wonderful User Experience',
      description:
          'Start exploring now and experience the convenience of online shopping at its best.',
    ),
  ];
  final PageController controller = PageController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.whiteColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 260,
              child: PageView.builder(
                controller: controller,
                itemCount: onboardingList.length,
                onPageChanged: (value) {
                  index = value;
                  setState(() {});
                },
                itemBuilder: (context, index) {
                  return CustomAnimatedWidget(
                    index: index,
                    delay: index,
                    child: Image.asset(onboardingList[index].image),
                  );
                },
              ),
            ),
            SizedBox(height: 40),
            SmoothPageIndicator(
              controller: controller,
              count: onboardingList.length,
              effect: ScaleEffect(
                spacing: 20.0,
                radius: 15.0,
                dotWidth: 12.0,
                dotHeight: 12.0,
                strokeWidth: 1.5,
                activeDotColor: MyColors.darkBlue900Color,
                dotColor: MyColors.lightBlue700Color,
              ),
            ),
            SizedBox(height: 24),
            CustomAnimatedWidget(
              index: index,
              delay: (index + 1) * 100,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      onboardingList[index].title,
                      style: MyFontStyle.font20SemiBold.copyWith(
                        color: MyColors.darkBlue900Color,
                      ),
                    ),
                    SizedBox(height: 34),
                    Text(
                      onboardingList[index].description,

                      textAlign: TextAlign.center,
                      style: MyFontStyle.font12Meduim.copyWith(
                        color: MyColors.darkBlue900Color,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    SizedBox(height: 80),
                    CustomButton(
                      onPressed: () {
                        if (index < onboardingList.length - 1) {
                          controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        } else {
                          Navigator.pushReplacementNamed(
                            context,
                            HomeScreen.routeName,
                          );
                        }
                      },
                      text: index < onboardingList.length - 1
                          ? 'Next'
                          : 'Get Start',
                      width: double.infinity,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
