import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/booking/view/all_alemnities.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/modules/host_setup/controller/host_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/host_setup/controller/host_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';
import 'package:badges/badges.dart' as badges;

import '../../../../routes/app_pages.dart';

class LocationEdit extends GetView<HostController> {
  const LocationEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments[0];
    return Obx(() {
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

          child: Container(
            color: AppColors.appBackGroundBrn,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .6,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextFormField(
                            maxLines: 1,
                            controller: controller.streetAddress.value,
                            decoration: new InputDecoration(
                              filled: true,
                              fillColor: AppColors.jaygaWhite,
                              focusColor: Colors.white,
                              labelText: 'Street address',
                              // suffixIcon: Icon(
                              //   Icons.email_outlined,
                              // ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 2.0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.trim().isEmpty)
                                return "Email is Required";
                              else if (!GetUtils.isEmail(value.trim()))
                                return "Please enter valid email";
                              else
                                return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            height: 45,
                            color: AppColors.jaygaWhite,
                            child: DropdownSearch<String>(
                              mode: Mode.MENU,
                              // dropdownSearchDecoration: Ui.getInputDecorationWithIcon(
                              //   hintText: '',
                              //   // iconData:
                              //   //     CupertinoIcons.location_solid,
                              // ),
                              showSelectedItems: true,
                              items: Get.find<BookingController>()
                                  .getAllDistrict
                                  .isNotEmpty
                                  ? Get.find<BookingController>()
                                  .getAllDistrict
                                  .map((item) => item.name!)
                                  .toList()
                                  : [],
                              onChanged: (input) {
                                for (var item in Get.find<BookingController>()
                                    .getAllDistrict) {
                                  if (item.name == input) {
                                    controller.districtId.value =
                                        item.id.toString();
                                    print(
                                        "my district id is ${controller.districtId.value} ad input is $input");
                                    controller.districtName.value = input!;
                                    Get.find<BookingController>()
                                        .getArea(controller.districtId.value);
                                    print(
                                        "area list ${Get.find<BookingController>().areaListByDis.value} ad input is $input");
                                  }
                                }
                              },
                              selectedItem: "Select District".tr,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            height: 45,
                            color: AppColors.jaygaWhite,
                            child: DropdownSearch<String>(
                              mode: Mode.MENU,
                              // dropdownSearchDecoration: Ui.getInputDecorationWithIcon(
                              //   hintText: '',
                              //   // iconData:
                              //   //     CupertinoIcons.location_solid,
                              // ),
                              showSelectedItems: true,
                              items: Get.find<BookingController>()
                                  .areaListByDis
                                  .isNotEmpty
                                  ? Get.find<BookingController>()
                                  .areaListByDis
                                  .map((item) => item.name!)
                                  .toList()
                                  : [],
                              onChanged: (input) {
                                controller.areaName.value = input!;

                              },
                              selectedItem: "Select Area".tr,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            controller: controller.zip.value,
                            decoration: new InputDecoration(
                              filled: true,

                              fillColor: AppColors.jaygaWhite,
                              focusColor: Colors.white,
                              labelText: 'Zip Code/ Postal Code',
                              // suffixIcon: Icon(
                              //   Icons.email_outlined,
                              // ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 2.0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.trim().isEmpty)
                                return "Email is Required";
                              else if (!GetUtils.isEmail(value.trim()))
                                return "Please enter valid email";
                              else
                                return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .4,
                      width: MediaQuery.of(context).size.width * .9,
                      child: GoogleMap(
                        gestureRecognizers: Set()
                          ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
                          ..add(Factory<VerticalDragGestureRecognizer>(
                                  () => VerticalDragGestureRecognizer())),
                        zoomControlsEnabled: true,
                        scrollGesturesEnabled: true,
                        onTap: (latLng) {
                          controller.selectLocation.value = latLng;
                        },
                        initialCameraPosition: CameraPosition(
                          //target: LatLng(Get.find<LocationService>().currentLocation['lat'], Get.find<LocationService>().currentLocation['lng']),
                          zoom: 50,
                          target: LatLng(23.797911, 90.414391),
                        ),
                        markers: controller.selectLocation.value != null
                            ? {
                          Marker(
                            markerId: MarkerId('selected-location'),
                            position: controller.selectLocation.value!,
                            infoWindow: InfoWindow(
                              title: 'Selected Location',
                              snippet:
                              'Lat: ${controller.selectLocation.value!.latitude}, Lng: ${controller.selectLocation.value!.longitude}',
                            ),
                          ),
                        }
                            : {},
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {


                    controller
                        .editListingController(
                      listingID: data.listingId.toString(),
                      lister_id: data.listerId,
                      lister_name:
                      data.listerName,
                      guest_num: data.guestNum,
                      nid_number:
                      data.nidNumber,
                      bed_num: data.bedNum,
                      bathroom_num:
                      data.bathroomNum,
                      listing_title: controller
                          .houseTitle
                          .value
                          .text
                          .isEmpty
                          ? data.listingTitle
                          : controller
                          .houseTitle
                          .value
                          .text,
                      listing_description:
                      data.listingDescription,
                      full_day_price_set_by_user:
                      controller
                          .listingPrice
                          .value
                          .text
                          .isEmpty
                          ? data
                          .fullDayPriceSetByUser
                          : controller
                          .listingPrice
                          .value
                          .text,
                      listing_address: controller.streetAddress.value.text == ""?
                      data.listingAddress : controller.streetAddress.value.text,
                      zip_code: controller.zip.value.text == ""? data.zipCode : controller.zip.value.text,
                      district: controller.districtName.value == "" ? data.district: controller.districtName.value,
                      town: controller.areaName.value == "" ? data.town : controller.areaName.value,
                      allow_short_stay:
                      data.allowShortStay,
                      describe_peaceful:
                      data.describePeaceful,
                      describe_unique:
                      data.describeUnique,
                      describe_familyfriendly: data
                          .describeFamilyfriendly,
                      describe_stylish:
                      data.describeStylish,
                      describe_central:
                      data.describeCentral,
                      describe_spacious:
                      data.describeSpacious,
                      listing_type:
                      data.listingType,
                      lati: controller.selectLocation.value.longitude == 0 ? data.lat: controller.selectLocation.value!.latitude.toString(),
                      longi: controller.selectLocation.value.longitude == 0 ? data.long:controller.selectLocation.value!.longitude.toString(),

                      bread_breakfast: data
                          .amenities
                          .breakfastIncluded,
                      wifi: data.amenities.wifi,
                      tv: data.amenities.tv,
                      kitchen: data
                          .amenities.kitchen,
                      washing_machine: data
                          .amenities
                          .washingMachine,
                      free_parking: data
                          .amenities
                          .freeParking,
                      breakfast_included: data
                          .amenities
                          .breakfastIncluded,
                      air_condition: data
                          .amenities
                          .airCondition,
                      dedicated_workspace: data
                          .amenities
                          .dedicatedWorkspace,
                      pool: controller.qPool.value.toString(),
                      hot_tub:
                      data.amenities.hotTub,
                      patio:
                      data.amenities.patio,
                      bbq_grill: data
                          .amenities.bbqGrill,
                      fire_pit: data
                          .amenities.firePit,
                      gym: data.amenities.gym,
                      beach_lake_access: data
                          .amenities
                          .beachLakeAccess,
                      smoke_alarm: data
                          .amenities.smokeAlarm,
                      first_aid: data
                          .amenities.firstAid,
                      fire_extinguish: data
                          .amenities
                          .fireExtinguish,
                      cctv: data.amenities.cctv,
                    );


                  },
                  child: Center(
                    child: AnimatedContainer(
                        duration:
                        Duration(seconds: 2),
                        height: Get.height*.07,
                        width:
                        MediaQuery.of(context)
                            .size
                            .width *
                            .4,
                        decoration: BoxDecoration(
                            color: AppColors
                                .textColorGreen,
                            borderRadius:
                            BorderRadius
                                .circular(50)),
                        alignment: Alignment.center,
                        child: Text(
                          "Publish Changes",
                          style: TextStyle(
                            color: AppColors
                                .backgroundColor,
                            fontSize: 12,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }


}
