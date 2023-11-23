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
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/host_setup/controller/host_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';
import 'package:badges/badges.dart' as badges;

import '../../../../routes/app_pages.dart';

class EditListingAmenities extends GetView<HostController> {


  @override
  Widget build(BuildContext context) {
    var data = Get.arguments[0];
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
      body:SingleChildScrollView(child: Obx(() {
        return Container(
          color: AppColors.appBackGroundBrn,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .7,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(40)),
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Tell guests what your place has to offer",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black),
                      ),
                      Text(
                        "You’ll add more details later, such as bed types.",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.black54),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              print("hlw");
                              if (controller.qwifi.value == 0) {
                                controller.qwifi.value = 1;
                              } else {
                                controller.qwifi.value = 0;
                              }
                            },
                            child: Container(
                                height: MediaQuery.of(context).size.height *.12,
                                width: MediaQuery.of(context).size.width * .3,
                                decoration: BoxDecoration(
                                    color: controller.qwifi.value == 0
                                        ? Colors.white
                                        : Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                'assets/icons/host/place_offer/wifi.png',
                                              ),
                                            )),
                                      ),
                                      Text("Wifi")
                                    ],
                                  ),
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              if (controller.qTv.value == 0) {
                                controller.qTv.value = 1;
                              } else {
                                controller.qTv.value = 0;
                              }
                            },
                            child: Container(
                                height: MediaQuery.of(context).size.height *.12,
                                width: MediaQuery.of(context).size.width * .3,
                                decoration: BoxDecoration(
                                    color: controller.qTv.value == 0
                                        ? Colors.white
                                        : Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                'assets/icons/host/place_offer/television.png',
                                              ),
                                            )),
                                      ),
                                      Text("TV")
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              onTap: () {
                                if (controller.qKitchen.value == 0) {
                                  controller.qKitchen.value = 1;
                                } else {
                                  controller.qKitchen.value = 0;
                                }
                              },
                              child: Container(
                                  height: MediaQuery.of(context).size.height *.12,
                                  width: MediaQuery.of(context).size.width * .3,
                                  decoration: BoxDecoration(
                                      color: controller.qKitchen.value == 0
                                          ? Colors.white
                                          : Colors.green,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Card(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage(
                                                  'assets/icons/host/place_offer/kitchen-table.png',
                                                ),
                                              )),
                                        ),
                                        Text("Kitchen")
                                      ],
                                    ),
                                  ))),
                          InkWell(
                              onTap: () {
                                if (controller.qwmachine.value == 0) {
                                  controller.qwmachine.value = 1;
                                } else {
                                  controller.qwmachine.value = 0;
                                }
                              },
                              child: Container(
                                  height: MediaQuery.of(context).size.height *.12,
                                  width: MediaQuery.of(context).size.width * .3,
                                  decoration: BoxDecoration(
                                      color: controller.qwmachine.value == 0
                                          ? Colors.white
                                          : Colors.green,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Card(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage(
                                                  'assets/icons/host/place_offer/washing-machine.png',
                                                ),
                                              )),
                                        ),
                                        Text("Washing Machine")
                                      ],
                                    ),
                                  ))),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              if (controller.qfreeParking.value == 0) {
                                controller.qfreeParking.value = 1;
                              } else {
                                controller.qfreeParking.value = 0;
                              }
                            },
                            child: Container(
                                height: MediaQuery.of(context).size.height *.12,
                                width: MediaQuery.of(context).size.width * .3,
                                decoration: BoxDecoration(
                                    color: controller.qfreeParking.value == 0
                                        ? Colors.white
                                        : Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                'assets/icons/host/place_offer/parked_car.png',
                                              ),
                                            )),
                                      ),
                                      Text("Free parking on premises")
                                    ],
                                  ),
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              if (controller.qbreakFast.value == 0) {
                                controller.qbreakFast.value = 1;
                              } else {
                                controller.qbreakFast.value = 0;
                              }
                            },
                            child: Container(
                                height: MediaQuery.of(context).size.height *.12,
                                width: MediaQuery.of(context).size.width * .3,
                                decoration: BoxDecoration(
                                    color: controller.qbreakFast.value == 0
                                        ? Colors.white
                                        : Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                'assets/icons/host/place_offer/wifi.png',
                                              ),
                                            )),
                                      ),
                                      Text("Breakfast included")
                                    ],
                                  ),
                                )),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              if (controller.qAirCOn.value == 0) {
                                controller.qAirCOn.value = 1;
                              } else {
                                controller.qAirCOn.value = 0;
                              }
                            },
                            child: Container(
                                height: MediaQuery.of(context).size.height *.12,
                                width: MediaQuery.of(context).size.width * .3,
                                decoration: BoxDecoration(
                                    color: controller.qAirCOn.value == 0
                                        ? Colors.white
                                        : Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                'assets/icons/host/place_offer/ac.png',
                                              ),
                                            )),
                                      ),
                                      Text("Air conditioning")
                                    ],
                                  ),
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              if (controller.qWorkSpace.value == 0) {
                                controller.qWorkSpace.value = 1;
                              } else {
                                controller.qWorkSpace.value = 0;
                              }
                            },
                            child: Container(
                                height: MediaQuery.of(context).size.height *.12,
                                width: MediaQuery.of(context).size.width * .3,
                                decoration: BoxDecoration(
                                    color: controller.qWorkSpace.value == 0
                                        ? Colors.white
                                        : Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                'assets/icons/host/place_offer/workspace.png',
                                              ),
                                            )),
                                      ),
                                      Text("Dedicated workspace")
                                    ],
                                  ),
                                )),
                          )
                        ],
                      ),
                      Text(
                        "Do you have any standout amenities?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              if (controller.qPool.value == 0) {
                                controller.qPool.value = 1;
                              } else {
                                controller.qPool.value = 0;
                              }
                            },
                            child: Container(
                                height: MediaQuery.of(context).size.height *.12,
                                width: MediaQuery.of(context).size.width * .3,
                                decoration: BoxDecoration(
                                    color: controller.qPool.value == 0
                                        ? Colors.white
                                        : Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                'assets/icons/host/place_offer/pool.png',
                                              ),
                                            )),
                                      ),
                                      Text("Pool")
                                    ],
                                  ),
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              if (controller.qHotTub.value == 0) {
                                controller.qHotTub.value = 1;
                              } else {
                                controller.qHotTub.value = 0;
                              }
                            },
                            child: Container(
                                height: MediaQuery.of(context).size.height *.12,
                                width: MediaQuery.of(context).size.width * .3,
                                decoration: BoxDecoration(
                                    color: controller.qHotTub.value == 0
                                        ? Colors.white
                                        : Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                'assets/icons/host/place_offer/hottub.png',
                                              ),
                                            )),
                                      ),
                                      Text("Hot tub")
                                    ],
                                  ),
                                )),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              if (controller.qPatio.value == 0) {
                                controller.qPatio.value = 1;
                              } else {
                                controller.qPatio.value = 0;
                              }
                            },
                            child: Container(
                                height: MediaQuery.of(context).size.height *.12,
                                width: MediaQuery.of(context).size.width * .3,
                                decoration: BoxDecoration(
                                    color: controller.qPatio.value == 0
                                        ? Colors.white
                                        : Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                'assets/icons/host/place_offer/patio.png',
                                              ),
                                            )),
                                      ),
                                      Text("Patio")
                                    ],
                                  ),
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              if (controller.qBBqGrill.value == 0) {
                                controller.qBBqGrill.value = 1;
                              } else {
                                controller.qBBqGrill.value = 0;
                              }
                            },
                            child: Container(
                                height: MediaQuery.of(context).size.height *.12,
                                width: MediaQuery.of(context).size.width * .3,
                                decoration: BoxDecoration(
                                    color: controller.qBBqGrill.value == 0
                                        ? Colors.white
                                        : Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                'assets/icons/host/place_offer/bbq.png',
                                              ),
                                            )),
                                      ),
                                      Text("BBQ grill")
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              if (controller.qDiningArea.value == 0) {
                                controller.qDiningArea.value = 1;
                              } else {
                                controller.qDiningArea.value = 0;
                              }
                            },
                            child: Container(
                                height: MediaQuery.of(context).size.height *.12,
                                width: MediaQuery.of(context).size.width * .3,
                                decoration: BoxDecoration(
                                    color: controller.qDiningArea.value == 0
                                        ? Colors.white
                                        : Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                'assets/icons/host/place_offer/outdoor.png',
                                              ),
                                            )),
                                      ),
                                      Text("Outdoor dining area")
                                    ],
                                  ),
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              if (controller.qFirePit.value == 0) {
                                controller.qFirePit.value = 1;
                              } else {
                                controller.qFirePit.value = 0;
                              }
                            },
                            child: Container(
                                height: MediaQuery.of(context).size.height *.12,
                                width: MediaQuery.of(context).size.width * .3,
                                decoration: BoxDecoration(
                                    color: controller.qFirePit.value == 0
                                        ? Colors.white
                                        : Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                'assets/icons/host/place_offer/fire_pit.png',
                                              ),
                                            )),
                                      ),
                                      Text("Fire pit")
                                    ],
                                  ),
                                )),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              if (controller.qGym.value == 0) {
                                controller.qGym.value = 1;
                              } else {
                                controller.qGym.value = 0;
                              }
                            },
                            child: Container(
                                height: MediaQuery.of(context).size.height *.12,
                                width: MediaQuery.of(context).size.width * .3,
                                decoration: BoxDecoration(
                                    color: controller.qGym.value == 0
                                        ? Colors.white
                                        : Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                'assets/icons/host/place_offer/gym.png',
                                              ),
                                            )),
                                      ),
                                      Text("Gym")
                                    ],
                                  ),
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              if (controller.qLakeAccess.value == 0) {
                                controller.qLakeAccess.value = 1;
                              } else {
                                controller.qLakeAccess.value = 0;
                              }
                            },
                            child: Container(
                                height: MediaQuery.of(context).size.height *.12,
                                width: MediaQuery.of(context).size.width * .3,
                                decoration: BoxDecoration(
                                    color: controller.qLakeAccess.value == 0
                                        ? Colors.white
                                        : Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                'assets/icons/host/place_offer/lake.png',
                                              ),
                                            )),
                                      ),
                                      Text("Beach/Lake access")
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                      Text(
                        "Do you have any of these safety items?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              if (controller.qSmokeAlarm.value == 0) {
                                controller.qSmokeAlarm.value = 1;
                              } else {
                                controller.qSmokeAlarm.value = 0;
                              }
                            },
                            child: Container(
                                height: MediaQuery.of(context).size.height *.12,
                                width: MediaQuery.of(context).size.width * .3,
                                decoration: BoxDecoration(
                                    color: controller.qSmokeAlarm.value == 0
                                        ? Colors.white
                                        : Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                'assets/icons/host/place_offer/smoke.png',
                                              ),
                                            )),
                                      ),
                                      Text("Smoke alarm")
                                    ],
                                  ),
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              if (controller.qFirstAidKit.value == 0) {
                                controller.qFirstAidKit.value = 1;
                              } else {
                                controller.qFirstAidKit.value = 0;
                              }
                            },
                            child: Container(
                                height: MediaQuery.of(context).size.height *.12,
                                width: MediaQuery.of(context).size.width * .3,
                                decoration: BoxDecoration(
                                    color: controller.qFirstAidKit.value == 0
                                        ? Colors.white
                                        : Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                'assets/icons/host/place_offer/aid.png',
                                              ),
                                            )),
                                      ),
                                      Text("First aid kit")
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              if (controller.qFireExtinguisher.value == 0) {
                                controller.qFireExtinguisher.value = 1;
                              } else {
                                controller.qFireExtinguisher.value = 0;
                              }
                            },
                            child: Container(
                                height: MediaQuery.of(context).size.height *.12,
                                width: MediaQuery.of(context).size.width * .3,
                                decoration: BoxDecoration(
                                    color: controller.qFireExtinguisher.value == 0
                                        ? Colors.white
                                        : Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                'assets/icons/host/place_offer/fire_ext.png',
                                              ),
                                            )),
                                      ),
                                      Text("Fire extinguisher")
                                    ],
                                  ),
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              if (controller.qCCtv.value == 0) {
                                controller.qCCtv.value = 1;
                              } else {
                                controller.qCCtv.value = 0;
                              }
                            },
                            child: Container(
                                height: MediaQuery.of(context).size.height *.12,
                                width: MediaQuery.of(context).size.width * .3,
                                decoration: BoxDecoration(
                                    color: controller.qCCtv.value == 0
                                        ? Colors.white
                                        : Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                'assets/icons/host/place_offer/cctv.png',
                                              ),
                                            )),
                                      ),
                                      Text("CCTV")
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {


                      controller
                          .editListingController(
                        listingID: data.listingId.toString(),
                        lister_id: data.listerId,
                        lister_name:
                        data.listerName,
                        guest_num: data.guestNum,
                        nid_number:
                        data.nidNumber,
                        bed_num: data.bedNum,
                        bathroom_num:
                        data.bathroomNum,
                        listing_title: controller
                            .houseTitle
                            .value
                            .text
                            .isEmpty
                            ? data.listingTitle
                            : controller
                            .houseTitle
                            .value
                            .text,
                        listing_description:
                        data.listingAddress,
                        full_day_price_set_by_user:
                        controller
                            .listingPrice
                            .value
                            .text
                            .isEmpty
                            ? data
                            .fullDayPriceSetByUser
                            : controller
                            .listingPrice
                            .value
                            .text,
                        listing_address:
                        data.listingAddress,
                        zip_code: data.zipCode,
                        district: data.district,
                        town: data.town,
                        allow_short_stay:
                        data.allowShortStay,
                        describe_peaceful:
                        data.describePeaceful,
                        describe_unique:
                        data.describeUnique,
                        describe_familyfriendly: data
                            .describeFamilyfriendly,
                        describe_stylish:
                        data.describeStylish,
                        describe_central:
                        data.describeCentral,
                        describe_spacious:
                        data.describeSpacious,
                        listing_type:
                        data.listingType,
                        lati: data.lat,
                        longi: data.long,

                        bread_breakfast: controller.qbreakFast.value.toString() == data
                            .amenities
                            .breakfastIncluded ? data
                            .amenities
                            .breakfastIncluded : controller.qbreakFast.value.toString(),
                        wifi: controller.qwifi.value.toString() == data
                            .amenities
                            .wifi ? data.amenities.wifi : controller.qwifi.value.toString(),
                        tv: controller.qTv.value.toString() == data
                            .amenities
                            .tv ? data.amenities.tv : controller.qTv.value.toString(),
                        kitchen:  controller.qTv.value.toString() == data
                            .amenities
                            .kitchen ? data
                            .amenities.kitchen : controller.qKitchen.value.toString(),
                        washing_machine: controller.qwmachine.value.toString() == data
                            .amenities
                            .washingMachine ?data
                            .amenities
                            .washingMachine : controller.qwmachine.value.toString(),
                        free_parking: controller.qfreeParking.value.toString() == data
                            .amenities
                            .freeParking ?data
                            .amenities
                            .freeParking : controller.qfreeParking.value.toString(),
                        breakfast_included: data
                            .amenities
                            .breakfastIncluded,
                        air_condition:controller.qAirCOn.value.toString() == data
                            .amenities
                            .airCondition ? data
                            .amenities
                            .airCondition :controller.qAirCOn.value.toString(),
                        dedicated_workspace: data
                            .amenities
                            .dedicatedWorkspace,
                        pool: controller.qPool.value.toString(),
                        hot_tub:
                        data.amenities.hotTub,
                        patio:
                        data.amenities.patio,
                        bbq_grill: data
                            .amenities.bbqGrill,
                        fire_pit: data
                            .amenities.firePit,
                        gym: data.amenities.gym,
                        beach_lake_access: data
                            .amenities
                            .beachLakeAccess,
                        smoke_alarm: data
                            .amenities.smokeAlarm,
                        first_aid: data
                            .amenities.firstAid,
                        fire_extinguish: data
                            .amenities
                            .fireExtinguish,
                        cctv: data.amenities.cctv,
                      );


                },
                child: Center(
                  child: AnimatedContainer(
                      duration:
                      Duration(seconds: 2),
                      height: Get.height*.07,
                      width:
                      MediaQuery.of(context)
                          .size
                          .width *
                          .4,
                      decoration: BoxDecoration(
                          color: AppColors
                              .textColorGreen,
                          borderRadius:
                          BorderRadius
                              .circular(50)),
                      alignment: Alignment.center,
                      child: Text(
                        "Publish Changes",
                        style: TextStyle(
                          color: AppColors
                              .backgroundColor,
                          fontSize: 12,
                        ),
                      )),
                ),
              ),
            ],
          ),
        );
      }))
    );
  }

  showPopup(context, String type, bool camera) {
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
                    title:
                    camera == true ? Text('Camera'.tr) : Text('Gallary'.tr),
                    onTap: () {
                      controller.getImage(
                          camera == true
                              ? ImageSource.camera
                              : ImageSource.gallery,
                          type);
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
