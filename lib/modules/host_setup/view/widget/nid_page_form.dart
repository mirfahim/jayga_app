import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/booking/view/all_alemnities.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/modules/host_setup/controller/host_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

class NidFormView extends GetView<HostController> {
  const NidFormView({Key? key}) : super(key: key);
//index1
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Obx(() {
      return Container(
        color: AppColors.appBackGroundBrn,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 1.2,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Please complete your account details",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Please complete your account information to host your own place.",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Text(
                          "1.",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: Get.size.height * .25,
                          width: Get.size.width * .75,
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 14, left: 20, right: 20),
                          margin: const EdgeInsets.only(
                              left: 15, right: 15, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: AppColors.jaygaTextFldColor),
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      const Color(0xFF652981).withOpacity(0.2),
                                  blurRadius: 2,
                                  offset: const Offset(0, 2)),
                            ],
                            //   border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "NID Front Image".tr,
                                style: Get.textTheme.bodyText1,
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  showPopup(context, 'nid_front');
                                  // controller.getImage(ImageSource.camera, 'nid_front');
                                  // controller.readNId();
                                  // controller.readNId();
                                },
                                child: controller.nidPic.value.isNotEmpty
                                    ? Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.memory(
                                              base64Decode(
                                                controller.nidPic.value,
                                              ),
                                              height: Get.size.width * .35,
                                              width: Get.size.width * .7,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          Text(
                                              "Your NID no is: ${controller.userData.value.nid}")
                                        ],
                                      )
                                    : Stack(
                                        children: [
                                          Image.asset(
                                            'assets/images/nid.png',
                                            height: Get.size.width * .3,
                                            width: Get.size.width * .6,
                                            color: AppColors.textColorGrey,
                                          ),
                                          Positioned(
                                              bottom: 10,
                                              right: 80,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: AppColors
                                                        .jaygaTextFldColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.camera_alt,
                                                    color: AppColors
                                                        .textColorWhite,
                                                  ),
                                                ),
                                              ))
                                        ],
                                      ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          "2.",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: Get.size.height * .25,
                          width: Get.size.width * .75,
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 14, left: 20, right: 20),
                          margin: const EdgeInsets.only(
                              left: 15, right: 15, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: AppColors.jaygaTextFldColor),
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      const Color(0xFF652981).withOpacity(0.2),
                                  blurRadius: 2,
                                  offset: const Offset(0, 2)),
                            ],
                            //   border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Take Selfie".tr,
                                style: Get.textTheme.bodyText1,
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  showPopup(context, 'lister_image');
                                  // controller.getImage(ImageSource.camera, 'nid_front');
                                  // controller.readNId();
                                  // controller.readNId();
                                },
                                child: controller.lister_image.value.isNotEmpty
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.memory(
                                          base64Decode(
                                            controller.lister_image.value,
                                          ),
                                          height: Get.size.width * .4,
                                          width: Get.size.width * .7,
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                    : Stack(
                                        children: [
                                          Image.asset(
                                            'assets/images/nid.png',
                                            height: Get.size.width * .3,
                                            width: Get.size.width * .6,
                                            color: AppColors.textColorGrey,
                                          ),
                                          Positioned(
                                              bottom: 10,
                                              right: 80,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: AppColors
                                                        .jaygaTextFldColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.camera_alt,
                                                    color: AppColors
                                                        .textColorWhite,
                                                  ),
                                                ),
                                              ))
                                        ],
                                      ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          "3.",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: Get.size.height * .25,
                          width: Get.size.width * .75,
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 14, left: 20, right: 20),
                          margin: const EdgeInsets.only(
                              left: 15, right: 15, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: AppColors.jaygaTextFldColor),
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      const Color(0xFF652981).withOpacity(0.2),
                                  blurRadius: 2,
                                  offset: const Offset(0, 2)),
                            ],
                            //   border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Attach a utility bill copy".tr,
                                style: Get.textTheme.bodyText1,
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  showPopup(context, 'utility');
                                  // controller.getImage(ImageSource.camera, 'nid_front');
                                  // controller.readNId();
                                  // controller.readNId();
                                },
                                child: controller.utility_image.value.isNotEmpty
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.memory(
                                          base64Decode(
                                            controller.utility_image.value,
                                          ),
                                          height: Get.size.width * .4,
                                          width: Get.size.width * .7,
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                    : Stack(
                                        children: [
                                          Image.asset(
                                            'assets/images/nid.png',
                                            height: Get.size.width * .3,
                                            width: Get.size.width * .6,
                                            color: AppColors.textColorGrey,
                                          ),
                                          Positioned(
                                              bottom: 10,
                                              right: 80,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: AppColors
                                                        .jaygaTextFldColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.camera_alt,
                                                    color: AppColors
                                                        .textColorWhite,
                                                  ),
                                                ),
                                              ))
                                        ],
                                      ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }));
  }

  showPopup(context, String type) {
    return showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.zero,
            //title: Text('Select '),
            content: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Get.theme.scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Wrap(
                children: <Widget>[
                  // ListTile(
                  //     leading: const Icon(Icons.photo_library),
                  //     title: Text('Photo Library'.tr),
                  //     onTap: () {
                  //       controller.getImage(ImageSource.gallery, type);
                  //       Get.back();
                  //     }),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: Text('Camera'.tr),
                    onTap: () {
                      controller.getImage(ImageSource.camera, type);
                      Get.back();
                    },
                  ),
                ],
              ),
            )
            // actions: <Widget>[

            // ],
            );
      },
    );
  }
}
