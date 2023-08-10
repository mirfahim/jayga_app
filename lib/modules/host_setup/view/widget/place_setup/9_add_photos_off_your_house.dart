import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/booking/view/all_alemnities.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/modules/host_setup/controller/host_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

class AddPhotosOfHouse extends GetView<HostController> {
  const AddPhotosOfHouse({Key? key}) : super(key: key);

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
                        "Add some photos of your house",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black),
                      ),
                      Text(
                        "You’ll need 5 photos to get started. You can add more or make changes later.",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.black54),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Row(

                        children: [


                          Container(
                            height: MediaQuery.of(context).size.height * .1,
                            width: MediaQuery.of(context).size.width * .8,
                            decoration: BoxDecoration(
                                color: AppColors.jaygaTextFldColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding:  EdgeInsets.all(16.0),

                              child:ListTile(
                                title: Text("Add Photos"),
                                leading: Icon(Icons.add),



                              )

                            ),

                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(

                        children: [


                          Container(
                            height: MediaQuery.of(context).size.height * .1,
                            width: MediaQuery.of(context).size.width * .8,
                            decoration: BoxDecoration(
                                color: AppColors.jaygaTextFldColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                                padding:  EdgeInsets.all(16.0),

                                child:ListTile(
                                  title: Text("Take new photos"),
                                  leading: Icon(Icons.camera_alt),



                                )

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
        )


    );

  }
}
