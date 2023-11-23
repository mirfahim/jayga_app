import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/booking/view/all_alemnities.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/modules/host_setup/controller/host_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

class TypeOfPropertyFormView extends GetView<HostController> {
  const TypeOfPropertyFormView({Key? key}) : super(key: key);
  // index 2
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(() {
        return Container(
          color: AppColors.appBackGroundBrn,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .7,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "What type of property are you listing?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Whether it’s a room for stay or an experience to offer, Jayga has got you covered.",
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
                          InkWell(
                            onTap: () {
                              if (controller.type_of_property.value ==
                                  "accommodation") {
                                controller.type_of_property.value = "";
                              } else {
                                controller.type_of_property.value =
                                    "accommodation";
                              }
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * .15,
                              width: MediaQuery.of(context).size.width * .85,
                              decoration: BoxDecoration(
                                  color: controller.type_of_property.value ==
                                          "accommodation"
                                      ? Colors.green.shade100
                                      : AppColors.jaygaTextFldColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (controller.type_of_property.value ==
                                            "accommodation") {
                                          controller.type_of_property.value =
                                              "";
                                        } else {
                                          controller.type_of_property.value =
                                              "accommodation";
                                        }
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .1,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .6,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Accommodation",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                ),
                                                controller.type_of_property
                                                            .value ==
                                                        "accommodation"
                                                    ? Icon(
                                                        Icons.check,
                                                        color: Colors.green,
                                                      )
                                                    : Container(),
                                              ],
                                            ),
                                            Text(
                                              "List Rooms, houses, apartments or villas",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12,
                                                  color: Colors.black54),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              'assets/icons/accom.png',
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
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
                          InkWell(
                            onTap: () {
                              if (controller.type_of_property.value ==
                                  "experience") {
                                controller.type_of_property.value = "";
                              } else {
                                controller.type_of_property.value =
                                    "experience";
                              }
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * .15,
                              width: MediaQuery.of(context).size.width * .85,
                              decoration: BoxDecoration(
                                  color: controller.type_of_property.value ==
                                          "experience"
                                      ? Colors.green.shade100
                                      : AppColors.jaygaTextFldColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .1,
                                      width: MediaQuery.of(context).size.width *
                                          .5,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Experience",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              ),
                                              controller.type_of_property
                                                          .value ==
                                                      "experience"
                                                  ? Icon(
                                                      Icons.check,
                                                      color: Colors.green,
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                          Text(
                                            "Host unique experiences such as boating or cooking classes",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 12,
                                                color: Colors.black54),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              'assets/icons/fire.png',
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
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
      }),
    );
  }
}
