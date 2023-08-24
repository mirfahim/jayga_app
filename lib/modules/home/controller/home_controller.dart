import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jayga/models/listing_model.dart';
import 'package:jayga/repositories/listing_rep.dart';

import '../../../models/listing_model.dart';




class HomeController extends GetxController {
  //TODO: Implement LoginController

  var JobData = TextEditingController().obs;
  var passController = TextEditingController().obs;
  final visible = 0.obs;
  final listingData = <Listing>[].obs;
  final seeListView = false.obs;
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
