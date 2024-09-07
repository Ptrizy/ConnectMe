import 'package:connectme/core/styles/color.dart';
import 'package:connectme/core/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Buttons extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final Color? bColor;
  final Color? tColor;
  final int? width;
  final int? height;

  const Buttons({
    super.key,
    required this.text,
    required this.onClicked,
    this.bColor,
    this.tColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = bColor ?? ColorStyles.primary500;
    Color textColor = tColor ?? ColorStyles.white;
    int widths = width ?? 345;
    int heights = height ?? 48;

    return Center(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(backgroundColor),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          minimumSize: WidgetStateProperty.all<Size>(Size(widths.w, heights.h)),
        ),
        onPressed: onClicked,
        child: Text(
          text,
          style: TextStyles.button1(
              weight: FontWeightOption.semiBold, color: textColor),
        ),
      ),
    );
  }
}
