import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/booking/view/all_alemnities.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/modules/host_setup/controller/host_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

class DescribeYourHouse extends GetView<HostController> {
  const DescribeYourHouse({Key? key}) : super(key: key);
//page15
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Obx(
           () {
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Next, let’s describe your house",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black),
                      ),
                      Text(
                        "Choose up to 2 highlights. We’ll use these to get your description started",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.black54),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              if(controller.dPeaceful.value == 0){
                                controller.dPeaceful.value = 1;
                              }else{
                                controller.dPeaceful.value = 0;
                              }
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * .05,
                              width: MediaQuery.of(context).size.height * .15,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: controller.dPeaceful.value == 0? Colors.white: Colors.grey,
                                  borderRadius: BorderRadius.circular(40)),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  "Peaceful",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if(controller.dUnique.value == 0){
                                controller.dUnique.value = 1;
                              }else{
                                controller.dUnique.value = 0;
                              }
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * .05,
                              width: MediaQuery.of(context).size.height * .15,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: controller.dUnique.value == 0? Colors.white: Colors.grey,
                                  borderRadius: BorderRadius.circular(40)),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Unique",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),)
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              if(controller.dFamilyFrndly.value == 0){
                                controller.dFamilyFrndly.value = 1;
                              }else{
                                controller.dFamilyFrndly.value = 0;
                              }
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * .05,
                              width: MediaQuery.of(context).size.height * .15,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: controller.dFamilyFrndly.value == 0? Colors.white: Colors.grey,
                                  borderRadius: BorderRadius.circular(40)),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Family-friendly",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),),
                          InkWell(
                            onTap: () {
                              if(controller.dStylish.value == 0){
                                controller.dStylish.value = 1;
                              }else{
                                controller.dStylish.value = 0;
                              }
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * .05,
                              width: MediaQuery.of(context).size.height * .15,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: controller.dStylish.value == 0? Colors.white: Colors.grey,
                                  borderRadius: BorderRadius.circular(40)),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Stylish",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              if(controller.dCentral.value == 0){
                                controller.dCentral.value = 1;
                              }else{
                                controller.dCentral.value = 0;
                              }
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * .05,
                              width: MediaQuery.of(context).size.height * .15,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: controller.dCentral.value == 0? Colors.white: Colors.grey,
                                  borderRadius: BorderRadius.circular(40)),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Central",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),),
                          InkWell(
                            onTap: () {
                              if(controller.dSpacious.value == 0){
                                controller.dSpacious.value = 1;
                              }else{
                                controller.dSpacious.value = 0;
                              }
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * .05,
                              width: MediaQuery.of(context).size.height * .15,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: controller.dSpacious.value == 0? Colors.white: Colors.grey,
                                  borderRadius: BorderRadius.circular(40)),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Spacious",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),)
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
      ),
    );
          }
        ));
  }
}
