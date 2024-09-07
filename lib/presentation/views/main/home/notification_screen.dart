import 'package:connectme/core/router/path.dart';
import 'package:connectme/core/styles/color.dart';
import 'package:connectme/core/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 70.h,
              bottom: 16.h,
              left: 24.w,
              right: 24.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => context.go(RoutePath.mainPage),
                  child: SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: SvgPicture.asset('assets/icons/caret-left.svg'),
                  ),
                ),
                Text(
                  'Notifikasi',
                  style: TextStyles.heading3(
                    weight: FontWeightOption.semiBold,
                  ),
                ),
                SizedBox(
                  width: 24.w,
                  height: 24.h,
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 123.h,
            decoration: const BoxDecoration(
              color: ColorStyles.primary100,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 16.h,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 32.w,
                      height: 32.h,
                      child: SvgPicture.asset('assets/icons/discount-new.svg')),
                  SizedBox(
                    width: 12.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Diskon spesial buat kamu!!!',
                          style: TextStyles.body1(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 4.h,
                            bottom: 8.h,
                          ),
                          child: Text(
                            'Klik disini untuk mencari tahu promo menarik yang akan membantu anda',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.body3(
                              color: ColorStyles.neutral600,
                              weight: FontWeightOption.regular,
                            ),
                          ),
                        ),
                        Text(
                          '28 Oktober 2023',
                          style: TextStyles.body3(
                            color: ColorStyles.primary500,
                            weight: FontWeightOption.semiBold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 123.h,
            decoration: const BoxDecoration(
              color: ColorStyles.white,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 16.h,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 32.w,
                      height: 32.h,
                      child: SvgPicture.asset('assets/icons/order-old.svg')),
                  SizedBox(
                    width: 12.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pesanan Selesai!',
                          style: TextStyles.body1(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 4.h,
                            bottom: 8.h,
                          ),
                          child: Text(
                            'Pesanan anda sudah terselesaikan. Jangan lupa memberikan ulasan kepada tukang.',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.body3(
                              color: ColorStyles.neutral600,
                              weight: FontWeightOption.regular,
                            ),
                          ),
                        ),
                        Text(
                          '28 Oktober 2023',
                          style: TextStyles.body3(
                            color: ColorStyles.primary500,
                            weight: FontWeightOption.semiBold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
