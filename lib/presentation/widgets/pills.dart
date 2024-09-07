import 'package:connectme/core/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

enum PillsType {
  defaults,
  success,
  failed,
}

class Pills extends StatelessWidget {
  final String label;
  final PillsType type;
  final bool isFontSizeSmall;
  const Pills({
    super.key,
    required this.label,
    required this.type,
    this.isFontSizeSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      decoration: _getBoxDecoration(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
        ),
        child: Center(
          child: Text(
            label,
            style: _getTextStyle(),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  BoxDecoration _getBoxDecoration() {
    const borderRadius = BorderRadius.all(Radius.circular(500));

    switch (type) {
      case PillsType.defaults:
        return const BoxDecoration(
            color: ColorStyles.primary100, borderRadius: borderRadius);
      case PillsType.success:
        return const BoxDecoration(
            color: ColorStyles.success100, borderRadius: borderRadius);
      case PillsType.failed:
        return const BoxDecoration(
            color: ColorStyles.error100, borderRadius: borderRadius);
    }
  }

  TextStyle _getTextStyle() {
    const fontWeight = FontWeight.w500;

    final fontSize = isFontSizeSmall ? 10.sp : 12.sp;

    switch (type) {
      case PillsType.defaults:
        return GoogleFonts.workSans(
          color: ColorStyles.primary500,
          fontWeight: fontWeight,
          fontSize: fontSize,
        );
      case PillsType.success:
        return GoogleFonts.workSans(
          color: ColorStyles.success500,
          fontWeight: fontWeight,
          fontSize: fontSize,
        );
      case PillsType.failed:
        return GoogleFonts.workSans(
          color: ColorStyles.error500,
          fontWeight: fontWeight,
          fontSize: fontSize,
        );
    }
  }
}
