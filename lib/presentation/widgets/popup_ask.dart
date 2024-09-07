import 'package:connectme/core/styles/color.dart';
import 'package:connectme/core/styles/text.dart';
import 'package:connectme/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

void showPopupAskBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: ColorStyles.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const PopupAskMethodBottomSheet(),
      );
    },
  );
}

void showErrorPopupAskBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: ColorStyles.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: EdgeInsets.only(top: 72.h, left: 24.w, right: 24.w),
          width: double.infinity,
          height: 300.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 64.w,
                height: 64.h,
                child: SvgPicture.asset('assets/icons/alert.svg'),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Integrasi antar servis tidak ada!',
                style: TextStyles.body1(
                  weight: FontWeightOption.regular,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class PopupAskMethodBottomSheet extends StatefulWidget {
  const PopupAskMethodBottomSheet({super.key});

  @override
  State<PopupAskMethodBottomSheet> createState() =>
      _PopupAskMethodBottomSheetState();
}

class _PopupAskMethodBottomSheetState extends State<PopupAskMethodBottomSheet> {
  final FocusNode _textFieldFocusNode = FocusNode();
  bool _isLoading = false;

  @override
  Widget build(BuildContext widgetContext) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 32.h, left: 24.w, right: 24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pilih Metode Pembayaran', style: TextStyles.body1()),
            SizedBox(height: 8.h),
            TextField(
              style: TextStyles.body1(weight: FontWeightOption.regular),
              focusNode: _textFieldFocusNode,
              decoration: InputDecoration(
                hintMaxLines: 6,
                hintText: 'Masukkan deskripsi',
                hintStyle: TextStyles.body1(
                    color: ColorStyles.neutral600,
                    weight: FontWeightOption.regular),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.r),
                  ),
                  borderSide:
                      const BorderSide(color: ColorStyles.neutral300, width: 1),
                ),
              ),
              maxLines: 3,
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
              child: Text(
                'Gambar',
                style: TextStyles.body1(),
              ),
            ),
            Container(
              width: 193.w,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.5.w,
                    color: ColorStyles.neutral300,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8.r))),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 8.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 16.w,
                      height: 16.h,
                      child: SvgPicture.asset('assets/icons/add.svg'),
                    ),
                    Text(
                      'Tambahkan Gambar',
                      style: TextStyles.body2(
                        color: ColorStyles.primary500,
                        weight: FontWeightOption.semiBold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            _isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                      color: ColorStyles.primary500,
                    ),
                  )
                : Buttons(
                    text: 'Cari Solusi',
                    onClicked: () {
                      setState(() {
                        _isLoading = true;
                      });
                      Future.delayed(const Duration(seconds: 3), () {
                        setState(() {
                          _isLoading = false;
                        });
                        Navigator.pop(context);
                        showErrorPopupAskBottomSheet(context);
                      });
                    },
                  ),
            SizedBox(
              height: 48.h,
            )
          ],
        ),
      ),
    );
  }
}
