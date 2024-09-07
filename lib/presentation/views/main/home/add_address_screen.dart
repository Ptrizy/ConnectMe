import 'package:connectme/core/router/path.dart';
import 'package:connectme/core/styles/color.dart';
import 'package:connectme/core/styles/text.dart';
import 'package:connectme/presentation/widgets/button.dart';
import 'package:connectme/presentation/widgets/option_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final ScrollController _scrollController = ScrollController();
  final FocusNode _textFieldFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _textFieldFocusNode.addListener(() {
      if (_textFieldFocusNode.hasFocus) {
        _scrollToTextField();
      }
    });
  }

  void _scrollToTextField() {
    Future.delayed(const Duration(milliseconds: 300), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> addressOptions = ['Rumah', 'Kantor'];

    return GestureDetector(
      onDoubleTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16.h, left: 24.w, right: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => context.go(RoutePath.mainPage),
                      child: SizedBox(
                        width: 24.w,
                        height: 24.h,
                        child: SvgPicture.asset('assets/icons/caret-left.svg'),
                      ),
                    ),
                    Text(
                      'Pilih Lokasi',
                      style: TextStyles.heading3(
                        weight: FontWeightOption.semiBold,
                      ),
                    ),
                    SizedBox(width: 24.w, height: 24.h)
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: Stack(
                  children: [
                    // Map
                    Positioned(
                      top: 0,
                      child: SizedBox(
                        width: 393.w,
                        height: 356.h,
                        child: Image.asset(
                          'assets/location-example.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    // Address Details Container
                    Positioned(
                      top: 324,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorStyles.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(24.r),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(24.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Alamat Detail',
                                  style: TextStyles.heading3(),
                                ),
                                SizedBox(height: 16.h),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10.h,
                                    horizontal: 16.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    border: Border.all(
                                      width: 1,
                                      color: ColorStyles.neutral300,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/location-24.svg',
                                        width: 24.w,
                                        height: 24.h,
                                      ),
                                      SizedBox(width: 8.w),
                                      Expanded(
                                        child: Text(
                                          'Jl Cengkeh No 22, Lowokwaru, Malang',
                                          style: TextStyles.body2(
                                            weight: FontWeightOption.regular,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Row(
                                  children: [
                                    OptionSelection(
                                        isSmall: true, data: addressOptions)
                                  ],
                                ),
                                SizedBox(height: 16.h),
                                TextField(
                                  style: TextStyles.body1(
                                      weight: FontWeightOption.regular),
                                  focusNode: _textFieldFocusNode,
                                  decoration: InputDecoration(
                                    hintText:
                                        'Tambahkan detail mengenai alamat anda seperti cat rumah dan lain sebagainya',
                                    hintStyle: TextStyles.body1(
                                        color: ColorStyles.neutral600,
                                        weight: FontWeightOption.regular),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8.r),
                                      ),
                                      borderSide: const BorderSide(
                                          color: ColorStyles.neutral300,
                                          width: 1),
                                    ),
                                  ),
                                  maxLines: 3,
                                ),
                                SizedBox(height: 16.h),
                                Buttons(
                                  text: 'Konfirmasi',
                                  onClicked: () =>
                                      context.go(RoutePath.orderProductPage),
                                ),
                                SizedBox(height: 100.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
