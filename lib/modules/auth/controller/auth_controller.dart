import 'dart:async';
import 'dart:math';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../models/auth/login_model.dart';
import '../../../repositories/auth/auth_rep.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth_services.dart';



class AuthController extends GetxController {
  //TODO: Implement LoginController
  EmailOTP myauth = EmailOTP();
  var JobData = TextEditingController().obs;
  var phoneNumCOntroller = TextEditingController().obs;
  var email = TextEditingController().obs;
  var passController = TextEditingController().obs;
  var dateController = TextEditingController().obs;
  var pinCodeController = TextEditingController().obs;
  final registerToken = "".obs;
  final formKey = GlobalKey<FormState>();
  final visibleForLogin = 0.obs;
  final visibleForGoogle = 0.obs;
  final visibleForFB = 0.obs;
  final visibleOTP = 0.obs;
  final visibleRegister = 0.obs;

  final otpNum = 0.obs;
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
  loginController() async{
    visibleForLogin.value++;
    AuthRepository().userLogin(phoneNumCOntroller.value.text).then((e) async{

      print("my login data $e");
      if(e != null){
        var data = LoginModel.fromJson(e);
        await Get.find<AuthService>().setUser(data);
        visibleForLogin.value = 0;
        //print("hlw bro ++++++++++ ${Get.find<AuthService>().isAuth.toString()}");

        if(data.message == "User already exists") {
          Get.offAllNamed(Routes.BASE);
        } else {
         registerToken.value = e['user']["bearer_token"];
          Get.offAllNamed(Routes.REGISTER);
        }

      } else {
        print("error ++++++++++++++");
        visibleForLogin.value = 0;

      }

    });
  }
  makeRandomOtpNUm(){
    var rng = new Random();
    otpNum.value =  rng.nextInt(900000) + 100000;
    print("my otp code is ${otpNum.value}");
    sendOtpWithMuthoFun() ;
  }
  sendOtpWithMuthoFun() async{
    visibleOTP.value++;
    AuthRepository().sendOtpWithMuthoFun(phoneNumCOntroller.value.text, otpNum.value.toString() ).then((e) async{
      print("hlw muthofun1");
      if(e['message']== "SMS queued successfully!"){
        print("hlw muthofun2");
        visibleOTP.value = 0;
        Get.toNamed(Routes.OTPPAGE);

      }else {
        print("hlw muthofun3");
        visibleOTP.value = 0;
      }

      print("my login data $e");


    });
  }
  otpMatchControlle(){

  }

  registerController() async{
    visibleRegister.value++;
    AuthRepository().registerRep(phoneNumCOntroller.value.text, phoneNumCOntroller.value.text, phoneNumCOntroller.value.text, registerToken.value).then((e) async{

      print("my registerr data $e");
      if(e != null){

        visibleRegister.value = 0;



          Get.offAllNamed(Routes.BASE);



      } else {
        print("error ++++++++++++++");
        visibleRegister.value = 0;

      }

    });
  }
}
