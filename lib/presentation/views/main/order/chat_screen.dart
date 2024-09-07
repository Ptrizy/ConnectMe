import 'package:connectme/core/router/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:connectme/core/styles/color.dart';
import 'package:connectme/core/styles/text.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Widget> _messages = [
    const TimeLimiter(),
    const UserSenderMessage(
      message:
          'Halo, apakah anda bisa melakukan full cleaning pada laptop saya?',
      time: '08.30',
    ),
    const UserReceiverMessage(
      message: 'Saya bisa melakukan, silahkan langsung pesan jasa saya.',
      time: '10.12',
    ),
  ];

  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _messages.add(
        UserSenderMessage(
          message: text,
          time:
              '${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}',
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 54.h),
            child: Container(
              width: double.infinity,
              height: 56.h,
              color: ColorStyles.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => context.go(
                            RoutePath.mainPage,
                          ),
                          child: SizedBox(
                            width: 24.w,
                            height: 24.h,
                            child:
                                SvgPicture.asset('assets/icons/caret-left.svg'),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100.r)),
                              child: Image.asset(
                                'assets/profile-photo.png',
                                width: 24.w,
                                height: 24.h,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'Bambang Jatmiko',
                              style: TextStyles.body1(
                                weight: FontWeightOption.semiBold,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: SvgPicture.asset('assets/icons/dots-three.svg'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: ColorStyles.neutral100,
              child: ListView.builder(
                padding: EdgeInsets.only(top: 16.h, left: 24.w, right: 24.w),
                itemCount: _messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return _messages[index];
                },
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: ColorStyles.white,
              border: Border(
                top: BorderSide(color: ColorStyles.neutral300, width: 1),
              ),
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: ColorStyles.neutral300, width: 1),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: ColorStyles.neutral100,
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: SvgPicture.asset(
                      'assets/icons/smiley.svg',
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: 'Tulis Pesan',
                        hintStyle: TextStyles.body2(
                          color: ColorStyles.neutral600,
                          weight: FontWeightOption.regular,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                      ),
                      onSubmitted: _handleSubmitted,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/image.svg',
                          width: 24.w,
                          height: 24.h,
                        ),
                        SizedBox(width: 8.w),
                        SvgPicture.asset(
                          'assets/icons/paperclip.svg',
                          width: 24.w,
                          height: 24.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8.w),
          SvgPicture.asset(
            'assets/icons/microphone.svg',
            width: 24.w,
            height: 24.h,
          ),
        ],
      ),
    );
  }
}

class UserReceiverMessage extends StatelessWidget {
  final String message;
  final String time;

  const UserReceiverMessage({
    super.key,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(top: 16.h),
        child: Container(
          width: 280,
          decoration: BoxDecoration(
            color: ColorStyles.neutral300,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.r),
                bottomLeft: Radius.circular(8.r),
                bottomRight: Radius.circular(8.r)),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  message,
                  style: TextStyles.body2(
                    color: ColorStyles.black,
                    weight: FontWeightOption.regular,
                  ),
                ),
                Text(
                  time,
                  style: GoogleFonts.workSans(
                      color: ColorStyles.neutral600,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserSenderMessage extends StatelessWidget {
  final String message;
  final String time;

  const UserSenderMessage({
    super.key,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(top: 16.h),
        child: Container(
          width: 280,
          decoration: BoxDecoration(
            color: ColorStyles.primary500,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                bottomLeft: Radius.circular(8.r),
                bottomRight: Radius.circular(8.r)),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  message,
                  style: TextStyles.body2(
                    color: ColorStyles.white,
                    weight: FontWeightOption.regular,
                  ),
                ),
                Text(
                  time,
                  style: GoogleFonts.workSans(
                      color: ColorStyles.neutral100,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TimeLimiter extends StatelessWidget {
  const TimeLimiter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: ColorStyles.neutral300,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          child: Text(
            'Hari ini',
            style: TextStyles.body3(
                color: ColorStyles.neutral600,
                weight: FontWeightOption.regular),
          ),
        ),
      ),
    );
  }
}
