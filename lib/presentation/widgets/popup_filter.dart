import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:connectme/core/styles/color.dart';
import 'package:connectme/core/styles/text.dart';
import 'package:connectme/presentation/widgets/button.dart';
import 'package:flutter_svg/flutter_svg.dart';

void showPopupFilterBottomSheet(BuildContext context) {
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
        child: const PopupFilterBottomSheet(),
      );
    },
  );
}

class PopupFilterBottomSheet extends StatefulWidget {
  const PopupFilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<PopupFilterBottomSheet> createState() => _PopupFilterBottomSheetState();
}

class _PopupFilterBottomSheetState extends State<PopupFilterBottomSheet> {
  bool _isLoading = false;

  Widget _buildFilterChip(String label) {
    return Container(
      margin: EdgeInsets.only(right: 8.w, bottom: 8.h),
      child: FilterChip(
        label: Text(label),
        onSelected: (_) {},
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: BorderSide(color: ColorStyles.neutral300, width: 1.5.w),
        ),
        labelStyle: TextStyles.body3(
          color: ColorStyles.neutral600,
          weight: FontWeightOption.regular,
        ),
      ),
    );
  }

  Widget _buildStarRating(int rating) {
    return Container(
      margin: EdgeInsets.only(right: 8.w, bottom: 8.h),
      child: FilterChip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 16.w,
              height: 16.h,
              child: SvgPicture.asset('assets/icons/star.svg'),
            ),
            SizedBox(width: 4.w),
            Text('$rating keatas'),
          ],
        ),
        onSelected: (_) {},
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: BorderSide(color: ColorStyles.neutral300, width: 1.5.w),
        ),
        labelStyle: TextStyles.body3(
          color: ColorStyles.neutral600,
          weight: FontWeightOption.regular,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 32.h, left: 24.w, right: 24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Filter',
                    style: TextStyles.body1(weight: FontWeightOption.semiBold)),
                Text(
                  'Atur Ulang',
                  style: TextStyles.body2(
                    color: ColorStyles.primary500,
                    weight: FontWeightOption.semiBold,
                  ),
                )
              ],
            ),
            SizedBox(height: 24.h),
            Text('Urutkan',
                style: TextStyles.body1(weight: FontWeightOption.semiBold)),
            SizedBox(height: 8.h),
            Wrap(
              children: [
                _buildFilterChip('Paling Sesuai'),
                _buildFilterChip('Ulasan'),
                _buildFilterChip('Harga Tertinggi'),
                _buildFilterChip('Harga Terendah'),
              ],
            ),
            SizedBox(height: 16.h),
            Text('Kategori',
                style: TextStyles.body1(weight: FontWeightOption.semiBold)),
            SizedBox(height: 8.h),
            Wrap(
              children: [
                _buildFilterChip('Paling Sesuai'),
                _buildFilterChip('Ulasan'),
                _buildFilterChip('Harga Tertinggi'),
                _buildFilterChip('Harga Terendah'),
              ],
            ),
            SizedBox(height: 16.h),
            Text('Harga',
                style: TextStyles.body1(weight: FontWeightOption.semiBold)),
            SizedBox(height: 8.h),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Rp MIN',
                      hintStyle: TextStyles.body3(
                        color: ColorStyles.neutral600,
                        weight: FontWeightOption.regular,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(
                            color: ColorStyles.neutral300, width: 1.5.w),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: SizedBox(
                    width: 8.w,
                    height: 0.h,
                    child: Divider(
                      height: 1.h,
                      color: ColorStyles.neutral300,
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Rp MAX',
                      hintStyle: TextStyles.body3(
                        color: ColorStyles.neutral600,
                        weight: FontWeightOption.regular,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(
                            color: ColorStyles.neutral300, width: 1.5.w),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Text('Ulasan',
                style: TextStyles.body1(weight: FontWeightOption.semiBold)),
            SizedBox(height: 8.h),
            Wrap(
              children: [
                _buildStarRating(5),
                _buildStarRating(4),
                _buildStarRating(3),
                _buildStarRating(2),
                _buildStarRating(1),
              ],
            ),
            SizedBox(height: 24.h),
            _isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                      color: ColorStyles.primary500,
                    ),
                  )
                : Buttons(
                    text: 'Terapkan',
                    onClicked: () {
                      setState(() {
                        _isLoading = true;
                      });
                      Future.delayed(const Duration(seconds: 3), () {
                        setState(() {
                          _isLoading = false;
                        });
                        Navigator.pop(context);
                      });
                    },
                  ),
            SizedBox(height: 48.h),
          ],
        ),
      ),
    );
  }
}
