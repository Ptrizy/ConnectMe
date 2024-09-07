import 'package:connectme/core/styles/color.dart';
import 'package:connectme/core/styles/text.dart';
import 'package:connectme/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkersServicesOption {
  final String name;
  final int price;
  bool isSelected;

  WorkersServicesOption(
      {required this.name, required this.price, this.isSelected = false});
}

void showServiceSelectionBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: ColorStyles.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
    ),
    builder: (BuildContext context) {
      return const ServiceSelectionBottomSheet();
    },
  );
}

class ServiceSelectionBottomSheet extends StatefulWidget {
  const ServiceSelectionBottomSheet({super.key});

  @override
  State<ServiceSelectionBottomSheet> createState() =>
      _ServiceSelectionBottomSheetState();
}

class _ServiceSelectionBottomSheetState
    extends State<ServiceSelectionBottomSheet> {
  final List<WorkersServicesOption> services = [
    WorkersServicesOption(name: 'Home Visit + Cek Kerusakan', price: 25000),
    WorkersServicesOption(name: 'Full Cleaning', price: 200000),
    WorkersServicesOption(name: 'Ganti Pasta Processor', price: 80000),
    WorkersServicesOption(name: 'Servis Keyboard Laptop', price: 150000),
    WorkersServicesOption(name: 'Servis Layar LCD', price: 300000),
    WorkersServicesOption(name: 'Servis Baterai', price: 250000),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 32.h, left: 24.w, right: 24.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pilih Layanan', style: TextStyles.heading3()),
          SizedBox(height: 16.h),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: services.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                  title: Row(
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: Container(
                            width: 64.w, height: 64.h, color: Colors.grey[300]),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              services[index].name,
                              style: TextStyles.body1(
                                weight: FontWeightOption.regular,
                              ),
                            ),
                            Text(
                              'Rp ${services[index].price}',
                              style: TextStyles.body2(
                                color: ColorStyles.primary500,
                                weight: FontWeightOption.semiBold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  value: services[index].isSelected,
                  onChanged: (bool? value) {
                    setState(() {
                      services[index].isSelected = value ?? false;
                    });
                  },
                  activeColor: ColorStyles.primary500,
                );
              },
            ),
          ),
          SizedBox(height: 24.h),
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
