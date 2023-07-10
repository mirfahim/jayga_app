import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jayga/modules/A_Base/controller/base_controller.dart';
import 'package:jayga/routes/app_pages.dart';
import 'package:jayga/services/auth_services.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

class BaseView extends GetView<BaseController> {
  const BaseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size.fromHeight(70.0), // here the desired height
          child:  Column(
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
        body: controller.currentPage,
        extendBody: true,
        bottomNavigationBar: BottomAppBar(
          notchMargin: 6,
          elevation: 10,
          shape: const AutomaticNotchedShape(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(15),
                bottom: Radius.circular(10),
              ),
            ),
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {

                        controller.currentIndex.value = 0;

                    },
                    child: Container(
                      width: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.search,
                            color: controller.currentIndex.value == 0
                                ? AppColors.textColorGreen
                                : Colors.black54,
                          ),
                          // Icon(
                          //   CupertinoIcons.home,
                          //   color: controller.currentIndex.value == 0
                          //       ? Colors.lightBlueAccent
                          //       : Colors.grey,
                          // ),
                          Text(
                            'Explore'.tr,
                            style: TextStyle(
                                fontSize: 10,
                                color: controller.currentIndex.value == 0
                                    ? AppColors.textColorGreen
                                    : Colors.black54,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {

                        controller.currentIndex.value = 1;

                    },
                    child: Container(
                      width: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.favorite_outline,
                            color: controller.currentIndex.value == 1
                                ? AppColors.textColorGreen
                                : Colors.black54,
                          ),
                          // Icon(
                          //   CupertinoIcons.home,
                          //   color: controller.currentIndex.value == 0
                          //       ? Colors.lightBlueAccent
                          //       : Colors.grey,
                          // ),
                          Text(
                            'Saved'.tr,
                            style: TextStyle(
                                fontSize: 10,
                                color: controller.currentIndex.value == 1
                                    ? AppColors.primaryColor
                                    : Colors.grey,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {

                        controller.currentIndex.value = 2;

                    },
                    child: Container(
                      width: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.book,
                            color: controller.currentIndex.value == 2
                                ? AppColors.textColorGreen
                                : Colors.black54,
                          ),
                          // Icon(
                          //   CupertinoIcons.home,
                          //   color: controller.currentIndex.value == 0
                          //       ? Colors.lightBlueAccent
                          //       : Colors.grey,
                          // ),
                          Text(
                            'My Bookings'.tr,
                            style: TextStyle(
                                fontSize: 10,
                                color: controller.currentIndex.value == 2
                                    ? AppColors.textColorGreen
                                    : Colors.black54,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {

                        controller.currentIndex.value = 3;

                    },
                    child: Container(
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.supervised_user_circle_outlined,
                            color: controller.currentIndex.value == 3
                                ? AppColors.textColorGreen
                                : Colors.grey,
                          ),
                          // Icon(
                          //   CupertinoIcons.home,
                          //   color: controller.currentIndex.value == 0
                          //       ? Colors.lightBlueAccent
                          //       : Colors.grey,
                          // ),
                          Text(
                            'Profile'.tr,
                            style: TextStyle(
                                fontSize: 10,
                                color: controller.currentIndex.value == 3
                                    ? AppColors.textColorGreen
                                    : Colors.grey,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Right Tab bar icons
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
