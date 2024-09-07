import 'package:connectme/core/constants/populer_workers_data.dart';
import 'package:connectme/core/router/path.dart';
import 'package:connectme/core/styles/color.dart';
import 'package:connectme/core/styles/text.dart';
import 'package:connectme/presentation/widgets/popup_filter.dart';
import 'package:connectme/presentation/widgets/text_fields.dart';
import 'package:connectme/presentation/widgets/worker_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textFavoriteController = TextEditingController();
    return Scaffold(
      backgroundColor: ColorStyles.white,
      body: Padding(
        padding: EdgeInsets.only(
          top: 70.h,
          bottom: 16.h,
          left: 24.w,
          right: 24.w,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
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
                    'Favorit',
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
              Padding(
                padding: EdgeInsets.only(
                  top: 32.h,
                  bottom: 16.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextField(
                      controller: textFavoriteController,
                      type: CustomTextFieldType.inputSearch,
                      hintText: 'Cari di Favorit',
                      width: 300.w,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    GestureDetector(
                      onTap: () => showPopupFilterBottomSheet(context),
                      child: SizedBox(
                        width: 24.w,
                        height: 24.h,
                        child: SvgPicture.asset('assets/icons/filter.svg'),
                      ),
                    )
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
                    child: WorkersCard(workerData: populerWorkersData[index]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
