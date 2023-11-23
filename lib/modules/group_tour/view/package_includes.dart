import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

class PackageIncludes extends GetView<BookingController> {
  const PackageIncludes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: Get.height*.9,
        color: AppColors.appBackGroundBrn,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "See what packages includes",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  InkWell(
                      onTap: () {
                        controller.seeAmenities.value = false;
                      },
                      child: Icon(
                        Icons.cancel_outlined,
                        size: 30,
                        color: Colors.grey,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: Get.height*.7,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(40)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("1.", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColorGreen, fontSize: 16),),
                            Text("Assistance upon arrival at Sheikh Ul Alam Int’l Airport.",style: TextStyle(fontWeight: FontWeight.normal, color: AppColors.textColorBlack, fontSize: 12),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("1.", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColorGreen, fontSize: 16),),
                            Text("Assistance upon arrival at Sheikh Ul Alam Int’l Airport.",style: TextStyle(fontWeight: FontWeight.normal, color: AppColors.textColorBlack, fontSize: 12),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("1.", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColorGreen, fontSize: 16),),
                            Text("Assistance upon arrival at Sheikh Ul Alam Int’l Airport.",style: TextStyle(fontWeight: FontWeight.normal, color: AppColors.textColorBlack, fontSize: 12),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("1.", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColorGreen, fontSize: 16),),
                            Text("Assistance upon arrival at Sheikh Ul Alam Int’l Airport.",style: TextStyle(fontWeight: FontWeight.normal, color: AppColors.textColorBlack, fontSize: 12),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("1.", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColorGreen, fontSize: 16),),
                            Text("Assistance upon arrival at Sheikh Ul Alam Int’l Airport.",style: TextStyle(fontWeight: FontWeight.normal, color: AppColors.textColorBlack, fontSize: 12),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("1.", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColorGreen, fontSize: 16),),
                            Text("Assistance upon arrival at Sheikh Ul Alam Int’l Airport.",style: TextStyle(fontWeight: FontWeight.normal, color: AppColors.textColorBlack, fontSize: 12),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("1.", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColorGreen, fontSize: 16),),
                            Text("Assistance upon arrival at Sheikh Ul Alam Int’l Airport.",style: TextStyle(fontWeight: FontWeight.normal, color: AppColors.textColorBlack, fontSize: 12),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("1.", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColorGreen, fontSize: 16),),
                            Text("Assistance upon arrival at Sheikh Ul Alam Int’l Airport.",style: TextStyle(fontWeight: FontWeight.normal, color: AppColors.textColorBlack, fontSize: 12),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("1.", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColorGreen, fontSize: 16),),
                            Text("Assistance upon arrival at Sheikh Ul Alam Int’l Airport.",style: TextStyle(fontWeight: FontWeight.normal, color: AppColors.textColorBlack, fontSize: 12),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("1.", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColorGreen, fontSize: 16),),
                            Text("Assistance upon arrival at Sheikh Ul Alam Int’l Airport.",style: TextStyle(fontWeight: FontWeight.normal, color: AppColors.textColorBlack, fontSize: 12),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("1.", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColorGreen, fontSize: 16),),
                            Text("Assistance upon arrival at Sheikh Ul Alam Int’l Airport.",style: TextStyle(fontWeight: FontWeight.normal, color: AppColors.textColorBlack, fontSize: 12),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("1.", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColorGreen, fontSize: 16),),
                            Text("Assistance upon arrival at Sheikh Ul Alam Int’l Airport.",style: TextStyle(fontWeight: FontWeight.normal, color: AppColors.textColorBlack, fontSize: 12),),
                          ],
                        ), Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("1.", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColorGreen, fontSize: 16),),
                            Text("Assistance upon arrival at Sheikh Ul Alam Int’l Airport.",style: TextStyle(fontWeight: FontWeight.normal, color: AppColors.textColorBlack, fontSize: 12),),
                          ],
                        ),


                      ],
                    )
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
