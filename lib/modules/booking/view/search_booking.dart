import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/services/firebase_service.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:jayga/utils/ui_support.dart';
//import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../../routes/app_pages.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_search/dropdown_search.dart';

class SearchListing extends GetView<BookingController> {
  const SearchListing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(


        preferredSize: Size.fromHeight(70.0), // here the desired height
        child:  Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 20,),
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
      ),
      backgroundColor: AppColors.appBackGroundBrn,
      body: Obx(() {
        return SingleChildScrollView(
          //physics: ScrollPhy,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              //height: MediaQuery.of(context).size.height *2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),

                  SizedBox(
                    height: 20,
                  ),




                  Center(
                    child: InkWell(
                      onTap: () {
                      //  FirebaseService().logCustomEvent();
                          Get.toNamed(Routes.BASE);
                        //controller.visible.value++;
                        // controller.loginController();
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 2),
                        height: controller.searchLoad.value == 1 ? 50 : 60,
                        width: controller.searchLoad.value == 1 ? 50 : 140,
                        decoration: BoxDecoration(
                            color: AppColors.textColorGreen,
                            borderRadius: BorderRadius.circular(
                                controller.searchLoad.value == 1 ? 60 : 40)),
                        alignment: Alignment.center,
                        child: controller.searchLoad.value == 1
                            ? Center(child: CircularProgressIndicator())
                            : Text(
                          "Search",
                          style: TextStyle(
                            color: AppColors.backgroundColor,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
