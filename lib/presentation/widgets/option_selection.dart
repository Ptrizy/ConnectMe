import 'package:connectme/core/styles/color.dart';
import 'package:connectme/core/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OptionSelection extends StatefulWidget {
  final List<String> data;
  final bool isSmall;
  const OptionSelection({
    super.key,
    required this.isSmall,
    required this.data,
  });

  @override
  State<OptionSelection> createState() => _OptionSelectionState();
}

class _OptionSelectionState extends State<OptionSelection> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children:
              widget.data.map((data) => _buildContainerOption(data)).toList(),
        ),
      ],
    );
  }

  Widget _buildContainerOption(String selectedOption) {
    final isSelected = selectedOption == selected;
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = selectedOption;
        });
      },
      child: Container(
        padding: widget.isSmall
            ? EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h)
            : EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? ColorStyles.primary100 : ColorStyles.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color:
                  isSelected ? ColorStyles.primary500 : ColorStyles.neutral300,
              width: 1),
        ),
        child: Text(
          selectedOption,
          style: widget.isSmall
              ? TextStyles.body3(
                  color: isSelected
                      ? ColorStyles.primary500
                      : ColorStyles.neutral600,
                  weight: FontWeightOption.semiBold,
                )
              : TextStyles.body1(
                  color: isSelected
                      ? ColorStyles.primary500
                      : ColorStyles.neutral600,
                  weight: FontWeightOption.semiBold,
                ),
        ),
      ),
    );
  }
}
