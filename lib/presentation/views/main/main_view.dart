import 'package:connectme/core/styles/color.dart';
import 'package:connectme/core/styles/text.dart';
import 'package:connectme/presentation/views/main/home/home_screen.dart';
import 'package:connectme/presentation/views/main/kangbot/kangbot_screen.dart';
import 'package:connectme/presentation/views/main/order/order_screen.dart';
import 'package:connectme/presentation/views/main/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  late List<Widget> screens;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    screens = [
      const HomeScreen(),
      const OrderScreen(),
      const KangbotScreen(),
      const ProfileScreen(),
    ];

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: screens[currentIndex],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 66,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(71, 64, 66, 0.1),
                    blurRadius: 24,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(24)),
                child: BottomNavigationBar(
                  backgroundColor: Colors.white,
                  useLegacyColorScheme: false,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: currentIndex,
                  onTap: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                    _controller.reset();
                    _controller.forward();
                  },
                  showUnselectedLabels: true,
                  selectedLabelStyle: TextStyles.body3(
                    color: ColorStyles.primary500,
                    weight: FontWeightOption.semiBold,
                  ),
                  selectedItemColor: ColorStyles.primary500,
                  unselectedLabelStyle: TextStyles.body3(
                    color: ColorStyles.neutral500,
                    weight: FontWeightOption.regular,
                  ),
                  unselectedItemColor: ColorStyles.neutral500,
                  items: [
                    _buildAnimatedNavItem(
                      index: 0,
                      inactiveIcon: 'assets/icons/home-nav-inactive.svg',
                      activeIcon: 'assets/icons/home-nav-active.svg',
                      label: "Beranda",
                    ),
                    _buildAnimatedNavItem(
                      index: 1,
                      inactiveIcon: 'assets/icons/order-nav-inactive.svg',
                      activeIcon: 'assets/icons/order-nav-active.svg',
                      label: "Pesanan",
                    ),
                    _buildAnimatedNavItem(
                      index: 2,
                      inactiveIcon: 'assets/icons/kangbot-nav-inactive.svg',
                      activeIcon: 'assets/icons/kangbot-nav-active.svg',
                      label: "KangBot",
                    ),
                    _buildAnimatedNavItem(
                      index: 3,
                      inactiveIcon: 'assets/icons/profile-nav-inactive.svg',
                      activeIcon: 'assets/icons/profile-nav-active.svg',
                      label: "Profil",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildAnimatedNavItem({
    required int index,
    required String inactiveIcon,
    required String activeIcon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(inactiveIcon),
      activeIcon: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            width: 60.w,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 2.w * _animation.value,
                  color: ColorStyles.primary500,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 4.h * _animation.value),
              child: SvgPicture.asset(activeIcon),
            ),
          );
        },
      ),
      label: label,
    );
  }
}
