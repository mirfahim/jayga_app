import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/booking/view/all_alemnities.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/modules/host_setup/controller/host_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

class MakeItStandOut extends GetView<HostController> {
  const MakeItStandOut({Key? key}) : super(key: key);

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
                        "Make it stand out",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black),
                      ),
                      Text(
                        "Add atleast 5 photos plus a title and description-we’ll help you out.",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.black54),
                      ),
                      SizedBox(height: 20,),

                      Container(
                        height: Get.height*.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              "1. Prepare 5 images of your jayga",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,
                                  color: Colors.black54),
                            ),
                            Text(
                              "2. Add a title for your jayga.",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,
                                  color: Colors.black54),
                            ),
                            Text(
                              "3. Prepare a clear description of your jayga. Tell us every details of locations and services.",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,
                                  color: Colors.black54),
                            ),
                            Text(
                              "4. Add all restrictions",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
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
