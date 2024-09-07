import 'package:connectme/core/router/path.dart';
import 'package:connectme/core/styles/color.dart';
import 'package:connectme/core/styles/text.dart';
import 'package:connectme/presentation/widgets/button.dart';
import 'package:connectme/presentation/widgets/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ForgotPassVerifScreen extends StatefulWidget {
  const ForgotPassVerifScreen({super.key});

  @override
  State<ForgotPassVerifScreen> createState() => _ForgotPassVerifScreenState();
}

class _ForgotPassVerifScreenState extends State<ForgotPassVerifScreen> {
  String _otp = '';
  bool _isOtpComplete = false;

  void _updateOtp(String newOtp) {
    setState(() {
      _otp = newOtp;
      _isOtpComplete = newOtp.length == 4;
    });
    debugPrint('OTP NYA ADALAH: $_otp');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 70.h, left: 24.w, right: 24.w),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => context.go(RoutePath.forgotPassPage),
                  child: UnconstrainedBox(
                    child: SvgPicture.asset('assets/icons/caret-left.svg'),
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                width: double.infinity,
                height: 218.15.h,
                child: SvgPicture.asset(
                    'assets/illustrations/otp-forgot-pass.svg'),
              ),
              SizedBox(
                height: 48.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Masukkan Kode OTP',
                  style: TextStyles.heading2(),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              RichText(
                text: TextSpan(
                    text: 'Masukkan kode OTP yang kami kirimkan pada email ',
                    style: TextStyles.body2(
                        weight: FontWeightOption.regular,
                        color: ColorStyles.neutral600),
                    children: [
                      TextSpan(
                        text: 'n***a@gmail.com',
                        style: TextStyles.body2(
                            color: ColorStyles.neutral700,
                            weight: FontWeightOption.bold),
                      )
                    ]),
              ),
              SizedBox(
                height: 24.h,
              ),
              Otp(
                length: 4,
                onCompleted: _updateOtp,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: Buttons(
                  text: 'Verifikasi',
                  onClicked: () {
                    if (_isOtpComplete) {
                      context.go(RoutePath.newPassPage);
                      debugPrint('Verifikasi OTP: $_otp');
                    }
                  },
                  bColor: _isOtpComplete
                      ? ColorStyles.primary500
                      : ColorStyles.neutral400,
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: RichText(
                    text: TextSpan(
                        text: 'Tidak menerima kode? ',
                        style: TextStyles.body2(
                            weight: FontWeightOption.regular,
                            color: ColorStyles.neutral600),
                        children: [
                          TextSpan(
                            text: 'Kirim ulang',
                            style: TextStyles.body2(
                                color: ColorStyles.primary500,
                                weight: FontWeightOption.semiBold),
                          ),
                        ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
