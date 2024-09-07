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

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    nameController.addListener(_checkFields);
    phoneNumberController.addListener(_checkFields);
    emailController.addListener(_checkFields);
    passwordController.addListener(_checkFields);
    passwordConfirmationController.addListener(_checkFields);
    super.initState();
  }

  @override
  void dispose() {
    nameController.removeListener(_checkFields);
    phoneNumberController.removeListener(_checkFields);
    emailController.removeListener(_checkFields);
    passwordController.removeListener(_checkFields);
    passwordConfirmationController.removeListener(_checkFields);

    nameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    super.dispose();
  }

  void _checkFields() {
    setState(() {
      isButtonEnabled = nameController.text.isNotEmpty &&
          phoneNumberController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
          passwordConfirmationController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
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
          } else if (state is AuthRegistered) {
            Navigator.pop(context);
            context.go(RoutePath.emailVerifPage);
          }
        },
        child: SingleChildScrollView(
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
                Text('Buat Akun', style: TextStyles.heading2()),
                SizedBox(height: 4.h),
                Text(
                  'Daftarkan akun Anda untuk mengakses semua fitur dalam aplikasi',
                  style: TextStyles.body2(
                      weight: FontWeightOption.regular,
                      color: ColorStyles.neutral600),
                ),
                SizedBox(height: 24.h),
                CustomTextField(
                    controller: nameController,
                    type: CustomTextFieldType.input,
                    hintText: 'Nama Lengkap'),
                SizedBox(height: 16.h),
                CustomTextField(
                    controller: phoneNumberController,
                    type: CustomTextFieldType.input,
                    hintText: 'No Telepon'),
                SizedBox(height: 16.h),
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
                SizedBox(height: 16.h),
                CustomTextField(
                    controller: passwordConfirmationController,
                    type: CustomTextFieldType.inputPasswordAndHint,
                    obscure: true,
                    hintText: 'Konfirmasi Kata Sandi'),
                SizedBox(height: 16.h),
                RichText(
                  text: TextSpan(
                      text: 'Dengan mendaftar, Anda menyetujui ',
                      style: TextStyles.body2(
                          weight: FontWeightOption.regular,
                          color: ColorStyles.neutral600),
                      children: [
                        TextSpan(
                          text: 'Ketentuan Layanan ',
                          style: TextStyles.body2(
                              color: ColorStyles.primary500,
                              weight: FontWeightOption.semiBold),
                        ),
                        TextSpan(
                          text: 'dan ',
                          style: TextStyles.body2(
                              weight: FontWeightOption.regular,
                              color: ColorStyles.neutral600),
                        ),
                        TextSpan(
                          text: 'Kebijakan Privasi ',
                          style: TextStyles.body2(
                              color: ColorStyles.primary500,
                              weight: FontWeightOption.semiBold),
                        ),
                        TextSpan(
                          text: 'ConnectMe',
                          style: TextStyles.body2(
                              weight: FontWeightOption.regular,
                              color: ColorStyles.neutral600),
                        ),
                      ]),
                ),
                SizedBox(height: 24.h),
                Buttons(
                  text: 'Buat Akun',
                  onClicked: isButtonEnabled
                      ? () {
                          context.read<AuthBloc>().add(
                                SignupEvent(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phoneNumber: phoneNumberController.text,
                                ),
                              );
                        }
                      : () {},
                  bColor: isButtonEnabled
                      ? ColorStyles.primary500
                      : ColorStyles.neutral300,
                ),
                SizedBox(height: 24.h),
                Center(
                  child: GestureDetector(
                    onTap: () => context.go(RoutePath.loginPage),
                    child: RichText(
                      text: TextSpan(
                          text: 'Sudah punya akun? ',
                          style: TextStyles.body2(
                              weight: FontWeightOption.regular,
                              color: ColorStyles.neutral600),
                          children: [
                            TextSpan(
                                text: 'Masuk',
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
