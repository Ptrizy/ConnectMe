import 'package:connectme/core/router/path.dart';
import 'package:connectme/core/styles/color.dart';
import 'package:connectme/core/styles/text.dart';
import 'package:connectme/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 60.h,
          left: 24.w,
          right: 24.w,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
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
                    'Beri Ulasan',
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
              SizedBox(
                height: 64.h,
              ),
              SizedBox(
                width: 272,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 48.w,
                      height: 48.h,
                      child: SvgPicture.asset('assets/icons/star.svg'),
                    ),
                    SizedBox(
                      width: 48.w,
                      height: 48.h,
                      child: SvgPicture.asset('assets/icons/star.svg'),
                    ),
                    SizedBox(
                      width: 48.w,
                      height: 48.h,
                      child: SvgPicture.asset('assets/icons/star.svg'),
                    ),
                    SizedBox(
                      width: 48.w,
                      height: 48.h,
                      child: SvgPicture.asset('assets/icons/star.svg'),
                    ),
                    SizedBox(
                      width: 48.w,
                      height: 48.h,
                      child: SvgPicture.asset('assets/icons/star.svg'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Perfect',
                style: TextStyles.heading4(),
              ),
              SizedBox(
                height: 24.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Menikmati layanan? beri tahu tukang anda',
                  style: TextStyles.body2(weight: FontWeightOption.regular),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              TextField(
                style: TextStyles.body1(weight: FontWeightOption.regular),
                decoration: InputDecoration(
                  hintText: 'Bagikan pengalaman anda',
                  hintStyle: TextStyles.body2(
                      color: ColorStyles.neutral600,
                      weight: FontWeightOption.regular),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.r),
                    ),
                    borderSide: const BorderSide(
                        color: ColorStyles.neutral300, width: 1),
                  ),
                ),
                maxLines: 3,
              ),
              SizedBox(
                height: 318.h,
              ),
              Buttons(
                text: isLoading ? 'Mengirim...' : 'Kirim Ulasan',
                onClicked: () {
                  setState(() {
                    isLoading = true;
                  });

                  Future.delayed(const Duration(seconds: 3), () {
                    setState(() {
                      isLoading = false;
                    });

                    context.go(RoutePath.mainPage);
                  });
                },
                bColor:
                    isLoading ? ColorStyles.neutral300 : ColorStyles.primary500,
                tColor: isLoading ? ColorStyles.neutral600 : Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
