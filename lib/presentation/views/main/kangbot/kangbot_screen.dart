import 'package:connectme/core/styles/color.dart';
import 'package:connectme/core/styles/text.dart';
import 'package:connectme/presentation/widgets/button.dart';
import 'package:connectme/presentation/widgets/popup_ask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KangbotScreen extends StatelessWidget {
  const KangbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 393.w,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: SvgPicture.asset('assets/illustrations/gear.svg'),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: SvgPicture.asset('assets/illustrations/gear-1.svg'),
            ),
            Positioned(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Selamat Datang di KangBot',
                  style: TextStyles.heading2(),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.h, bottom: 48.h),
                  child: Text(
                    'KangBot adalah asisten pintar yang siap membantu Anda menemukan solusi untuk permasalahan Anda.',
                    style: TextStyles.body1(
                      color: ColorStyles.neutral600,
                      weight: FontWeightOption.regular,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Buttons(
                  text: 'Cari Solusi',
                  onClicked: () => showPopupAskBottomSheet(context),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
