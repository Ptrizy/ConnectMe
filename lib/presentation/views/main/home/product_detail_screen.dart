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

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: SizedBox(
                width: 393.w,
                height: 350.h,
                child: Image.asset(
                  'assets/users/photo-example-1.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: 70.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SizedBox(
                  width: 345.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => context.go(
                          RoutePath.mainPage,
                        ),
                        child: const IconButtons(
                          path: 'assets/icons/caret-left.svg',
                        ),
                      ),
                      const IconButtons(
                        path: 'assets/icons/share.svg',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 320.h,
              child: Container(
                width: 393.w,
                height: 657.h,
                decoration: BoxDecoration(
                  color: ColorStyles.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 32.h,
                    bottom: 105.h,
                    left: 24.w,
                    right: 24.w,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      children: [
                        const WorkersValueContent(),
                        const AboutMeContent(),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 24.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ulasan',
                                style: TextStyles.heading4(),
                              ),
                              Text(
                                'Lihat Semua',
                                style: TextStyles.button2(
                                    color: ColorStyles.primary500),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 24.w,
                                height: 24.h,
                                child:
                                    SvgPicture.asset('assets/icons/star.svg'),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                ),
                                child: RichText(
                                  text: TextSpan(
                                      text: '4.9',
                                      style: TextStyles.body1(),
                                      children: [
                                        TextSpan(
                                          text: ' dari 1k rating',
                                          style: TextStyles.body2(
                                            color: ColorStyles.neutral600,
                                            weight: FontWeightOption.regular,
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                              Container(
                                width: 4.w,
                                height: 4.h,
                                decoration: BoxDecoration(
                                  color: ColorStyles.neutral300,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                '100 ulasan',
                                style: TextStyles.body2(
                                  color: ColorStyles.neutral600,
                                  weight: FontWeightOption.regular,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100.r)),
                                  child: Image.asset(
                                    'assets/profile-photo.png',
                                    width: 32.w,
                                    height: 32.h,
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  'Joko Sukoco',
                                  style: TextStyles.body2(),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 12.w,
                                    height: 12.h,
                                    child: SvgPicture.asset(
                                        'assets/icons/star.svg'),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  SizedBox(
                                    width: 12.w,
                                    height: 12.h,
                                    child: SvgPicture.asset(
                                        'assets/icons/star.svg'),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  SizedBox(
                                    width: 12.w,
                                    height: 12.h,
                                    child: SvgPicture.asset(
                                        'assets/icons/star.svg'),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  SizedBox(
                                    width: 12.w,
                                    height: 12.h,
                                    child: SvgPicture.asset(
                                        'assets/icons/star.svg'),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  SizedBox(
                                    width: 12.w,
                                    height: 12.h,
                                    child: SvgPicture.asset(
                                        'assets/icons/star.svg'),
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Text(
                                    '5 hari lalu',
                                    style: TextStyles.body3(
                                        color: ColorStyles.neutral600,
                                        weight: FontWeightOption.regular),
                                  )
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  'Cepat dan ramah, laptop saya sudah kembali berfungsi dan dapat langsung digunakan setelah diperbaiki Kak Bambang.',
                                  style: TextStyles.body2(
                                    color: ColorStyles.neutral600,
                                    weight: FontWeightOption.regular,
                                  ),
                                  maxLines: 3,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Selengkapnya',
                                    style: TextStyles.button2(
                                      color: ColorStyles.primary500,
                                      weight: FontWeightOption.semiBold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 105.h,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 393.w,
                height: 81.h,
                decoration: const BoxDecoration(
                  color: ColorStyles.white,
                  boxShadow: [Shadows.s4],
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 12.h,
                    left: 24.w,
                    right: 24.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 36.w,
                        height: 36.h,
                        child:
                            SvgPicture.asset('assets/icons/message-button.svg'),
                      ),
                      Buttons(
                        text: 'Sewa Tukang',
                        onClicked: () => context.go(RoutePath.orderProductPage),
                        width: 293,
                        height: 36,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkersValueContent extends StatelessWidget {
  const WorkersValueContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Bambang Jatmiko',
              style: TextStyles.heading3(),
            ),
            SvgPicture.asset(
              'assets/icons/heart-untapped.svg',
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Laptop/Komputer',
              style: TextStyles.body2(
                  color: ColorStyles.neutral600,
                  weight: FontWeightOption.regular),
            ),
          ),
        ),
        Row(
          children: [
            const Pills(
              label: 'Gadget',
              type: PillsType.defaults,
              isFontSizeSmall: false,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  SizedBox(
                    width: 16.w,
                    height: 16.h,
                    child: SvgPicture.asset('assets/icons/star.svg'),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    '4.9 (1k)',
                    style: TextStyles.body2(
                      color: ColorStyles.neutral600,
                      weight: FontWeightOption.regular,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 16.w,
              height: 16.h,
              child: SvgPicture.asset('assets/icons/briefcase.svg'),
            ),
            SizedBox(width: 8.w),
            Text(
              '5 Tahun',
              style: TextStyles.body2(
                color: ColorStyles.neutral600,
                weight: FontWeightOption.regular,
              ),
            )
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
              text: 'dari ',
              style: TextStyles.body2(
                color: ColorStyles.neutral600,
                weight: FontWeightOption.regular,
              ),
              children: [
                TextSpan(
                  text: 'Rp 25.000',
                  style: TextStyles.heading3(
                    color: ColorStyles.primary500,
                    weight: FontWeightOption.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AboutMeContent extends StatelessWidget {
  const AboutMeContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 24.h, bottom: 16.h),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Tentang Saya',
              style: TextStyles.heading4(),
            ),
          ),
        ),
        Text(
          'Saya memiliki pengalaman servis laptop selama 3 tahun, dan saya memulai pekerjaan ini karena hobi mengotak-atik komponen dalam laptop.',
          style: TextStyles.body2(
            color: ColorStyles.neutral600,
            weight: FontWeightOption.regular,
          ),
          maxLines: 3,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Baca Selengkapnya',
            style: TextStyles.button2(
              color: ColorStyles.primary500,
              weight: FontWeightOption.semiBold,
            ),
          ),
        ),
      ],
    );
  }
}

class IconButtons extends StatelessWidget {
  final String path;
  const IconButtons({
    super.key,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32.w,
      height: 32.h,
      decoration: BoxDecoration(
        color: ColorStyles.white,
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Center(
        child: SizedBox(
          width: 16.w,
          height: 16.h,
          child: SvgPicture.asset(path),
        ),
      ),
    );
  }
}
