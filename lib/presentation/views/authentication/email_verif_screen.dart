import 'package:connectme/core/router/path.dart';
import 'package:connectme/core/styles/color.dart';
import 'package:connectme/core/styles/text.dart';
import 'package:connectme/presentation/blocs/auth/auth_bloc.dart';
import 'package:connectme/presentation/widgets/button.dart';
import 'package:connectme/presentation/widgets/loading.dart';
import 'package:connectme/presentation/widgets/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class EmailVerifScreen extends StatefulWidget {
  const EmailVerifScreen({super.key});

  @override
  State<EmailVerifScreen> createState() => _EmailVerifScreenState();
}

class _EmailVerifScreenState extends State<EmailVerifScreen> {
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
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return const Loading();
            },
          );
        } else if (state is AuthError) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        } else if (state is AuthVerified) {
          Navigator.pop(context);
          context.go(RoutePath.successPage,
              extra: const SuccessEmailVerifContent());
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 70.h, left: 24.w, right: 24.w),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () => context.go(RoutePath.signupPage),
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
                  child:
                      SvgPicture.asset('assets/illustrations/email-verif.svg'),
                ),
                SizedBox(
                  height: 48.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Verifikasi Email',
                    style: TextStyles.heading2(),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                RichText(
                  text: TextSpan(
                      text:
                          'Masukkan kode verifikasi yang kami kirimkan pada email ',
                      style: TextStyles.body2(
                          weight: FontWeightOption.regular,
                          color: ColorStyles.neutral600),
                      children: [
                        TextSpan(
                          text: '*****@gmail.com',
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
                        context.read<AuthBloc>().add(VerifyUser(
                              code: _otp,
                            ));
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
                                    weight: FontWeightOption.semiBold))
                          ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SuccessEmailVerifContent extends StatelessWidget {
  const SuccessEmailVerifContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Verifikasi Berhasil',
          style: TextStyles.heading2(color: ColorStyles.white),
        ),
        SizedBox(
          height: 4.h,
        ),
        Text(
          'Selamat email anda telah berhasil diverifikasi',
          style: TextStyles.body2(
            color: ColorStyles.white,
            weight: FontWeightOption.regular,
          ),
        ),
        SizedBox(
          height: 48.h,
        ),
        Buttons(
          text: 'Masuk',
          onClicked: () {
            context.go(RoutePath.loginPage);
          },
          bColor: ColorStyles.white,
          tColor: ColorStyles.primary500,
        ),
      ],
    );
  }
}
