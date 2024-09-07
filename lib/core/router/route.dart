import 'package:connectme/core/router/name.dart';
import 'package:connectme/core/router/path.dart';
import 'package:connectme/presentation/views/authentication/email_verif_screen.dart';
import 'package:connectme/presentation/views/authentication/forget_pass_screen.dart';
import 'package:connectme/presentation/views/authentication/forgot_pass_verif_screen.dart';
import 'package:connectme/presentation/views/authentication/login_screen.dart';
import 'package:connectme/presentation/views/authentication/new_pass_screen.dart';
import 'package:connectme/presentation/views/authentication/signup_screen.dart';
import 'package:connectme/presentation/views/authentication/success_screen.dart';
import 'package:connectme/presentation/views/boarding/boarding_screen.dart';
import 'package:connectme/presentation/views/boarding/splash_screen.dart';
import 'package:connectme/presentation/views/main/home/add_address_screen.dart';
import 'package:connectme/presentation/views/main/home/favorite_screen.dart';
import 'package:connectme/presentation/views/main/home/notification_screen.dart';
import 'package:connectme/presentation/views/main/home/order_product_screen.dart';
import 'package:connectme/presentation/views/main/home/product_detail_screen.dart';
import 'package:connectme/presentation/views/main/main_view.dart';
import 'package:connectme/presentation/views/main/order/chat_screen.dart';
import 'package:connectme/presentation/views/main/order/review_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: RoutePath.splashPage,
  routes: [
    GoRoute(
      path: RoutePath.splashPage,
      name: RouteName.splashPage,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RoutePath.boardingPage,
      name: RouteName.boardingPage,
      builder: (context, state) => const BoardingScreen(),
    ),
    GoRoute(
      path: RoutePath.loginPage,
      name: RouteName.loginPage,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: RoutePath.signupPage,
      name: RouteName.signupPage,
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: RoutePath.mainPage,
      name: RouteName.mainPage,
      builder: (context, state) => const MainView(),
    ),
    GoRoute(
      path: RoutePath.emailVerifPage,
      name: RouteName.emailVerifPage,
      builder: (context, state) => const EmailVerifScreen(),
    ),
    GoRoute(
      path: RoutePath.successPage,
      name: RouteName.successPage,
      builder: (context, state) {
        final content = state.extra as Widget;
        return SuccessScreen(column: content);
      },
    ),
    GoRoute(
      path: RoutePath.forgotPassPage,
      name: RouteName.forgotPassPage,
      builder: (context, state) => const ForgetPassScreen(),
    ),
    GoRoute(
      path: RoutePath.forgotPassVerifPage,
      name: RouteName.forgotPassVerifPage,
      builder: (context, state) => const ForgotPassVerifScreen(),
    ),
    GoRoute(
      path: RoutePath.newPassPage,
      name: RouteName.newPassPage,
      builder: (context, state) => const NewPassScreen(),
    ),
    GoRoute(
      path: RoutePath.productDetailPage,
      name: RouteName.productDetailPage,
      builder: (context, state) => const ProductDetailScreen(),
    ),
    GoRoute(
      path: RoutePath.orderProductPage,
      name: RouteName.orderProductPage,
      builder: (context, state) => const OrderProductScreen(),
    ),
    GoRoute(
      path: RoutePath.addAddressPage,
      name: RouteName.addAddressPage,
      builder: (context, state) => const AddAddressScreen(),
    ),
    GoRoute(
      path: RoutePath.notificationPage,
      name: RouteName.notificationPage,
      builder: (context, state) => const NotificationScreen(),
    ),
    GoRoute(
      path: RoutePath.favoritePage,
      name: RouteName.favoritePage,
      builder: (context, state) => const FavoriteScreen(),
    ),
    GoRoute(
      path: RoutePath.reviewPage,
      name: RouteName.reviewPage,
      builder: (context, state) => const ReviewScreen(),
    ),
    GoRoute(
      path: RoutePath.chatPage,
      name: RouteName.chatPage,
      builder: (context, state) => const ChatScreen(),
    ),
  ],
);
