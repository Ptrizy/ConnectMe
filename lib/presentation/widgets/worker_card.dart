import 'package:connectme/core/styles/color.dart';
import 'package:connectme/core/styles/shadow.dart';
import 'package:connectme/core/styles/text.dart';
import 'package:connectme/presentation/widgets/pills.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WorkersCard extends StatelessWidget {
  final Map<String, String> workerData;

  const WorkersCard({
    super.key,
    required this.workerData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Container(
        width: double.infinity,
        height: 122.h,
        decoration: BoxDecoration(
          color: ColorStyles.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: const [Shadows.s2],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 100.w,
              height: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  bottomLeft: Radius.circular(8.r),
                ),
                child: Image.asset(
                  workerData['image'] ?? '',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 12.w, top: 8.h, bottom: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      workerData['name'] ?? '',
                      style: TextStyles.body1(),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      workerData['category'] ?? '',
                      style: TextStyles.body3(
                        color: ColorStyles.neutral600,
                        weight: FontWeightOption.regular,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Row(
                        children: [
                          Pills(
                            label: workerData['subcategory'] ?? '',
                            type: PillsType.defaults,
                            isFontSizeSmall: true,
                          ),
                          SizedBox(width: 8.w),
                          UnconstrainedBox(
                            child: SvgPicture.asset('assets/icons/star.svg'),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            workerData['rating'] ?? '',
                            style: TextStyles.body3(
                              color: ColorStyles.neutral600,
                              weight: FontWeightOption.regular,
                            ),
                          )
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'dari ',
                        style: TextStyles.body3(
                          color: ColorStyles.neutral600,
                          weight: FontWeightOption.regular,
                        ),
                        children: [
                          TextSpan(
                            text: 'Rp ${workerData['price'] ?? ''}',
                            style: TextStyles.body1(
                              color: ColorStyles.primary500,
                              weight: FontWeightOption.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
