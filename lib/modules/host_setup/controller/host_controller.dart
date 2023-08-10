import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:jayga/modules/A_Base/view/profile/profile_screen.dart';
import 'package:jayga/modules/A_Base/view/saved_screen/saved_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import '../../../routes/app_pages.dart';
import '../../home/view/home_page_view.dart';


class HostController extends GetxController {
  //TODO: Implement BaseController
  final pageIndex = 1.obs;
  final currentIndex = 0.obs;
  final categoryDataLoaded = false.obs;
  final seeAmenities = false.obs;
  var nameController = TextEditingController().obs;
  Completer<GoogleMapController> controllerMap = Completer();
  static final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
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
