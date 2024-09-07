import 'package:connectme/core/constants/boarding_data.dart';
import 'package:connectme/core/router/path.dart';
import 'package:connectme/core/styles/color.dart';
import 'package:connectme/core/styles/text.dart';
import 'package:connectme/presentation/widgets/page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  int currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 60.h,
          left: 24.w,
          right: 24.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SkipButton(
              currentIndex: currentIndex,
              onSkip: () {
                _pageController.animateToPage(
                  boardingData.length - 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              },
            ),
            SizedBox(height: 180.h),
            Expanded(
              child: BoardingContent(
                pageController: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PageIndicator(
                  currentIndex: currentIndex,
                  length: boardingData.length,
                ),
                NextButton(
                  currentIndex: currentIndex,
                  onNext: () {
                    if (currentIndex < boardingData.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    } else {
                      context.go(RoutePath.loginPage);
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

class SkipButton extends StatelessWidget {
  final int currentIndex;
  final VoidCallback onSkip;

  const SkipButton(
      {super.key, required this.currentIndex, required this.onSkip});

  @override
  Widget build(BuildContext context) {
    if (currentIndex < boardingData.length - 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: onSkip,
            child: Text(
              'Lewati',
              style: TextStyles.button1(
                  weight: FontWeightOption.semiBold,
                  color: ColorStyles.primary500),
            ),
          ),
        ],
      );
    } else {
      return Text(
        'Lewati',
        style: TextStyles.button1(color: Colors.transparent),
      );
    }
  }
}

class BoardingContent extends StatelessWidget {
  final PageController pageController;
  final Function(int) onPageChanged;

  const BoardingContent(
      {super.key, required this.pageController, required this.onPageChanged});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: boardingData.length,
      controller: pageController,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        final data = boardingData[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 240.h,
              child: SvgPicture.asset(data["image"]!),
            ),
            SizedBox(height: 80.h),
            Text(
              data["title"]!,
              style: TextStyles.heading2(),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 8.h),
            Text(
              data["content"]!,
              style: TextStyles.body2(weight: FontWeightOption.regular),
              textAlign: TextAlign.left,
            ),
          ],
        );
      },
    );
  }
}

class NextButton extends StatelessWidget {
  final int currentIndex;
  final VoidCallback onNext;

  const NextButton(
      {super.key, required this.currentIndex, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onNext,
      child: Container(
        width: 48.w,
        height: 48.h,
        decoration: const BoxDecoration(
          color: ColorStyles.primary500,
          shape: BoxShape.circle,
        ),
        child: UnconstrainedBox(
          child: SvgPicture.asset(
            'assets/icons/caret-right.svg',
          ),
        ),
      ),
    );
  }
}
