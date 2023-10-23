import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/booking/view/all_alemnities.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/modules/host_setup/controller/host_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

class WhatPlaceHasToOffer extends GetView<HostController> {
  const WhatPlaceHasToOffer({Key? key}) : super(key: key);

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
                              height: MediaQuery.of(context).size.height * .1,
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
                                              'assets/icons/cabin.png',
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
                              height: MediaQuery.of(context).size.height * .1,
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
                                              'assets/icons/cabin.png',
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
                                height: MediaQuery.of(context).size.height * .1,
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
                                                'assets/icons/cabin.png',
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
                                height: MediaQuery.of(context).size.height * .1,
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
                                                'assets/icons/cabin.png',
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
                              height: MediaQuery.of(context).size.height * .1,
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
                                              'assets/icons/cabin.png',
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
                              height: MediaQuery.of(context).size.height * .1,
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
                                              'assets/icons/cabin.png',
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
                              height: MediaQuery.of(context).size.height * .1,
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
                                              'assets/icons/cabin.png',
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
                              height: MediaQuery.of(context).size.height * .1,
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
                                              'assets/icons/cabin.png',
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
                              height: MediaQuery.of(context).size.height * .1,
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
                                              'assets/icons/cabin.png',
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
                              height: MediaQuery.of(context).size.height * .1,
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
                                              'assets/icons/cabin.png',
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
                              height: MediaQuery.of(context).size.height * .1,
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
                                              'assets/icons/cabin.png',
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
                              height: MediaQuery.of(context).size.height * .1,
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
                                              'assets/icons/cabin.png',
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
                              height: MediaQuery.of(context).size.height * .1,
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
                                              'assets/icons/cabin.png',
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
                              height: MediaQuery.of(context).size.height * .1,
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
                                              'assets/icons/cabin.png',
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
                              height: MediaQuery.of(context).size.height * .1,
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
                                              'assets/icons/cabin.png',
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
                              height: MediaQuery.of(context).size.height * .1,
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
                                              'assets/icons/cabin.png',
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
                              height: MediaQuery.of(context).size.height * .1,
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
                                              'assets/icons/cabin.png',
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
                              height: MediaQuery.of(context).size.height * .1,
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
                                              'assets/icons/cabin.png',
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
                              height: MediaQuery.of(context).size.height * .1,
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
                                              'assets/icons/cabin.png',
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
                              height: MediaQuery.of(context).size.height * .1,
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
                                              'assets/icons/cabin.png',
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
            )
          ],
        ),
      );
    }));
  }
}
