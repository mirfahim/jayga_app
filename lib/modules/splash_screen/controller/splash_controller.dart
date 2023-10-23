import 'dart:async';

import 'package:get/get.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/routes/app_pages.dart';
import 'package:jayga/services/auth_services.dart';
import 'package:jayga/routes/app_pages.dart';
import 'package:jayga/services/auth_services.dart';


class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController

  @override
  Future<void> onInit() async {
    print('SplashscreenController.onInit');
  //Get.find<BookingController>().filterdListingController();
    Timer(const Duration(seconds: 3), () {

      if (Get.find<AuthService>().currentUser.value.user == null) {
        Get.offAllNamed(Routes.LANDING);
      } else {
        Get.offAllNamed(Routes.BASE);
      }
    });

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
