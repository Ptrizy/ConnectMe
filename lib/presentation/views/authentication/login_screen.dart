import 'package:connectme/core/router/path.dart';
import 'package:connectme/presentation/blocs/auth/auth_bloc.dart';
import 'package:connectme/presentation/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:connectme/core/styles/color.dart';
import 'package:connectme/core/styles/text.dart';
import 'package:connectme/presentation/widgets/button.dart';
import 'package:connectme/presentation/widgets/text_fields.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(_checkFields);
    passwordController.addListener(_checkFields);
  }

  @override
  void dispose() {
    emailController.removeListener(_checkFields);
    passwordController.removeListener(_checkFields);
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _checkFields() {
    setState(() {
      isButtonEnabled =
          emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
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
        } else if (state is AuthVerified || state is AuthSignedIn) {
          Navigator.pop(context);
          context.go(
            RoutePath.mainPage,
          );
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 48.h, left: 24.h, right: 24.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    width: 108.w,
                    height: 108.h,
                    child: SvgPicture.asset('assets/logo-m.svg'),
                  ),
                ),
                SizedBox(height: 24.h),
                Text('Selamat datang 👋', style: TextStyles.heading2()),
                SizedBox(height: 4.h),
                Text(
                  'Masuk ke akun Anda untuk melanjutkan',
                  style: TextStyles.body2(
                      weight: FontWeightOption.regular,
                      color: ColorStyles.neutral600),
                ),
                SizedBox(height: 24.h),
                const LoginWithGoogleButton(),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(child: Divider(height: 1.h)),
                    SizedBox(width: 16.w),
                    Text(
                      'atau',
                      style: TextStyles.body2(
                          weight: FontWeightOption.regular,
                          color: ColorStyles.neutral500),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(child: Divider(height: 1.h)),
                  ],
                ),
                SizedBox(height: 24.h),
                CustomTextField(
                    controller: emailController,
                    type: CustomTextFieldType.input,
                    hintText: 'Email'),
                SizedBox(height: 16.h),
                CustomTextField(
                    controller: passwordController,
                    type: CustomTextFieldType.inputPasswordAndHint,
                    obscure: true,
                    hintText: 'Kata Sandi'),
                SizedBox(height: 8.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => context.go(RoutePath.forgotPassPage),
                    child: Text(
                      'Lupa kata sandi?',
                      style: TextStyles.button2(color: ColorStyles.primary500),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Buttons(
                  text: 'Masuk',
                  onClicked: isButtonEnabled
                      ? () => context.read<AuthBloc>().add(SigninEvent(
                            email: emailController.text,
                            password: passwordController.text,
                          ))
                      : () {},
                  bColor: isButtonEnabled
                      ? ColorStyles.primary500
                      : ColorStyles.neutral300,
                ),
                SizedBox(height: 24.h),
                Center(
                  child: GestureDetector(
                    onTap: () => context.go(RoutePath.signupPage),
                    child: RichText(
                      text: TextSpan(
                          text: 'Belum punya akun? ',
                          style: TextStyles.body2(
                              weight: FontWeightOption.regular,
                              color: ColorStyles.neutral600),
                          children: [
                            TextSpan(
                              text: 'Daftar',
                              style: TextStyles.body2(
                                  color: ColorStyles.primary500,
                                  weight: FontWeightOption.semiBold),
                            )
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginWithGoogleButton extends StatelessWidget {
  const LoginWithGoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          side: BorderSide(width: 1.5.w, color: ColorStyles.neutral300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 24.w,
              height: 24.h,
              child: SvgPicture.asset('assets/icons/google.svg'),
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              'Masuk dengan Google',
              style: TextStyles.body1(
                  weight: FontWeightOption.semiBold,
                  color: ColorStyles.neutral600),
            )
          ],
        ),
      ),
    );
  }
}
