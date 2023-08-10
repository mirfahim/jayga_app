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

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child:
         Container(
          color: AppColors.appBackGroundBrn,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                height: MediaQuery.of(context).size.height *.7,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
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
                          Container(
                            height: MediaQuery.of(context).size.height *.05,
                            width: MediaQuery.of(context).size.height *.15,
                            decoration: BoxDecoration(
                                border: Border.all(),

                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40)),
                            child: Padding(
                              padding:  EdgeInsets.all(10.0),
                              child: Text("Peaceful",style: TextStyle(color: Colors.black),),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height *.05,
                            width: MediaQuery.of(context).size.height *.15,
                            decoration: BoxDecoration(
                                border: Border.all(),

                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40)),
                            child: Padding(
                              padding:  EdgeInsets.all(10.0),
                              child: Text("Unique",style: TextStyle(color: Colors.black),),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height *.05,
                            width: MediaQuery.of(context).size.height *.15,
                            decoration: BoxDecoration(
                                border: Border.all(),

                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40)),
                            child: Padding(
                              padding:  EdgeInsets.all(10.0),
                              child: Text("Family-friendly",style: TextStyle(color: Colors.black),),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height *.05,
                            width: MediaQuery.of(context).size.height *.15,
                            decoration: BoxDecoration(
                                border: Border.all(),

                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40)),
                            child: Padding(
                              padding:  EdgeInsets.all(10.0),
                              child: Text("Stylish",style: TextStyle(color: Colors.black),),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height *.05,
                            width: MediaQuery.of(context).size.height *.15,
                            decoration: BoxDecoration(
                                border: Border.all(),

                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40)),
                            child: Padding(
                              padding:  EdgeInsets.all(10.0),
                              child: Text("Central",style: TextStyle(color: Colors.black),),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height *.05,
                            width: MediaQuery.of(context).size.height *.15,
                            decoration: BoxDecoration(
                                border: Border.all(),

                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40)),
                            child: Padding(
                              padding:  EdgeInsets.all(10.0),
                              child: Text("Spacious",style: TextStyle(color: Colors.black),),
                            ),
                          ),
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
        )


    );

  }
}
