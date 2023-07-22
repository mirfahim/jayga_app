import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jayga/modules/A_Base/view/my_booking_history/my_booking_screen.dart';
import 'package:jayga/modules/A_Base/view/profile/profile_screen.dart';
import 'package:jayga/modules/A_Base/view/saved_screen/saved_screen.dart';


import '../../../routes/app_pages.dart';
import '../../home/view/home_page_view.dart';


class BaseController extends GetxController {
  //TODO: Implement BaseController
  final landingPage = 1.obs;
  final currentIndex = 0.obs;
  final categoryDataLoaded = false.obs;

  List<Widget> pages = [
    HomePageView(),
    SavedView(),
    MyBookingView(),
    ProfileView(),

  ];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Widget get currentPage => pages[currentIndex.value];

  Future<void> changePageOutRoot(int index) async {
    currentIndex.value = index;
    await Get.offNamedUntil(Routes.BASE, (Route route) {
      if (route.settings.name == Routes.BASE) {
        return true;
      }
      return false;
    }, arguments: index);
  }
}
