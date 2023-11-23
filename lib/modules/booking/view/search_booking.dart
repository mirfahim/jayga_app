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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .7,
                  decoration: BoxDecoration(
                      color: AppColors.jaygaShadowBrwn,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text("Where to?"),
                        subtitle: Container(
                          height: 45,
                          color: Colors.white,
                          child: DropdownSearch<String>(
                            mode: Mode.MENU,
                            // dropdownSearchDecoration: Ui.getInputDecorationWithIcon(
                            //   hintText: '',
                            //   // iconData:
                            //   //     CupertinoIcons.location_solid,
                            // ),
                            showSelectedItems: true,
                            items: controller.getAllDistrict.isNotEmpty
                                ? controller.getAllDistrict!
                                .map((item) => item.name!)
                                .toList()
                                : [],
                            onChanged: (input) {
                              for (var item in controller.getAllDistrict) {
                                if (item.name == input) {
                                  controller.filterListData.clear();
                                  controller.districtId.value =
                                      item.id.toString();
                                  controller.districtName.value = input!;
                                  controller.filterListData.add(
                                      {"dis" :controller.districtName.value});
                                  print("my district id is ${controller.districtId.value} ad input is $input");
                                  controller.getArea(controller.districtId.value);
                                  print("area list ${controller.areaListByDis.value} ad input is $input");

                                }
                              }
                            },
                            selectedItem: "Select District".tr,
                          ),
                        ),

                      ),
                      ListTile(
                        title: Text("Select Area"),
                        subtitle: Container(
                          height: 45,
                          color: Colors.white,
                          child: DropdownSearch<String>(
                            mode: Mode.MENU,
                            // dropdownSearchDecoration: Ui.getInputDecorationWithIcon(
                            //   hintText: '',
                            //   // iconData:
                            //   //     CupertinoIcons.location_solid,
                            // ),
                            showSelectedItems: true,
                            items: controller.areaListByDis
                                .isNotEmpty
                                ? controller.areaListByDis
                                .map((item) => item.name!)
                                .toList()
                                : [],
                            onChanged: (input) {

                              controller.areaName.value = input!;
                              controller.filterListData.add(
                                  {"area": controller.areaName.value});
                            },
                            selectedItem: "Select Area".tr,
                          ),
                        ),

                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Short Stay?",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),),
                            Switch(
                              value: controller.searchShortStay.value,
                              onChanged: (value) {

                                controller.searchShortStay.value = value;
                                if(controller.searchShortStay.value == false){
                                  controller.shortStay.value = 0;
                                }else{
                                  controller.shortStay.value = 1;
                                }
                                // setState(() {
                                //   isSwitched = value;
                                //   print(isSwitched);
                                // });
                              },
                              activeTrackColor: Colors.purple[200],
                              activeColor: AppColors.textColorGreen,
                            ),
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Column(
                      //         children: [
                      //           Text("Guest Num"),
                      //
                      //           Container(
                      //             width: MediaQuery.of(context).size.width * .3,
                      //             child: Row(
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               children: [
                      //                 InkWell(
                      //                   onTap: () {
                      //                     if (controller.numGuest.value > 0) {
                      //                       controller.numGuest.value--;
                      //                     } else {}
                      //                   },
                      //                   child: CircleAvatar(
                      //                     radius: 15,
                      //                     backgroundColor: AppColors.textColorWhite,
                      //                     child: Icon(Icons.remove),
                      //                   ),
                      //                 ),
                      //                 SizedBox(
                      //                   width: 5,
                      //                 ),
                      //                 Text(controller.numGuest.value.toString()),
                      //                 SizedBox(
                      //                   width: 5,
                      //                 ),
                      //                 InkWell(
                      //                   onTap: () {
                      //                     controller.numGuest.value++;
                      //                   },
                      //                   child: CircleAvatar(
                      //                     radius: 15,
                      //                     backgroundColor: AppColors.textColorWhite,
                      //                     child: Icon(Icons.add),
                      //                   ),
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //
                      //         ],
                      //       ),
                      //
                      //       Column(
                      //         children: [
                      //           Text("Bed Num"),
                      //
                      //           Container(
                      //             width: MediaQuery.of(context).size.width * .3,
                      //             child: Row(
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               children: [
                      //                 InkWell(
                      //                   onTap: () {
                      //                     if (controller.numbedRooms.value > 0) {
                      //                       controller.numbedRooms.value--;
                      //
                      //
                      //
                      //                     } else {}
                      //                   },
                      //                   child: CircleAvatar(
                      //                     radius: 15,
                      //                     backgroundColor: AppColors.textColorWhite,
                      //                     child: Icon(Icons.remove),
                      //                   ),
                      //                 ),
                      //                 SizedBox(
                      //                   width: 5,
                      //                 ),
                      //                 Text(controller.numbedRooms.value.toString()),
                      //                 SizedBox(
                      //                   width: 5,
                      //                 ),
                      //                 InkWell(
                      //                   onTap: () {
                      //                     controller.numbedRooms.value++;
                      //                   },
                      //                   child: CircleAvatar(
                      //                     radius: 15,
                      //                     backgroundColor: AppColors.textColorWhite,
                      //                     child: Icon(Icons.add),
                      //                   ),
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //
                      //         ],
                      //       ),
                      //
                      //
                      //
                      //
                      //     ],
                      //   ),
                      // ),
                      SizedBox(height: 20,),
                      Text("Search By Amenities",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width *.3,
                            child: Column(
                              children: [
                                Text("Pool"),

                                Switch(
                                  value: controller.searchPool.value,
                                  onChanged: (value) {

                                    controller.searchPool.value = value;
                                    if(controller.searchPool.value == false){
                                      controller.searchPoolInt.value = 0;
                                    }else{
                                      controller.searchPoolInt.value = 1;
                                    }
                                  },
                                  activeTrackColor: Colors.purple[200],
                                  activeColor: AppColors.textColorGreen,
                                ),

                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width *.3,
                            child: Column(
                              children: [
                                Text("Gym"),

                                Switch(
                                  value: controller.searchGym.value,
                                  onChanged: (value) {

                                    controller.searchGym.value = value;
                                    if(controller.searchGym.value == false){
                                      controller.searchGymInt.value = 0;
                                    }else{
                                      controller.searchGymInt.value = 1;
                                    }
                                  },
                                  activeTrackColor: Colors.purple[200],
                                  activeColor: AppColors.textColorGreen,
                                ),

                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width *.3,
                            child: Column(
                              children: [
                                Text("Beach side"),

                                Switch(
                                  value: controller.searchBeachSide.value,
                                  onChanged: (value) {

                                    controller.searchBeachSide.value = value;
                                    if(controller.searchBeachSide.value == false){
                                      controller.searchBeachSideInt.value = 0;
                                    }else{
                                      controller.searchBeachSideInt.value = 1;
                                    }
                                  },
                                  activeTrackColor: Colors.purple[200],
                                  activeColor: AppColors.textColorGreen,
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width *.3,
                            child: Column(
                              children: [
                                Text("Air Conditioning"),

                                Switch(
                                  value: controller.searchAc.value,
                                  onChanged: (value) {

                                    controller.searchAc.value = value;
                                    if(controller.searchAc.value == false){
                                      controller.searchAcInt.value = 0;
                                    }else{
                                      controller.searchAcInt.value = 1;
                                    }
                                  },
                                  activeTrackColor: Colors.purple[200],
                                  activeColor: AppColors.textColorGreen,
                                ),

                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width *.3,
                            child: Column(
                              children: [
                                Text("Free Parking"),

                                Switch(
                                  value: controller.searchParking.value,
                                  onChanged: (value) {

                                    controller.searchParking.value = value;
                                    if(controller.searchParking.value == false){
                                      controller.searchParkingInt.value = 0;
                                    }else{
                                      controller.searchParkingInt.value = 1;
                                    }
                                  },
                                  activeTrackColor: Colors.purple[200],
                                  activeColor: AppColors.textColorGreen,
                                ),

                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width *.3,
                            child: Column(
                              children: [
                                Text("Dedicated Workspace"),

                                Switch(
                                  value: controller.searchWorkSpace.value,
                                  onChanged: (value) {
                                    controller.searchWorkSpace.value = value;
                                    if(controller.searchWorkSpace.value == false){
                                      controller.searchWorkSpaceInt.value = 0;
                                    }else{
                                      controller.searchWorkSpaceInt.value = 1;
                                    }
                                  },
                                  activeTrackColor: Colors.purple[200],
                                  activeColor: AppColors.textColorGreen,
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Text("Allowed?",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width *.3,

                            child: Column(
                              children: [
                                Text("Late night entry"),

                                Switch(
                                  value: controller.searchNightEntry.value,
                                  onChanged: (value) {
                                    controller.searchNightEntry.value = value;
                                    if(controller.searchNightEntry.value == false){
                                      controller.searchNightInt.value = 0;
                                    }else{
                                      controller.searchNightInt.value = 1;
                                    }
                                  },
                                  activeTrackColor: Colors.purple[200],
                                  activeColor: AppColors.textColorGreen,
                                ),

                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width *.3,

                            child: Column(
                              children: [
                                Text("Pets"),

                                Switch(
                                  value: controller.searchPets.value,
                                  onChanged: (value) {

                                    controller.searchPets.value = value;
                                    if(controller.searchPets.value == false){
                                      controller.searchPetsInt.value = 0;
                                    }else{
                                      controller.searchPetsInt.value = 1;
                                    }
                                  },
                                  activeTrackColor: Colors.purple[200],
                                  activeColor: AppColors.textColorGreen,
                                ),

                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width *.3,

                            child: Column(
                              children: [
                                Text("Additional Guest"),

                                Switch(
                                  value: controller.searchAddiGuest.value,
                                  onChanged: (value) {
                                    controller.searchAddiGuest.value = value;
                                    if(controller.searchAddiGuest.value == false){
                                      controller.searchAddiInt.value = 0;
                                    }else{
                                      controller.searchAddiInt.value = 1;
                                    }
                                  },
                                  activeTrackColor: Colors.purple[200],
                                  activeColor: AppColors.textColorGreen,
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
        );
      }),
    );
  }
}
