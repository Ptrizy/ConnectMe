import 'package:connectme/core/router/path.dart';
import 'package:connectme/core/styles/color.dart';
import 'package:connectme/core/styles/text.dart';
import 'package:connectme/presentation/widgets/button.dart';
import 'package:connectme/presentation/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  TextEditingController emailController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    emailController.addListener(_checkFields);
    super.initState();
  }

  @override
  void dispose() {
    emailController.removeListener(_checkFields);

    emailController.dispose();
    super.dispose();
  }

  void _checkFields() {
    setState(() {
      isButtonEnabled = emailController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 70.h,
            left: 24.w,
            right: 24.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => context.go(RoutePath.loginPage),
                child: UnconstrainedBox(
                  child: SvgPicture.asset('assets/icons/caret-left.svg'),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                height: 342.32.h,
                width: double.infinity,
                child: SvgPicture.asset('assets/illustrations/forgot-pass.svg'),
              ),
              SizedBox(
                height: 48.h,
              ),
              Text(
                'Lupa kata sandi?',
                style: TextStyles.heading2(),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                'Masukkan email Anda yang terdaftar untuk mengirimkan kode OTP',
                style: TextStyles.body2(
                  weight: FontWeightOption.regular,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: CustomTextField(
                    controller: emailController,
                    type: CustomTextFieldType.input,
                    hintText: 'Email'),
              ),
              Buttons(
                text: 'Masuk',
                onClicked: isButtonEnabled
                    ? () {
                        context.go(RoutePath.forgotPassVerifPage);
                      }
                    : () {},
                bColor: isButtonEnabled
                    ? ColorStyles.primary500
                    : ColorStyles.neutral300,
              )
            ],
          ),
        ),
      ),
    );
  }
}
