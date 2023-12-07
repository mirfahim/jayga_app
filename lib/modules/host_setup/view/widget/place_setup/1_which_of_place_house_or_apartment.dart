import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/booking/view/all_alemnities.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/modules/host_setup/controller/host_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

class WhichOfPlace extends GetView<HostController> {
  const WhichOfPlace({Key? key}) : super(key: key);
//index5
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Obx(
         () {
          return Container(
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
                            "Which of these best describes your place?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.black),
                          ),
                          Text(
                            "Select the nearest description of your residence that you want to rent out",
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
                                onTap:(){

                                    controller.listingType.value = "House";


                    },
                                child: Container(
                                  height: MediaQuery.of(context).size.height *.122,
                                    width: MediaQuery.of(context).size.width *.3,
                                  decoration: BoxDecoration(
                                      color: controller.listingType.value != "House" ? Colors.white : Colors.green,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Card(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,

                                      children: [
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              image: DecorationImage(


                                                fit: BoxFit.fill,
                                                image: AssetImage(


                                                  'assets/icons/host/place_type/house.png',
                                                ),
                                              )),
                                        ),
                                        Text("House")
                                      ],
                                    ),
                                  )
                                ),
                              ),
                              InkWell(
                                  onTap:(){

                                      controller.listingType.value = "Flat";


                                  },
                                  
                             child: Container(
                                  height: MediaQuery.of(context).size.height *.12,
                                  width: MediaQuery.of(context).size.width *.3,
                                  decoration: BoxDecoration(
                                      color: controller.listingType.value != "Flat" ? Colors.white : Colors.green,

                                      borderRadius: BorderRadius.circular(10)),
                                  child: Card(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage(
                                                  'assets/icons/host/place_type/apartment.png',
                                                ),
                                              )),
                                        ),
                                        Text("Flat/Apartment")
                                      ],
                                    ),
                                  )
                              )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                  onTap:(){

                                    controller.listingType.value = "Hotel";


                                  },
                                  child:
                                  Container(
                                      height: MediaQuery.of(context).size.height *.12,
                                      width: MediaQuery.of(context).size.width *.3,
                                      decoration: BoxDecoration(
                                          color: controller.listingType.value != "Hotel" ? Colors.white : Colors.green,

                                          borderRadius: BorderRadius.circular(10)),
                                      child: Card(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,

                                          children: [
                                            Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  image: DecorationImage(

                                                    fit: BoxFit.fill,
                                                    image: AssetImage(

                                                      'assets/icons/host/place_type/hotel.png',
                                                    ),
                                                  )),
                                            ),
                                            Text("Hotel")
                                          ],
                                        ),
                                      )
                                  )),
                              // InkWell(
                              //   onTap:(){
                              //
                              //       controller.listingType.value = "Cabin";
                              //
                              //
                              //   },
                              //   child:
                              // Container(
                              //     height: MediaQuery.of(context).size.height *.12,
                              //     width: MediaQuery.of(context).size.width *.3,
                              //     decoration: BoxDecoration(
                              //         color: controller.listingType.value != "Cabin" ? Colors.white : Colors.green,
                              //
                              //         borderRadius: BorderRadius.circular(10)),
                              //     child: Card(
                              //       child: Column(
                              //         mainAxisAlignment: MainAxisAlignment.center,
                              //
                              //         children: [
                              //           Container(
                              //             height: 30,
                              //             width: 30,
                              //             decoration: BoxDecoration(
                              //                 borderRadius: BorderRadius.circular(5),
                              //                 image: DecorationImage(
                              //
                              //                   fit: BoxFit.fill,
                              //                   image: AssetImage(
                              //
                              //                     'assets/icons/host/place_type/cabin.png',
                              //                   ),
                              //                 )),
                              //           ),
                              //           Text("Cabin")
                              //         ],
                              //       ),
                              //     )
                              // )),
                              InkWell(
                                onTap:(){

                                    controller.listingType.value = "Lounge";


                                },
                                child:
                              Container(
                                  height: MediaQuery.of(context).size.height *.12,
                                  width: MediaQuery.of(context).size.width *.3,
                                  decoration: BoxDecoration(
                                      color: controller.listingType.value != "Lounge" ? Colors.white : Colors.green,

                                      borderRadius: BorderRadius.circular(10)),
                                  child: Card(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage(
                                                  'assets/icons/host/place_type/lounge.png',
                                                ),
                                              )),
                                        ),
                                        Text("Lounge")
                                      ],
                                    ),
                                  )
                              )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap:(){

                                    controller.listingType.value = "Farm";


                                },
                                child:
                              Container(
                                  height: MediaQuery.of(context).size.height *.12,
                                  width: MediaQuery.of(context).size.width *.3,
                                  decoration: BoxDecoration(
                                      color: controller.listingType.value != "Farm" ? Colors.white : Colors.green,

                                      borderRadius: BorderRadius.circular(10)),
                                  child: Card(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,

                                      children: [
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              image: DecorationImage(

                                                fit: BoxFit.fill,
                                                image: AssetImage(

                                                  'assets/icons/host/place_type/farm.png',
                                                ),
                                              )),
                                        ),
                                        Text("Farm")
                                      ],
                                    ),
                                  )
                              )),
                              InkWell(
                                onTap:(){

                                    controller.listingType.value = "Camp site";


                                },
                                child:
                              Container(
                                  height: MediaQuery.of(context).size.height *.12,
                                  width: MediaQuery.of(context).size.width *.3,
                                  decoration: BoxDecoration(
                                      color:  controller.listingType.value != "Camp site" ? Colors.white : Colors.green,

                                      borderRadius: BorderRadius.circular(10)),
                                  child: Card(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage(
                                                  'assets/icons/host/place_type/camping-tent.png',
                                                ),
                                              )),
                                        ),
                                        Text("Camp site")
                                      ],
                                    ),
                                  )
                              )),
                            ],
                          ),





                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
        }
      )


    );

  }
}
