import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/booking/view/all_alemnities.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/modules/host_setup/controller/host_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

class ItEasyToTellJayga extends GetView<HostController> {
  const ItEasyToTellJayga({Key? key}) : super(key: key);

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
                  padding: const EdgeInsets.all(22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "It’s easy to get started on jayga",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 30,
                      ),


                      ListTile(
                        title: Text("1 Tell us about your place"),
                        subtitle:Text("Share some basic info, such as where it is and how many guests can stay"),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ListTile(
                        title: Text("2 Make it stand out"),
                        subtitle:Text("Add 5 or more photos plus a title and description-we’ll help you out."),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ListTile(
                        title: Text("3 Finish up and publish"),
                        subtitle:Text("Choose if you’d like to start with an experienced guest, set a starting price and publish your listing."),
                      ),


                    ],
                  ),
                ),
              ),
            ],
          ),
        ),


    );

  }
}
