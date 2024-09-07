import 'package:connectme/core/styles/color.dart';
import 'package:connectme/core/styles/text.dart';
import 'package:connectme/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopupPaymentMethod {}

void showPopupPaymentMethodBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: ColorStyles.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
    ),
    builder: (BuildContext context) {
      return const PopupPaymentMethodBottomSheet();
    },
  );
}

class PopupPaymentMethodBottomSheet extends StatefulWidget {
  const PopupPaymentMethodBottomSheet({super.key});

  @override
  State<PopupPaymentMethodBottomSheet> createState() =>
      _PopupPaymentMethodBottomSheetState();
}

class _PopupPaymentMethodBottomSheetState
    extends State<PopupPaymentMethodBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 32.h, left: 24.w, right: 24.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pilih Metode Pembayaran', style: TextStyles.heading3()),
          SizedBox(height: 16.h),
          Buttons(
            text: 'Konfirmasi',
            onClicked: () => Navigator.pop(context),
          ),
          SizedBox(
            height: 48.h,
          )
        ],
      ),
    );
  }
}
