import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:jayga/modules/A_Base/view/profile/profile_screen.dart';
import 'package:jayga/modules/A_Base/view/saved_screen/saved_screen.dart';


import '../../../routes/app_pages.dart';
import '../../home/view/home_page_view.dart';


class BookingController extends GetxController {
  //TODO: Implement BaseController
  final landingPage = 1.obs;
  final currentIndex = 0.obs;
  final categoryDataLoaded = false.obs;
  final seeAmenities = false.obs;


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


}
