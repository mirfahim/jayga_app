import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:jayga/models/booking_history_model.dart';
import 'package:jayga/models/lister_model.dart';
import 'package:jayga/models/listing/get_listing_images_model.dart';
import 'package:jayga/models/profile/profile_model.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/utils/ui_support.dart';
import 'package:ml_kit_ocr/ml_kit_ocr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:jayga/modules/A_Base/view/saved_screen/saved_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jayga/repositories/listing_rep.dart';

import '../../../models/listing/get_lister_profile_listing_model.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth_services.dart';
import '../../home/view/home_page_view.dart';

class PaymentController extends GetxController {
  //TODO: Implement BaseController

  // end form

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

  refreshController() {

  }



}
