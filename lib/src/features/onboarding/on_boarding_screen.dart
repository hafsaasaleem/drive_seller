import 'package:dots_indicator/dots_indicator.dart';
import 'package:drive_seller/src/common_widgets/common_text.dart';
import 'package:drive_seller/src/constants/app_colors.dart';
import 'package:drive_seller/src/constants/app_sizes.dart';
import 'package:drive_seller/src/features/loading/loading_screen.dart';
import 'package:drive_seller/src/features/onboarding/model/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnBoarding> onBoardingList = onboarding;
  late final PageController _pageController;
  late final ScrollController _controller;
  @override
  void initState() {
    _pageController = PageController();
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        itemCount: onBoardingList.length,
        itemBuilder: (context, index) {
          final boardingText = onBoardingList[index];
          return SingleChildScrollView(
            controller: _controller,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  gapH28,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.ease,
                          );
                        },
                        child: Icon(index > 0 ? Icons.arrow_back : null),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoadingScreen(),
                            ),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 44.h,
                          width: 81.w,
                          decoration: BoxDecoration(
                            color: AppColors.greyButton,
                            borderRadius: BorderRadius.circular(31),
                          ),
                          child: const CommonText(
                            text: 'Skip',
                            fontSize: 14,
                            color: AppColors.greyText,
                          ),
                        ),
                      ),
                    ],
                  ),
                  gapH32,
                  Image.asset(
                    boardingText.image,
                    height: 275.h,
                    width: 335.w,
                  ),
                  gapH24,
                  Align(
                    alignment: Alignment.center,
                    child: DotsIndicator(
                      dotsCount: 3,
                      position: index,
                      decorator: DotsDecorator(
                        activeColor: AppColors.blackText,
                        color: AppColors.greyDark,
                        size: const Size.square(8),
                        activeSize: const Size(12, 7),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                  gapH48,
                  CommonText(
                    text: boardingText.title,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  gapH20,
                  SizedBox(
                    height: 72.h,
                    width: 311.w,
                    child: CommonText(
                      text: boardingText.description,
                      color: AppColors.greyText,
                      height: 1.3,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  gapH32,
                  ElevatedButton(
                    onPressed: () {
                      if (index < onBoardingList.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.ease,
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoadingScreen(),
                          ),
                        );
                      }
                    },
                    child: CommonText(
                      text: index < 2 ? 'Next' : 'Start Now',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
