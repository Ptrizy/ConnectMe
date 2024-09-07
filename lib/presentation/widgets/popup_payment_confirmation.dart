import 'dart:async';

import 'package:connectme/core/router/path.dart';
import 'package:connectme/core/styles/color.dart';
import 'package:connectme/core/styles/text.dart';
import 'package:connectme/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';

class PopupPaymentConfirmation {
  static void showPopupPaymentConfirmationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: ColorStyles.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (BuildContext bottomSheetContext) {
        return PopupPaymentConfirmationBottomSheet(
          onComplete: () {
            Navigator.of(bottomSheetContext).pop();
            _navigateToSuccessPage(bottomSheetContext);
          },
        );
      },
    );
  }

  static void _navigateToSuccessPage(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        print("Navigating to success page");
        context.pushReplacement(
          RoutePath.successPage,
          extra: _buildSuccessPageContent(context),
        );
      } else {
        print("Context is not mounted, unable to navigate to success page");
      }
    });
  }

  static Widget _buildSuccessPageContent(BuildContext context) {
    return Builder(
      builder: (BuildContext successContext) {
        return Column(
          children: [
            Text(
              'Pembayaran Berhasil',
              style: TextStyles.heading2(
                color: ColorStyles.white,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              'Selamat anda telah berhasil melakukan pembayaran',
              style: TextStyles.body2(
                color: ColorStyles.neutral100,
                weight: FontWeightOption.regular,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 48.h, bottom: 16.h),
            ),
            Buttons(
              text: 'Lihat Struk Pembayaran,',
              bColor: ColorStyles.white,
              tColor: ColorStyles.primary500,
              onClicked: () {},
            ),
            SizedBox(
              height: 16.h,
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                _navigateToMainPage(successContext);
              },
              child: Container(
                width: double.infinity,
                height: 48.h,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: ColorStyles.white,
                    width: 1.w,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Text(
                    'Kembali ke Beranda',
                    style: TextStyles.button1(
                      color: ColorStyles.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  static void _navigateToMainPage(BuildContext context) {
    print("Attempting to navigate to main page");
    if (context.mounted) {
      print("Context is mounted, navigating to main page");
      context.go(RoutePath.mainPage);
    } else {
      print("Context is not mounted, unable to navigate to main page");
    }
  }
}

class PopupPaymentConfirmationBottomSheet extends StatefulWidget {
  final VoidCallback onComplete;

  const PopupPaymentConfirmationBottomSheet({
    super.key,
    required this.onComplete,
  });

  @override
  State<PopupPaymentConfirmationBottomSheet> createState() =>
      _PopupPaymentConfirmationBottomSheetState();
}

class _PopupPaymentConfirmationBottomSheetState
    extends State<PopupPaymentConfirmationBottomSheet> {
  late Timer _timer;
  late DateTime _endTime;
  Duration _timeLeft = const Duration(hours: 24);
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _endTime = DateTime.now().add(const Duration(hours: 24));
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _timeLeft = _endTime.difference(DateTime.now());
        if (_timeLeft.inSeconds == 86393) {
          // jamnya [23:59:53]
          _showLoading();
        }
        if (_timeLeft.isNegative) {
          _timer.cancel();
          _timeLeft = Duration.zero;
        }
      });
    });
  }

  void _showLoading() {
    setState(() {
      _isLoading = true;
    });
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        widget.onComplete();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String get formattedTime {
    return '${_timeLeft.inHours.toString().padLeft(2, '0')} : '
        '${(_timeLeft.inMinutes % 60).toString().padLeft(2, '0')} : '
        '${(_timeLeft.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  String get formattedEndDate {
    return DateFormat('d MMMM yyyy HH:mm WIB').format(_endTime);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 32.h, left: 24.w, right: 24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pembayaran', style: TextStyles.heading3()),
              SizedBox(height: 16.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorStyles.neutral300, width: 1.w),
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: ColorStyles.error500,
                        borderRadius: BorderRadius.circular(500.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/clock.svg',
                            width: 24.w,
                            height: 24.h,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            formattedTime,
                            style: TextStyles.body1(
                              color: Colors.white,
                              weight: FontWeightOption.regular,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Batas akhir pembayaran',
                      style: TextStyles.body2(
                        color: ColorStyles.neutral600,
                        weight: FontWeightOption.regular,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      formattedEndDate,
                      style: TextStyles.body1(
                        weight: FontWeightOption.semiBold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                width: double.infinity,
                height: 231.h,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorStyles.neutral300, width: 1.w),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'BCA Virtual Account',
                            style: TextStyles.body1(),
                          ),
                          SizedBox(
                            width: 48.w,
                            height: 24.h,
                            child: Image.asset('assets/banks/bca.png'),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 16.h,
                          bottom: 8.h,
                        ),
                        child: Text(
                          'Nomor Virtual Account',
                          style: TextStyles.body2(
                            color: ColorStyles.neutral600,
                            weight: FontWeightOption.regular,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: ColorStyles.primary100,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '7001 4000 5000',
                                style: TextStyles.body1(
                                  color: ColorStyles.primary500,
                                  weight: FontWeightOption.semiBold,
                                ),
                              ),
                              SizedBox(
                                width: 24.w,
                                height: 24.h,
                                child:
                                    SvgPicture.asset('assets/icons/copy.svg'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 16.h,
                          bottom: 8.h,
                        ),
                        child: Text(
                          'Total Pembayaran',
                          style: TextStyles.body2(
                            color: ColorStyles.neutral600,
                            weight: FontWeightOption.regular,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: ColorStyles.primary100,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          child: Text(
                            'Rp 105.000',
                            style: TextStyles.body1(
                              color: ColorStyles.primary500,
                              weight: FontWeightOption.semiBold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 48.h),
            ],
          ),
        ),
        if (_isLoading)
          Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 4,
                  color: ColorStyles.primary500,
                ),
              )),
      ],
    );
  }
}
