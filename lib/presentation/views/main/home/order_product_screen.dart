import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:connectme/core/router/path.dart';
import 'package:connectme/core/styles/color.dart';
import 'package:connectme/core/styles/text.dart';
import 'package:connectme/presentation/widgets/button.dart';
import 'package:connectme/presentation/widgets/pills.dart';
import 'package:connectme/presentation/widgets/option_selection.dart';
import 'package:connectme/presentation/widgets/popup_payment.dart';
import 'package:connectme/presentation/widgets/workers_services_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class OrderProductScreen extends StatefulWidget {
  const OrderProductScreen({super.key});

  @override
  State<OrderProductScreen> createState() => _OrderProductScreenState();
}

class _OrderProductScreenState extends State<OrderProductScreen> {
  List<DateTime?> _dates = [];

  final List<String> timeOptions = [
    '10.00 WIB',
    '12.00 WIB',
    '14.00 WIB',
    '16.00 WIB'
  ];

  Future<void> _openDatePicker() async {
    var results = await showCalendarDatePicker2Dialog(
      context: context,
      dialogBackgroundColor: ColorStyles.white,
      config: CalendarDatePicker2WithActionButtonsConfig(
        calendarType: CalendarDatePicker2Type.single,
        selectedDayHighlightColor: ColorStyles.primary500,
        centerAlignModePicker: false,
        dayTextStyle: TextStyles.heading3(
          weight: FontWeightOption.regular,
        ),
        weekdayLabelTextStyle: TextStyles.body3(
          weight: FontWeightOption.semiBold,
          color: ColorStyles.neutral600,
        ),
        weekdayLabels: [
          'SUN',
          'MON',
          'TUE',
          'WED',
          'THU',
          'FRI',
          'SAT',
        ],
        controlsTextStyle: TextStyles.body1(
          weight: FontWeightOption.semiBold,
        ),
        nextMonthIcon: SvgPicture.asset(
          'assets/icons/caret-right-primary.svg',
        ),
        lastMonthIcon: SvgPicture.asset(
          'assets/icons/caret-left-primary.svg',
        ),
        selectedDayTextStyle: TextStyles.heading3(
          weight: FontWeightOption.regular,
          color: ColorStyles.white,
        ),
        buttonPadding: EdgeInsets.only(right: 20.w),
        okButton: Buttons(
          text: 'Konfirmasi',
          width: 320,
          onClicked: () {
            Navigator.of(context).pop();
          },
        ),
        cancelButton: const Stack(),
        controlsHeight: 60.0,
      ),
      dialogSize: Size(393.w, 480.h),
      value: _dates,
      borderRadius: BorderRadius.circular(24.r),
    );

    if (results != null) {
      setState(() {
        _dates = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(
            top: 60.h,
            left: 24.w,
            right: 24.w,
          ),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: SvgPicture.asset('assets/icons/caret-left.svg'),
                    ),
                    Text(
                      'Sewa Tukang',
                      style: TextStyles.heading3(
                        weight: FontWeightOption.semiBold,
                      ),
                    ),
                    SizedBox(
                      width: 24.w,
                      height: 24.h,
                    )
                  ],
                ),
                SizedBox(
                  height: 32.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'DETAIL TUKANG',
                    style: TextStyles.caption(
                      color: ColorStyles.neutral800,
                      weight: FontWeightOption.regular,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                const CardDetailTukang(),
                Padding(
                  padding: EdgeInsets.only(top: 24.h, bottom: 16.h),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'DETAIL TUKANG',
                      style: TextStyles.caption(
                        color: ColorStyles.neutral800,
                        weight: FontWeightOption.regular,
                      ),
                    ),
                  ),
                ),
                WorkersDetailOption(
                  label: 'Layanan Tukang',
                  hintText: 'Pilih Layanan',
                  assetPath: 'assets/icons/caret-right-24.svg',
                  onTap: () {
                    showServiceSelectionBottomSheet(context);
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                WorkersDetailOption(
                  label: 'Alamat',
                  hintText: 'Pilih Alamat',
                  assetPath: 'assets/icons/location-24.svg',
                  onTap: () {
                    context.go(
                      RoutePath.addAddressPage,
                    );
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                WorkersDetailOption(
                  label: 'Tanggal Sewa',
                  hintText: 'Pilih Tanggal',
                  assetPath: 'assets/icons/calendar-24.svg',
                  onTap: () {
                    _openDatePicker();
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Waktu Sewa',
                    style: TextStyles.body1(),
                  ),
                ),
                SizedBox(height: 4.h),
                OptionSelection(
                  isSmall: false,
                  data: timeOptions,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 24.h,
                    bottom: 45.h,
                  ),
                  child: Buttons(
                      text: 'Sewa Tukang',
                      onClicked: () {
                        showPopupPaymentBottomSheet(context);
                      }),
                )
              ],
            ),
          )),
    );
  }
}

class WorkersDetailOption extends StatelessWidget {
  final String label;
  final String hintText;
  final String assetPath;
  final VoidCallback onTap;
  const WorkersDetailOption({
    super.key,
    required this.label,
    required this.hintText,
    required this.assetPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.body1(),
        ),
        SizedBox(
          height: 4.h,
        ),
        GestureDetector(
          onTap: onTap,
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
                  Text(
                    hintText,
                    style: TextStyles.body1(
                      color: ColorStyles.neutral600,
                      weight: FontWeightOption.regular,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: SvgPicture.asset(assetPath),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CardDetailTukang extends StatelessWidget {
  const CardDetailTukang({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 111.h,
      decoration: BoxDecoration(
        color: ColorStyles.primary500,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 17.h),
        child: Row(
          children: [
            SizedBox(
              width: 80.w,
              height: 74.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: Image.asset(
                  'assets/users/photo-example-1.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bambang Jatmiko',
                  style: TextStyles.body1(color: ColorStyles.white),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.h, bottom: 8.h),
                  child: Text(
                    'Servis Laptop/Komputer',
                    style: TextStyles.body2(
                      color: ColorStyles.neutral100,
                      weight: FontWeightOption.regular,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Pills(
                      label: 'Elektronik',
                      type: PillsType.defaults,
                      isFontSizeSmall: true,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 16.w,
                            height: 16.h,
                            child: SvgPicture.asset('assets/icons/star.svg'),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            '4.9 (1k)',
                            style: TextStyles.body2(
                              color: ColorStyles.white,
                              weight: FontWeightOption.regular,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
