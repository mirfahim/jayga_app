import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/A_Base/controller/base_controller.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/modules/splash_screen/controller/splash_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

import '../../../routes/app_pages.dart';

class LandingView extends GetView<BaseController> {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackGroundBrn,
      body: Obx(
         () {
          return SingleChildScrollView(
              child: Column(
                children: [

                  Stack(
                    children: [
                      Container(

                        // color: AppColors.backgroundColor,
                        child: controller.landingPage == 1 ?
                        Image.asset(
                          'assets/images/landing1.png',
                          height: MediaQuery.of(context).size.height *.7,
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width,
                        )
                            : controller.landingPage == 2 ? Image.asset(
                          'assets/images/landing2.png',
                          height: MediaQuery.of(context).size.height *.7,
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width,
                        ) : Image.asset(
                          'assets/images/landing3.png',
                          height: MediaQuery.of(context).size.height *.7,
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      Positioned(
                        child:   Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.width * .50,
                          width: MediaQuery.of(context).size.width * .50,
                          child: Image.asset("assets/images/jayga_logo.png"),
                        ),
                      ),)
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Choose from over",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "500+ Properties",
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColors.textColorBlack,
                        fontWeight: FontWeight.normal),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: controller.landingPage.value == 1 ? AppColors.textColorGreen: Colors.white
                      ),
                      SizedBox(width: 5,),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: controller.landingPage.value == 2? AppColors.textColorGreen:Colors.white,
                      ),
                      SizedBox(width: 5,),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor:controller.landingPage.value == 3 ?AppColors.textColorGreen:Colors.white ,
                      ),
                    ],
                  ),


                  SizedBox(height: 20,),
                  InkWell(
                    onTap: () {
                      if(controller.landingPage.value == 1) {
                        controller.landingPage.value = 2;
                      } else if (controller.landingPage.value == 2){
                        controller.landingPage.value = 3;
                      } else if (controller.landingPage.value == 3){
                        Get.offAndToNamed(Routes.LOGIN);
                      }

                      //controller.visible.value++;
                      // controller.loginController();
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 2),
                      height:  60,
                      width:  MediaQuery.of(context).size.width * .9,
                      decoration: BoxDecoration(
                          color: AppColors.textColorGreen,
                          borderRadius: BorderRadius.circular(10)),
                      alignment: Alignment.center,
                      child:  Text(
                        "Continue",
                        style: TextStyle(
                          color: AppColors.backgroundColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            );
        }
      ),

    );
  }
}
