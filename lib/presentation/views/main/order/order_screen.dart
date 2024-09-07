import 'package:connectme/core/router/path.dart';
import 'package:connectme/core/styles/color.dart';
import 'package:connectme/core/styles/shadow.dart';
import 'package:connectme/core/styles/text.dart';
import 'package:connectme/presentation/widgets/button.dart';
import 'package:connectme/presentation/widgets/pills.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _changePage(int index) {
    setState(() {
      _currentPageIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.neutral100,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 158.h,
            decoration: const BoxDecoration(
              color: ColorStyles.white,
              boxShadow: [Shadows.s3],
            ),
            child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Text(
                    'Pesanan',
                    textAlign: TextAlign.center,
                    style:
                        TextStyles.heading3(weight: FontWeightOption.semiBold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      _buildTabButton('Dalam Proses', 0),
                      _buildTabButton('Riwayat', 1),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              children: [
                _buildDalamProsesPage(),
                _buildRiwayatPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    bool isSelected = _currentPageIndex == index;
    return GestureDetector(
      onTap: () => _changePage(index),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: isSelected ? ColorStyles.primary500 : Colors.transparent,
            ),
          ),
        ),
        width: 172.5.w,
        height: 48.h,
        child: Center(
          child: Text(
            title,
            style: TextStyles.body1(
              color:
                  isSelected ? ColorStyles.primary500 : ColorStyles.neutral600,
              weight: FontWeightOption.semiBold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDalamProsesPage() {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, left: 24.w, right: 24.w),
      child: Column(
        children: [
          const OrderCard(
            type: OrderCardType.onProcess,
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }

  Widget _buildRiwayatPage() {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, left: 24.w, right: 24.w),
      child: Column(
        children: [
          const OrderCard(
            type: OrderCardType.history,
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}

enum OrderCardType {
  onProcess,
  history,
}

class OrderCard extends StatelessWidget {
  final OrderCardType type;
  const OrderCard({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210.h,
      decoration: BoxDecoration(
        color: ColorStyles.white,
        boxShadow: const [
          Shadows.s2,
        ],
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TCM-291023',
                  style: TextStyles.body2(
                      color: ColorStyles.primary500,
                      weight: FontWeightOption.semiBold),
                ),
                const Pills(
                  label: 'Dalam Proses',
                  type: PillsType.defaults,
                  isFontSizeSmall: true,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: const Expanded(
                child: Divider(
                  thickness: 1,
                  color: ColorStyles.neutral300,
                ),
              ),
            ),
            Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 64.w,
                      height: 64.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(4.r)),
                        child: Image.asset(
                          'assets/users/photo-example-1.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 16.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bambang Jatmiko',
                      style: TextStyles.body1(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.h, bottom: 8.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Pills(
                            label: 'Gadget',
                            type: PillsType.defaults,
                            isFontSizeSmall: true,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            'Laptop/Komputer',
                            style: TextStyles.body3(
                              color: ColorStyles.neutral600,
                              weight: FontWeightOption.regular,
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 16.w,
                          height: 16.h,
                          child:
                              SvgPicture.asset('assets/icons/calendar-24.svg'),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          '29 Oktober 2023',
                          style: TextStyles.body3(
                            color: ColorStyles.neutral800,
                            weight: FontWeightOption.regular,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        SizedBox(
                          width: 16.w,
                          height: 16.h,
                          child: SvgPicture.asset(
                            'assets/icons/clock.svg',
                            color: ColorStyles
                                .neutral800, //ini deprecated parameter.
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          '10.30 WIB',
                          style: TextStyles.body3(
                            color: ColorStyles.neutral800,
                            weight: FontWeightOption.regular,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rp 305.000',
                  style: TextStyles.body1(
                    color: ColorStyles.primary500,
                  ),
                ),
                _buildButtonCard(context),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButtonCard(BuildContext context) {
    switch (type) {
      case OrderCardType.onProcess:
        return GestureDetector(
          onTap: () => context.go(
            RoutePath.chatPage,
          ),
          child: SizedBox(
            width: 36.w,
            height: 36.h,
            child: SvgPicture.asset('assets/icons/message-button.svg'),
          ),
        );
      case OrderCardType.history:
        return Buttons(
          text: 'Beri Ulasan',
          width: 114,
          height: 36,
          onClicked: () {
            context.go(RoutePath.reviewPage);
          },
        );
    }
  }
}
