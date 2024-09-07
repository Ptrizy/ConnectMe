import 'package:connectme/core/styles/color.dart';
import 'package:connectme/core/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.primary500,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 60.h,
              bottom: 32.h,
            ),
            child: Center(
              child: Text(
                'Profil',
                style: TextStyles.heading3(
                  color: ColorStyles.white,
                  weight: FontWeightOption.semiBold,
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(100.r)),
            child: Image.asset(
              'assets/profile-photo.png',
              width: 80.w,
              height: 80.h,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            'Paula Sugiarto',
            style: TextStyles.heading4(
              color: ColorStyles.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 4.h, bottom: 24.h),
            child: Text(
              'paulasugiarto@gmail.com',
              style: TextStyles.body2(
                color: ColorStyles.neutral100,
                weight: FontWeightOption.regular,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorStyles.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.r),
                        topRight: Radius.circular(24.r),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 32.h,
                        left: 24.w,
                        right: 24.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'AKUN',
                            style: TextStyles.caption(
                              color: ColorStyles.neutral800,
                              weight: FontWeightOption.regular,
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          const ProfileMenu(
                            assetsPath: 'assets/icons/map-profile.svg',
                            label: 'Alamat saya',
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: const ProfileMenu(
                              assetsPath: 'assets/icons/edit-profile.svg',
                              label: 'Ubah Profil',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.h),
                            child: const ProfileMenu(
                              assetsPath:
                                  'assets/icons/change-pass-profile.svg',
                              label: 'Ubah Kata Sandi',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 24.h),
                            child: const ProfileMenu(
                              assetsPath: 'assets/icons/setting-profile.svg',
                              label: 'Pengaturan',
                            ),
                          ),
                          Text(
                            'UMUM',
                            style: TextStyles.caption(
                              color: ColorStyles.neutral800,
                              weight: FontWeightOption.regular,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
                            child: const ProfileMenu(
                              assetsPath: 'assets/icons/help-profile.svg',
                              label: 'Pusat Bantuan',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.h),
                            child: const ProfileMenu(
                              assetsPath: 'assets/icons/terms-profile.svg',
                              label: 'Syarat & Ketentuan',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 24.h),
                            child: const ProfileMenu(
                              assetsPath: 'assets/icons/apps-info-profile.svg',
                              label: 'Tentang ConnectMe',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 133.h),
                            child: const ProfileMenu(
                              assetsPath: 'assets/icons/signout-profile.svg',
                              label: 'Keluar',
                              color: ColorStyles.error500,
                              borderColor: ColorStyles.error100,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  final String assetsPath;
  final String label;

  final Color? color;
  final Color? borderColor;
  const ProfileMenu({
    super.key,
    required this.assetsPath,
    required this.label,
    this.color,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    Color colors = color ?? ColorStyles.black;
    Color bordersColor = borderColor ?? ColorStyles.neutral300;
    return Container(
      width: double.infinity,
      height: 56.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.r,
          ),
        ),
        border: Border.all(
          width: 1.w,
          color: bordersColor,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 16.h,
          left: 16.w,
          bottom: 16.w,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              assetsPath,
            ),
            SizedBox(
              width: 12.w,
            ),
            Text(
              label,
              style: TextStyles.body1(
                  weight: FontWeightOption.semiBold, color: colors),
            )
          ],
        ),
      ),
    );
  }
}
