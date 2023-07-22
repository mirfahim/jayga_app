
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jayga/modules/splash_screen/controller/splash_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';
import 'package:jayga/utils/ui_support.dart';


class SplashscreenView extends GetView<SplashscreenController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.find<SplashscreenController>();
    return Scaffold(
      backgroundColor: AppColors.appBackGroundBrn,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            // height: size.width * .35,
            // width: size.width * .35,
            Center(
              child: SizedBox(
                height: size.width * .50,
                width: size.width * .50,
                child: Image.asset("assets/images/jayga_logo.png"),
              ),
            ),

            // Image(
            //   height: 200,
            //   width: 200,
            //   image: AssetImage(
            //     'assets/Logow.png',
            //   ),
            // ),

            Positioned(
              bottom: 10,
              right: 0,
              left: 0,
              child: Ui.customLoaderSplash(),
            )
          ],
        ),
      ),
    );
  }
}
//
