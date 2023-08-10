import 'dart:async';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';



class AuthController extends GetxController {
  //TODO: Implement LoginController
  EmailOTP myauth = EmailOTP();
  var JobData = TextEditingController().obs;
  var email = TextEditingController().obs;
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
  sendOTP(BuildContext context) async {
    print("otp is sending to ${email.value.text.toString()}");
    myauth.setConfig(
        appEmail: "majorrip0@gmail.com",
        appName: "Jayga Ltd",
        userEmail: email.value.text.toString(),
        otpLength: 6,
        otpType: OTPType.digitsOnly);
    if (await myauth.sendOTP() == true) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("OTP has been sent to ${email.value.text.toString()}"),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Oops, OTP send failed"),
      ));
    }
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
