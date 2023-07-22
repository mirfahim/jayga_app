import 'package:flutter/material.dart';
import 'package:get/get.dart';



class HomeController extends GetxController {
  //TODO: Implement LoginController

  var JobData = TextEditingController().obs;
  var passController = TextEditingController().obs;
  final visible = 0.obs;
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
