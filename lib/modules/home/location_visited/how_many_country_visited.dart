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

class VisitedCountry extends GetView<HomeController> {
  const VisitedCountry({Key? key}) : super(key: key);
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

                    SizedBox(
                      width: Get.width ,
                      child: SimpleMap(
                        // String of instructions to draw the map.
                        instructions: SMapWorld.instructions,

                        // Default color for all countries.
                        defaultColor: Colors.grey,

                        // Matching class to specify custom colors for each area.
                        colors: SMapWorldColors(

                          uS: controller.khulnaVisit.value == true ?Colors.green : Colors.grey, // This makes USA green
                          cN: controller.barishalVisit.value == true ?Colors.green : Colors.grey, // This makes China green
                          rU: controller.dhakaVisit.value == true ?Colors.green : Colors.grey, // This makes Russia green
                          bN: controller.rajshahiVisit.value == true ? Colors.red : Colors.grey,
                          bD: controller.rajshahiVisit.value == true ? Colors.red : Colors.grey,
                          iN: controller.rajshahiVisit.value == true ? Colors.red : Colors.grey,
                          nE: controller.rajshahiVisit.value == true ? Colors.red : Colors.grey,
                          bH: controller.rajshahiVisit.value == true ? Colors.red : Colors.grey,
                          pA: controller.rajshahiVisit.value == true ? Colors.red : Colors.grey,
                          aF: controller.rajshahiVisit.value == true ? Colors.red : Colors.grey,
                          mY: controller.rajshahiVisit.value == true ? Colors.red : Colors.grey,
                          sR: controller.rajshahiVisit.value == true ? Colors.red : Colors.grey,
                          aR: controller.rajshahiVisit.value == true ? Colors.red : Colors.grey,
                          tZ: controller.rajshahiVisit.value == true ? Colors.red : Colors.grey,


                        ).toMap(),

                        // Details of what area is being touched, giving you the ID, name and tapdetails
                        callback: (id, name, tapdetails) {
                          print(id);
                        },
                      ),
                    ),
                    DefaultTabController(
                      initialIndex: 0,
                      length: 5,
                      child: Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              height: MediaQuery.of(context).size.height *.06,
                              width:  MediaQuery.of(context).size.width * 1.2,
                              child: TabBar(
                                labelColor: Colors.black,
                                tabs: [
                                  Tab(


                                    text: "Asia(48)",

                                  ),

                                  Tab(

                                    text: "Africa",
                                  ),
                                  Tab(

                                    text: "America",
                                  ),
                                  Tab(

                                    text: "Autralia",
                                  ),
                                  Tab(

                                    text: "Europe",
                                  ),


                                ],

                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 6,
                            child: TabBarView(
                              children: [

                                Container(
                                  height: MediaQuery.of(context).size.height * 6,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title: Text("1. Did you visited Afghanistan?"),
                                            value: controller.AAafgan.value,
                                            onChanged: (v) {
                                              controller.AAafgan.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title: Text("Did you visited Armenia?"),
                                            value: controller.AAarmenia.value,
                                            onChanged: (v) {
                                              controller.AAarmenia.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title: Text("Did you visited Bahrain?"),
                                            value: controller.AAbaharin.value,
                                            onChanged: (v) {
                                              controller.AAbaharin.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title:
                                            Text("Did you visited Bangladesh?"),
                                            value: controller.AAbangladesh.value,
                                            onChanged: (v) {
                                              controller.AAbangladesh.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title:
                                            Text("Did you visited Bhutan?"),
                                            value: controller.AAbhutan.value,
                                            onChanged: (v) {
                                              controller.AAbhutan.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title: Text(
                                                "Did you visited Cambodia?"),
                                            value: controller.AAcombodia.value,
                                            onChanged: (v) {
                                              controller.AAcombodia.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height:Get.height *.04,
                                        child:
                                        CheckboxListTile(
                                            title: Text("Did you visited China?"),
                                            value: controller.AAchina.value,
                                            onChanged: (v) {
                                              controller.AAchina.value = v!;
                                            }),),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title: Text(
                                                "Did you visited Cyprus?"),
                                            value: controller.AAcyprus.value,
                                            onChanged: (v) {
                                              controller.AAcyprus.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title: Text("Did you visited Afghanistan?"),
                                            value: controller.dhakaVisit.value,
                                            onChanged: (v) {
                                              controller.dhakaVisit.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title: Text("Did you visited Armenia?"),
                                            value: controller.khulnaVisit.value,
                                            onChanged: (v) {
                                              controller.khulnaVisit.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title: Text("Did you visited Bahrain?"),
                                            value: controller.shyletVisit.value,
                                            onChanged: (v) {
                                              controller.shyletVisit.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title:
                                            Text("Did you visited Bangladesh?"),
                                            value: controller.rajshahiVisit.value,
                                            onChanged: (v) {
                                              controller.rajshahiVisit.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title:
                                            Text("Did you visited Bhutan?"),
                                            value: controller.rangpurVisit.value,
                                            onChanged: (v) {
                                              controller.rangpurVisit.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title: Text(
                                                "Did you visited Cambodia?"),
                                            value: controller.mymanVisit.value,
                                            onChanged: (v) {
                                              controller.mymanVisit.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height:Get.height *.04,
                                        child:
                                        CheckboxListTile(
                                            title: Text("Did you visited China?"),
                                            value: controller.barishalVisit.value,
                                            onChanged: (v) {
                                              controller.barishalVisit.value = v!;
                                            }),),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title: Text(
                                                "Did you visited Cyprus?"),
                                            value: controller.chittagongVisit.value,
                                            onChanged: (v) {
                                              controller.chittagongVisit.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title: Text("Did you visited Afghanistan?"),
                                            value: controller.dhakaVisit.value,
                                            onChanged: (v) {
                                              controller.dhakaVisit.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title: Text("Did you visited Armenia?"),
                                            value: controller.khulnaVisit.value,
                                            onChanged: (v) {
                                              controller.khulnaVisit.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title: Text("Did you visited Bahrain?"),
                                            value: controller.shyletVisit.value,
                                            onChanged: (v) {
                                              controller.shyletVisit.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title:
                                            Text("Did you visited Bangladesh?"),
                                            value: controller.rajshahiVisit.value,
                                            onChanged: (v) {
                                              controller.rajshahiVisit.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title:
                                            Text("Did you visited Bhutan?"),
                                            value: controller.rangpurVisit.value,
                                            onChanged: (v) {
                                              controller.rangpurVisit.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title: Text(
                                                "Did you visited Cambodia?"),
                                            value: controller.mymanVisit.value,
                                            onChanged: (v) {
                                              controller.mymanVisit.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height:Get.height *.04,
                                        child:
                                        CheckboxListTile(
                                            title: Text("Did you visited China?"),
                                            value: controller.barishalVisit.value,
                                            onChanged: (v) {
                                              controller.barishalVisit.value = v!;
                                            }),),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title: Text(
                                                "Did you visited Cyprus?"),
                                            value: controller.chittagongVisit.value,
                                            onChanged: (v) {
                                              controller.chittagongVisit.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title: Text("Did you visited Afghanistan?"),
                                            value: controller.dhakaVisit.value,
                                            onChanged: (v) {
                                              controller.dhakaVisit.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title: Text("Did you visited Armenia?"),
                                            value: controller.khulnaVisit.value,
                                            onChanged: (v) {
                                              controller.khulnaVisit.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title: Text("Did you visited Bahrain?"),
                                            value: controller.shyletVisit.value,
                                            onChanged: (v) {
                                              controller.shyletVisit.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title:
                                            Text("Did you visited Bangladesh?"),
                                            value: controller.rajshahiVisit.value,
                                            onChanged: (v) {
                                              controller.rajshahiVisit.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title:
                                            Text("Did you visited Bhutan?"),
                                            value: controller.rangpurVisit.value,
                                            onChanged: (v) {
                                              controller.rangpurVisit.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title: Text(
                                                "Did you visited Cambodia?"),
                                            value: controller.mymanVisit.value,
                                            onChanged: (v) {
                                              controller.mymanVisit.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height:Get.height *.04,
                                        child:
                                        CheckboxListTile(
                                            title: Text("Did you visited China?"),
                                            value: controller.barishalVisit.value,
                                            onChanged: (v) {
                                              controller.barishalVisit.value = v!;
                                            }),),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title: Text(
                                                "Did you visited Cyprus?"),
                                            value: controller.chittagongVisit.value,
                                            onChanged: (v) {
                                              controller.chittagongVisit.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title: Text("Did you visited Afghanistan?"),
                                            value: controller.dhakaVisit.value,
                                            onChanged: (v) {
                                              controller.dhakaVisit.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title: Text("Did you visited Armenia?"),
                                            value: controller.khulnaVisit.value,
                                            onChanged: (v) {
                                              controller.khulnaVisit.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title: Text("Did you visited Bahrain?"),
                                            value: controller.shyletVisit.value,
                                            onChanged: (v) {
                                              controller.shyletVisit.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title:
                                            Text("Did you visited Bangladesh?"),
                                            value: controller.rajshahiVisit.value,
                                            onChanged: (v) {
                                              controller.rajshahiVisit.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title:
                                            Text("Did you visited Bhutan?"),
                                            value: controller.rangpurVisit.value,
                                            onChanged: (v) {
                                              controller.rangpurVisit.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title: Text(
                                                "Did you visited Cambodia?"),
                                            value: controller.mymanVisit.value,
                                            onChanged: (v) {
                                              controller.mymanVisit.value = v!;
                                            }),
                                      ),
                                      SizedBox(
                                        height:Get.height *.04,
                                        child:
                                        CheckboxListTile(
                                            title: Text("Did you visited China?"),
                                            value: controller.barishalVisit.value,
                                            onChanged: (v) {
                                              controller.barishalVisit.value = v!;
                                            }),),
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: CheckboxListTile(
                                            title: Text(
                                                "Did you visited Cyprus?"),
                                            value: controller.chittagongVisit.value,
                                            onChanged: (v) {
                                              controller.chittagongVisit.value = v!;
                                            }),
                                      ),
                                    ],
                                  )
                                ),

                              ],
                            ),
                          ),


                        ],
                      ),
                    ),










                    //
                    // Georgia
                    // India
                    // Indonesia
                    // Iran
                    // Iraq
                    // Israel
                    // Japan
                    // Jordan
                    // Kazakhstan
                    // Kuwait
                    // Kyrgyzstan
                    // Laos
                    // Lebanon
                    // Malaysia
                    // Maldives
                    // Mongolia
                    // Myanmar (Burma)
                    // Nepal
                    // North Korea
                    // Oman
                    // Pakistan
                    // Palestine
                    // Philippines
                    // Qatar
                    // Saudi Arabia
                    // Singapore
                    // South Korea
                    // Sri Lanka
                    // Syria
                    // Taiwan
                    // Tajikistan
                    // Thailand
                    // Timor-Leste
                    // Turkey
                    // Turkmenistan
                    // United Arab Emirates
                    // Uzbekistan
                    // Vietnam
                    // Yemen
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
