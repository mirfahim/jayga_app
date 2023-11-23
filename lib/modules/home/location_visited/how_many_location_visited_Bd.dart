import 'dart:convert';
import 'package:countries_world_map/countries_world_map.dart';
import 'package:countries_world_map/data/maps/world_map.dart';
import 'package:bangladesh/bangladesh.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/view/my_booking_history/payment_webview.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/routes/app_pages.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';
import 'package:badges/badges.dart' as badges;
import '../../../../services/auth_services.dart';

class VisitedBangladesh extends GetView<HomeController> {
  const VisitedBangladesh({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0), // here the desired height
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              // color: AppColors.backgroundColor,
              child: Image.asset(
                'assets/images/jayga_logo.png',
                height: 70,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.appBackGroundBrn,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                return controller.profileData.value.userData == null
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: BangladeshMap(
                              width: Get.width * .7,
                              height: Get.height * .5,
                              rangpurColor:
                                  controller.rangpurVisit.value == false
                                      ? Colors.grey
                                      : Colors.orange,
                              rajshahiColor:
                                  controller.rajshahiVisit.value == false
                                      ? Colors.grey
                                      : Colors.red,
                              dhakaColor: controller.dhakaVisit.value == false
                                  ? Colors.grey
                                  : Colors.indigo,
                              sylhetColor: controller.shyletVisit.value == false
                                  ? Colors.grey
                                  : Colors.blue,
                              khulnaColor: controller.khulnaVisit.value == false
                                  ? Colors.grey
                                  : Colors.teal,
                              chittagongColor:
                                  controller.chittagongVisit.value == false
                                      ? Colors.grey
                                      : Colors.lightGreen,
                              barisalColor:
                                  controller.barishalVisit.value == false
                                      ? Colors.grey
                                      : Colors.pink,
                              mymensinghColor:
                                  controller.mymanVisit.value == false
                                      ? Colors.grey
                                      : Colors.brown,
                              showBorder: true,
                              showName: true,
                              showDivisionBorder: true,
                              showDistrictBorder: true,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * .03,
                            child: CheckboxListTile(
                                title: Text("Did you visited Dhaka division?"),
                                value: controller.dhakaVisit.value,
                                onChanged: (v) {
                                  controller.dhakaVisit.value = v!;
                                }),
                          ),
                          SizedBox(
                            height: Get.height * .03,
                            child: CheckboxListTile(
                                title: Text("Did you visited Khulna division?"),
                                value: controller.khulnaVisit.value,
                                onChanged: (v) {
                                  controller.khulnaVisit.value = v!;
                                }),
                          ),
                          SizedBox(
                            height: Get.height * .03,
                            child: CheckboxListTile(
                                title: Text("Did you visited Shylet division?"),
                                value: controller.shyletVisit.value,
                                onChanged: (v) {
                                  controller.shyletVisit.value = v!;
                                }),
                          ),
                          SizedBox(
                            height: Get.height * .03,
                            child: CheckboxListTile(
                                title:
                                    Text("Did you visited Rajshahi division?"),
                                value: controller.rajshahiVisit.value,
                                onChanged: (v) {
                                  controller.rajshahiVisit.value = v!;
                                }),
                          ),
                          SizedBox(
                            height: Get.height * .03,
                            child: CheckboxListTile(
                                title:
                                    Text("Did you visited Rangpur division?"),
                                value: controller.rangpurVisit.value,
                                onChanged: (v) {
                                  controller.rangpurVisit.value = v!;
                                }),
                          ),
                          SizedBox(
                            height: Get.height * .03,
                            child: CheckboxListTile(
                                title: Text(
                                    "Did you visited Mymansingh division?"),
                                value: controller.mymanVisit.value,
                                onChanged: (v) {
                                  controller.mymanVisit.value = v!;
                                }),
                          ),
                SizedBox(
                height:Get.height *.03,
                child:
                CheckboxListTile(
                              title: Text("Did you visited Barishal division?"),
                              value: controller.barishalVisit.value,
                              onChanged: (v) {
                                controller.barishalVisit.value = v!;
                              }),),
                          SizedBox(
                            height: Get.height * .03,
                            child: CheckboxListTile(
                                title: Text(
                                    "Did you visited Chittagong division?"),
                                value: controller.chittagongVisit.value,
                                onChanged: (v) {
                                  controller.chittagongVisit.value = v!;
                                }),
                          ),
                        ],
                      );
              }),
            ],
          ),
        ),
      ),
    );
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
                      controller.getImage(ImageSource.camera, type, "2");
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
