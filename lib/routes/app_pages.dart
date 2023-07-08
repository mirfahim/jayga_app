import 'package:get/get.dart';
import 'package:jayga/modules/auth/binding/auth_binding.dart';
import 'package:jayga/modules/auth/view/sign_page.dart';
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

  ];
}
