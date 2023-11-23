import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:jayga/modules/host_setup/controller/host_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

class Experiencelanding extends GetView<HostController> {
  const Experiencelanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(() {
        return Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .7,
              color: AppColors.appBackGroundBrn,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * .7,
                  aspectRatio: 10 / 8,
                  autoPlay: true,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                ),
                items: controller.sliderList.value
                    .map((item) => Container(
                          height: MediaQuery.of(context).size.height * .7,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fitWidth,
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
          ],
        );
      }),
    );
  }
}
