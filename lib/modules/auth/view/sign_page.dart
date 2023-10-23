import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/services/firebase_service.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';
import 'package:jayga/utils/ui_support.dart';

import '../../../routes/app_pages.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackGroundBrn,
      body: Obx(() {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.center,
                // color: AppColors.backgroundColor,
                child: Image.asset(
                  'assets/images/jayga_logo.png',
                  height: 100,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Login/Register",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Continue with Mobile/Email",
                style: TextStyle(
                    fontSize: 20,
                    color: AppColors.textColorGreen,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(16.0),

                  child: TextFormField(

                    maxLines: 1,
                    controller: controller.phoneNumCOntroller.value,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(

                      filled: true,
                      fillColor: AppColors.jaygaWhite,
                      focusColor: Colors.white,
                      labelText: 'Phone Number/Email',
                      // suffixIcon: Icon(
                      //   Icons.email_outlined,
                      // ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.trim().isEmpty)
                        return "Number is Required";
                      else if (!GetUtils.isEmail(value.trim()))
                        return "Please enter valid email";
                      else
                        return null;
                    },
                  ),

              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: () {
                  FirebaseService().logCustomEvent();
                  if(controller.phoneNumCOntroller.value.text.length < 11 ){
                    Get.showSnackbar(Ui.errorSnackBar(
                        message:"Please provide a valid phone no", title: 'Error'.tr));
                  }else {
                    controller.box.value.write('phone', controller.phoneNumCOntroller.value.text);
                    print("my phn no is${controller.phoneNumCOntroller.value.text}");
                    controller.makeRandomOtpNUm().then((e){

                      Get.offNamed(Routes.OTPPAGE);
                    });
                    //controller.sendOTP(context);

                  }

                  //controller.visible.value++;
                  // controller.loginController();
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  height: controller.visibleForLogin.value == 1 ? 50 : 60,
                  width: controller.visibleForLogin.value == 1
                      ? MediaQuery.of(context).size.width * .5
                      : MediaQuery.of(context).size.width * .9,
                  decoration: BoxDecoration(
                      color: AppColors.buttonColorYellow,
                      borderRadius: BorderRadius.circular(
                          controller.visibleForLogin.value == 1 ? 60 : 10)),
                  alignment: Alignment.center,
                  child: controller.visibleForLogin.value == 1
                      ? Center(child: CircularProgressIndicator())
                      : Text(
                          "Continue",
                          style: TextStyle(
                            color: AppColors.backgroundColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                ),
              ),
              Divider(),
              InkWell(
                onTap: () {

                 // Get.toNamed(Routes.REGISTER);
                  //controller.visible.value++;
                  // controller.loginController();
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  height: controller.visibleForGoogle.value == 1 ? 50 : 60,
                  width: controller.visibleForGoogle.value == 1
                      ? MediaQuery.of(context).size.width * .5
                      : MediaQuery.of(context).size.width * .9,
                  decoration: BoxDecoration(
                      color: AppColors.jaygaWhite,
                      borderRadius: BorderRadius.circular(
                          controller.visibleForGoogle.value == 1 ? 10 : 10)),
                  alignment: Alignment.center,
                  child: controller.visibleForGoogle.value == 1
                      ? Center(child: CircularProgressIndicator())
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              child: Image.asset(
                                'assets/icons/gmail.png',
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 200,
                              child: Text(
                                "Sign In With Gmail",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                //  Get.toNamed(Routes.OTPPAGE);
                  //controller.visible.value++;
                  // controller.loginController();
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  height: controller.visibleForFB.value == 1 ? 50 : 60,
                  width: controller.visibleForFB.value == 1
                      ? MediaQuery.of(context).size.width * .5
                      : MediaQuery.of(context).size.width * .9,
                  decoration: BoxDecoration(
                      color: AppColors.jaygaWhite,
                      borderRadius: BorderRadius.circular(
                          controller.visibleForFB.value == 1 ? 10 : 10)),
                  alignment: Alignment.center,
                  child: controller.visibleForFB.value == 1
                      ? Center(child: CircularProgressIndicator())
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              child: Image.asset(
                                'assets/icons/fb.png',
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 200,
                              child: Text(
                                "Sign In With Facebook",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
