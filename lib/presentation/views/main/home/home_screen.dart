import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:connectme/core/constants/banner_data.dart';
import 'package:connectme/core/constants/populer_workers_data.dart';
import 'package:connectme/core/constants/servicce_data.dart';
import 'package:connectme/core/router/path.dart';
import 'package:connectme/core/styles/color.dart';
import 'package:connectme/core/styles/shadow.dart';
import 'package:connectme/core/styles/text.dart';
import 'package:connectme/presentation/widgets/page_indicator.dart';
import 'package:connectme/presentation/widgets/text_fields.dart';
import 'package:connectme/presentation/widgets/worker_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  late PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _startAutoScroll();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (currentIndex < bannerData.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      _pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchTukangController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: Container(
                  width: 393.w,
                  height: 244.h,
                  decoration: BoxDecoration(
                    color: ColorStyles.primary500,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24.r),
                      bottomRight: Radius.circular(24.r),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 60.h, left: 24.w, right: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextField(
                          controller: searchTukangController,
                          type: CustomTextFieldType.inputSearch,
                          hintText: 'Cari Tukang',
                          backgroundColor: Colors.white,
                          width: 265.w,
                        ),
                        GestureDetector(
                          onTap: () => context.go(
                            RoutePath.favoritePage,
                          ),
                          child: UnconstrainedBox(
                            child: SvgPicture.asset('assets/icons/love.svg'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => context.go(
                            RoutePath.notificationPage,
                          ),
                          child: UnconstrainedBox(
                            child: SvgPicture.asset('assets/icons/notif.svg'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        UnconstrainedBox(
                          child: SvgPicture.asset(
                              'assets/icons/small-location.svg'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.w, right: 4.w),
                          child: RichText(
                            text: TextSpan(
                              text: 'Lokasi di ',
                              style: TextStyles.body3(
                                color: ColorStyles.white,
                                weight: FontWeightOption.regular,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Malang',
                                  style: TextStyles.body3(
                                    color: ColorStyles.white,
                                    weight: FontWeightOption.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        UnconstrainedBox(
                          child: SvgPicture.asset(
                              'assets/icons/small-caret-down.svg'),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      width: double.infinity,
                      height: 160.h,
                      decoration: const BoxDecoration(boxShadow: [Shadows.s2]),
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: bannerData.length,
                        onPageChanged: onPageChanged,
                        itemBuilder: (context, index) {
                          final data = bannerData[index];
                          return SvgPicture.asset(
                            data["image"]!,
                            fit: BoxFit.fill,
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 16.h,
                        bottom: 24.h,
                      ),
                      child: PageIndicator(
                        currentIndex: currentIndex,
                        length: bannerData.length,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Layanan',
                          style: TextStyles.heading3(),
                        ),
                        Text(
                          'Lihat Semua',
                          style: TextStyles.button2(
                            color: ColorStyles.primary500,
                            weight: FontWeightOption.semiBold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const ClampingScrollPhysics(),
                      child: Row(
                        children: serviceData
                            .map(
                              (service) => Padding(
                                padding: EdgeInsets.only(right: 16.w),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 64.w,
                                      height: 64.h,
                                      child:
                                          SvgPicture.asset(service["image"]!),
                                    ),
                                    SizedBox(height: 8.h),
                                    Text(
                                      service["label"]!,
                                      style: TextStyles.body3(
                                          weight: FontWeightOption.semiBold),
                                    )
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 24.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tukang Populer',
                            style: TextStyles.heading3(),
                          ),
                          Text(
                            'Lihat Semua',
                            style: TextStyles.button2(
                              color: ColorStyles.primary500,
                              weight: FontWeightOption.semiBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: populerWorkersData.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => context.go(RoutePath.productDetailPage),
                          child: WorkersCard(
                              workerData: populerWorkersData[index]),
                        );
                      },
                    ),
                    SizedBox(
                      height: 108.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
