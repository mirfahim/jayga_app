import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';



class AuthController extends GetxController {
  //TODO: Implement LoginController

  var JobData = TextEditingController().obs;
  var passController = TextEditingController().obs;
  var dateController = TextEditingController().obs;
  var pinCodeController = TextEditingController().obs;

  final formKey = GlobalKey<FormState>();
  final visible = 0.obs;
  StreamController<ErrorAnimationType>? pinErrorController;
  @override
  void onInit() {
    pinErrorController = StreamController<ErrorAnimationType>();
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

  // loginController() async{
  //   visible.value++;
  //   AuthRepository().userLogin(JobData.value.text, passController.value.text).then((e) async{
  //
  //     print("my login data");
  //     if(e != null){
  //       var data = LoginModel.fromJson(e);
  //       await Get.find<AuthService>().setUser(data);
  //       visible.value = 0;
  //       print("hlw bro ++++++++++ ${Get.find<AuthService>().isAuth.toString()}");
  //       Get.offAllNamed(Routes.BASE);
  //     } else {
  //       print("error ++++++++++++++");
  //       visible.value = 0;
  //
  //     }
  //
  //   });
  // }
}
