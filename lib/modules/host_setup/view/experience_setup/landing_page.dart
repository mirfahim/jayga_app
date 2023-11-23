import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/booking/view/all_alemnities.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/modules/host_setup/controller/host_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';
import 'package:jayga/utils/ui_support.dart';

class ExperienceSetupLanding extends GetView<HostController> {
  const ExperienceSetupLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0), // here the desired height
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
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
      body: SingleChildScrollView(
        child: Obx(() {
          return Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                color: AppColors.appBackGroundBrn,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height,
                    autoPlay: true,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                  ),
                  items: controller.sliderList.value
                      .map((item) => Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                              item,
                            ))),
                          ))
                      .toList(),
                ),
              ),
              Positioned(
                  top: 120,
                  child: Container(
                    height: MediaQuery.of(context).size.height * .1,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/experience.png"))),
                  )),
              Positioned(
                  top: 50,
                  right: 140,
                  child: Container(
                    height: MediaQuery.of(context).size.height * .15,
                    width: MediaQuery.of(context).size.width * .5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/images/jayga_logo.png"))),
                  )),
              Positioned(
                  bottom: 100,
                  left: 100,
                  child: Container(
                    height: MediaQuery.of(context).size.height * .15,
                    width: MediaQuery.of(context).size.width * .5,
                    child: InkWell(
                      onTap: () {
                        controller.pageIndex.value = 3;
                      },
                      child: Center(
                        child: AnimatedContainer(
                          duration: Duration(seconds: 2),
                          height: 50,
                          width: MediaQuery.of(context).size.width - 100,
                          decoration: BoxDecoration(
                              color: AppColors.textColorGreen,
                              borderRadius: BorderRadius.circular(50)),
                          alignment: Alignment.center,
                          child: controller.pageIndex.value == 18
                              ? controller.loading.value == true
                                  ? CircularProgressIndicator()
                                  : Text(
                                      "Publish",
                                      style: TextStyle(
                                        color: AppColors.backgroundColor,
                                        fontSize: 15,
                                      ),
                                    )
                              : Text(
                                  "Continue",
                                  style: TextStyle(
                                    color: AppColors.backgroundColor,
                                    fontSize: 15,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  )),
            ],
          );
        }),
      ),
    );
  }
}
