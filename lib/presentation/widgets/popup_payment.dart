import 'package:connectme/core/styles/color.dart';
import 'package:connectme/core/styles/text.dart';
import 'package:connectme/presentation/widgets/button.dart';
import 'package:connectme/presentation/widgets/popup_payment_confirmation.dart';
import 'package:connectme/presentation/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PopupPayment {}

void showPopupPaymentBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: ColorStyles.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
    ),
    builder: (BuildContext context) {
      return const PopupPaymentBottomSheet();
    },
  );
}

class PopupPaymentBottomSheet extends StatefulWidget {
  const PopupPaymentBottomSheet({super.key});

  @override
  State<PopupPaymentBottomSheet> createState() =>
      _PopupPaymentBottomSheetState();
}

class _PopupPaymentBottomSheetState extends State<PopupPaymentBottomSheet> {
  @override
  Widget build(BuildContext context) {
    TextEditingController promoCodeController = TextEditingController();

    return Container(
      padding: EdgeInsets.only(top: 32.h, left: 24.w, right: 24.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Metode Pembayaran', style: TextStyles.heading3()),
          SizedBox(height: 16.h),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: 48.h,
              decoration: BoxDecoration(
                color: ColorStyles.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  width: 1,
                  color: ColorStyles.neutral300,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12.h,
                  horizontal: 16.w,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 48.w,
                      height: 24.h,
                      child: Image.asset('assets/banks/bca.png'),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'BCA Virtual Account',
                      style: TextStyles.body1(
                        color: ColorStyles.neutral600,
                        weight: FontWeightOption.semiBold,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child:
                          SvgPicture.asset('assets/icons/caret-right-24.svg'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 16.h,
              bottom: 4.h,
            ),
            child: Text(
              'Kode Promo (Optional)',
              style: TextStyles.body1(weight: FontWeightOption.semiBold),
            ),
          ),
          CustomTextField(
              controller: promoCodeController,
              type: CustomTextFieldType.input,
              hintText: 'Masukkan Kode Promo'),
          SizedBox(
            height: 16.h,
          ),
          Text(
            'Rincian Pembayaran',
            style: TextStyles.body1(weight: FontWeightOption.semiBold),
          ),
          SizedBox(
            height: 16.h,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cek Kerusakan',
                    style: TextStyles.body2(
                      color: ColorStyles.neutral600,
                      weight: FontWeightOption.regular,
                    ),
                  ),
                  Text(
                    'Rp 25.000',
                    style: TextStyles.body2(
                      weight: FontWeightOption.semiBold,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Servis',
                      style: TextStyles.body2(
                        color: ColorStyles.neutral600,
                        weight: FontWeightOption.regular,
                      ),
                    ),
                    Text(
                      'Rp 75.000',
                      style: TextStyles.body2(
                        weight: FontWeightOption.semiBold,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Biaya Layanan',
                    style: TextStyles.body2(
                      color: ColorStyles.neutral600,
                      weight: FontWeightOption.regular,
                    ),
                  ),
                  Text(
                    'Rp 5.000',
                    style: TextStyles.body2(
                      weight: FontWeightOption.semiBold,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Divider(
                  height: 1.h,
                  color: ColorStyles.neutral300,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyles.body2(
                      color: ColorStyles.neutral600,
                      weight: FontWeightOption.bold,
                    ),
                  ),
                  Text(
                    'Rp 5.000',
                    style: TextStyles.body2(
                      weight: FontWeightOption.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              )
            ],
          ),
          Buttons(
            text: 'Bayar',
            onClicked: () {
              Navigator.pop(context);
              PopupPaymentConfirmation.showPopupPaymentConfirmationBottomSheet(
                  context);
            },
          ),
          SizedBox(
            height: 48.h,
          )
        ],
      ),
    );
  }
}
