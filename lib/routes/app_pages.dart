import 'package:get/get.dart';
import 'package:jayga/modules/A_Base/binding/base_binding.dart';
import 'package:jayga/modules/A_Base/view/base_view.dart';
import 'package:jayga/modules/A_Base/view/my_booking/my_booking_screen.dart';
import 'package:jayga/modules/A_Base/view/profile/profile_screen.dart';
import 'package:jayga/modules/A_Base/view/saved_screen/saved_screen.dart';
import 'package:jayga/modules/auth/binding/auth_binding.dart';
import 'package:jayga/modules/auth/view/otp_page.dart';
import 'package:jayga/modules/auth/view/sign_page.dart';
import 'package:jayga/modules/home/binding/home_binding.dart';
import 'package:jayga/modules/home/view/home_page_view.dart';
import 'package:jayga/modules/splash_screen/binding/splash_binding.dart';
import 'package:jayga/modules/splash_screen/view/splash_screeen_view.dart';



part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () =>  SplashscreenView(),
      binding: SplashscreenBinding(),
    ),

    GetPage(
      name: _Paths.HOME,
      page: () =>  HomePageView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BASE,
      page: () =>  BaseView(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: _Paths.SAVEDSCREEN,
      page: () =>  SavedView(),
      binding: BaseBinding(),
    ),

    GetPage(
      name: _Paths.MYBOOKING,
      page: () =>  MyBookingView(),
      binding: BaseBinding(),
    ),


    GetPage(
      name: _Paths.PROFILE,
      page: () =>  ProfileView(),
      binding: BaseBinding(),
    ),

    GetPage(
      name: _Paths.OTPPAGE,
      page: () =>  OTPView(),
      binding: AuthBinding(),
    ),



  ];
}
