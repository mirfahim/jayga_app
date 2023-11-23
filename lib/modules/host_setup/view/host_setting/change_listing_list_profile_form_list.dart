import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/host_setup/controller/host_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';
import 'package:badges/badges.dart' as badges;

import '../../../../routes/app_pages.dart';

class ProfileListingList extends GetView<HostController> {
  const ProfileListingList({Key? key}) : super(key: key);

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
          return Container(
            height: MediaQuery.of(context).size.height * 2,
            color: AppColors.appBackGroundBrn,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      "Welcome back, Host",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    subtitle: Text(
                      "Edit your listings",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
                  controller.getListerProfileListing.value.isEmpty
                      ? Container()
                      : Container(
                          height: MediaQuery.of(context).size.height * .7,
                          child: ListView.builder(
                              itemCount: controller
                                  .getListerProfileListing.value.length,
                              itemBuilder: (BuildContext context, index) {
                                var data = controller
                                    .getListerProfileListing.value[index];
                                return Card(
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height * .5,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${data.listingTitle!}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14),
                                              ),

                                              Text(
                                                "Id: ${data.listingId}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          data.isApproved =="0"?
                                          Text(
                                            "Your listing is wating for approval from Jayga admin.",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.textColorRed,
                                                fontSize: 12),
                                          ) : Row(
                                            children: [
                                              Text(
                                                "Approved",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                              Icon(Icons.check, color: AppColors.textColorGreen,),
                                            ],
                                          )  ,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  if (data.isActive == "0") {
                                                    controller
                                                        .changeListingActiveStatus(
                                                            listingID:
                                                                data.listingId,
                                                            activeStatus: "1");
                                                  }
                                                },
                                                child: Center(
                                                  child: AnimatedContainer(
                                                      duration:
                                                          Duration(seconds: 2),
                                                      height: Get.height * .05,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .4,
                                                      decoration: BoxDecoration(
                                                          color: data.isActive ==
                                                                  "1"
                                                              ? AppColors
                                                                  .textColorGreen
                                                              : Colors.grey,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "Active",
                                                        style: TextStyle(
                                                          color: AppColors
                                                              .backgroundColor,
                                                          fontSize: 12,
                                                        ),
                                                      )),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  if (data.isActive == "1") {
                                                    controller
                                                        .changeListingActiveStatus(
                                                            listingID:
                                                                data.listingId,
                                                            activeStatus: "0");
                                                  }
                                                },
                                                child: Center(
                                                  child: AnimatedContainer(
                                                      duration:
                                                          Duration(seconds: 2),
                                                      height: Get.height * .05,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .4,
                                                      decoration: BoxDecoration(
                                                          color: data.isActive ==
                                                                  "0"
                                                              ? AppColors
                                                                  .textColorGreen
                                                              : Colors.grey,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "Inactive",
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
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                height: Get.height * .08,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .4,
                                                child: Column(
                                                  children: [
                                                    Text("Listing Title"),
                                                    SizedBox(
                                                      height: Get.height * .05,
                                                      child: TextFormField(
                                                        maxLines: 1,
                                                        controller: controller
                                                            .houseTitle.value,
                                                        decoration:
                                                            new InputDecoration(
                                                          hintText:
                                                              data.listingTitle,
                                                          filled: true,
                                                          fillColor: AppColors
                                                              .jaygaWhite,
                                                          focusColor:
                                                              Colors.white,
                                                          labelText:
                                                              data.listingTitle,
                                                          // suffixIcon: Icon(
                                                          //   Icons.email_outlined,
                                                          // ),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2.0),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  10.0),
                                                            ),
                                                          ),
                                                        ),
                                                        validator: (value) {
                                                          if (value!
                                                              .trim()
                                                              .isEmpty)
                                                            return "Email is Required";
                                                          else if (!GetUtils
                                                              .isEmail(
                                                                  value.trim()))
                                                            return "Please enter valid email";
                                                          else
                                                            return null;
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: Get.height * .08,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .4,
                                                child: Column(
                                                  children: [
                                                    Text("Listing Description"),
                                                    SizedBox(
                                                      height: Get.height * .05,
                                                      child: TextFormField(
                                                        maxLines: 1,
                                                        controller: controller
                                                            .listingDescription
                                                            .value,
                                                        decoration:
                                                            new InputDecoration(
                                                          hintText: data
                                                              .listingDescription,
                                                          filled: true,
                                                          fillColor: AppColors
                                                              .jaygaWhite,
                                                          focusColor:
                                                              Colors.white,
                                                          labelText: data
                                                              .listingDescription,
                                                          // suffixIcon: Icon(
                                                          //   Icons.email_outlined,
                                                          // ),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2.0),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  10.0),
                                                            ),
                                                          ),
                                                        ),
                                                        validator: (value) {
                                                          if (value!
                                                              .trim()
                                                              .isEmpty)
                                                            return "Email is Required";
                                                          else if (!GetUtils
                                                              .isEmail(
                                                                  value.trim()))
                                                            return "Please enter valid email";
                                                          else
                                                            return null;
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                height: Get.height * .08,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .4,
                                                child: Column(
                                                  children: [
                                                    Text("Price per night"),
                                                    SizedBox(
                                                      height: Get.height * .05,
                                                      child: TextFormField(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        maxLines: 1,
                                                        controller: controller
                                                                    .selectIndex
                                                                    .value ==
                                                                index
                                                            ? controller
                                                                .listingPrice
                                                                .value
                                                            : null,
                                                        decoration:
                                                            new InputDecoration(
                                                          hintText: data
                                                              .fullDayPriceSetByUser,
                                                          filled: true,
                                                          fillColor: AppColors
                                                              .jaygaWhite,
                                                          focusColor:
                                                              Colors.white,
                                                          labelText: data
                                                              .fullDayPriceSetByUser,
                                                          // suffixIcon: Icon(
                                                          //   Icons.email_outlined,
                                                          // ),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2.0),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  10.0),
                                                            ),
                                                          ),
                                                        ),
                                                        validator: (value) {
                                                          if (value!
                                                              .trim()
                                                              .isEmpty)
                                                            return "Email is Required";
                                                          else if (!GetUtils
                                                              .isEmail(
                                                                  value.trim()))
                                                            return "Please enter valid email";
                                                          else
                                                            return null;
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              InkWell(
                                                onTap: (){
                                                  Get.toNamed(
                                                      Routes.EDITLOCATION,
                                                      arguments: [data]);
                                                },
                                                child: Image.asset(
                                                  'assets/icons/mapedit.png',
                                                  // height: MediaQuery.of(context).size.height *.5,
                                                  // width: MediaQuery.of(context).size.width *.9,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  controller.selectIndex.value =
                                                      index;
                                                  if (controller
                                                          .selectIndex.value ==
                                                      index) {
                                                    if (controller.selectIndex
                                                            .value ==
                                                        index) {
                                                      controller
                                                          .editListingController(
                                                        listingID: data
                                                            .listingId
                                                            .toString(),
                                                        lister_id: data.listerId
                                                            .toString(),
                                                        lister_name:
                                                            data.listerName,
                                                        guest_num:
                                                            data.guestNum,
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
                                                        listing_description: controller
                                                                .listingDescription
                                                                .value
                                                                .text
                                                                .isEmpty
                                                            ? data
                                                                .listingDescription
                                                            : controller
                                                                .listingDescription
                                                                .value
                                                                .text,
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
                                                        listing_address:
                                                            data.listingAddress,
                                                        zip_code: data.zipCode,
                                                        district: data.district,
                                                        town: data.town,
                                                        allow_short_stay:
                                                            data.allowShortStay,
                                                        describe_peaceful: data
                                                            .describePeaceful,
                                                        describe_unique:
                                                            data.describeUnique,
                                                        describe_familyfriendly:
                                                            data.describeFamilyfriendly,
                                                        describe_stylish: data
                                                            .describeStylish,
                                                        describe_central: data
                                                            .describeCentral,
                                                        describe_spacious: data
                                                            .describeSpacious,
                                                        listing_type:
                                                            data.listingType,
                                                        lati: data.lat,
                                                        longi: data.long,
                                                        bread_breakfast: data
                                                            .amenities
                                                            .breakfastIncluded,
                                                        wifi:
                                                            data.amenities.wifi,
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
                                                        pool:
                                                            data.amenities.pool,
                                                        hot_tub: data
                                                            .amenities.hotTub,
                                                        patio: data
                                                            .amenities.patio,
                                                        bbq_grill: data
                                                            .amenities.bbqGrill,
                                                        fire_pit: data
                                                            .amenities.firePit,
                                                        gym: data.amenities.gym,
                                                        beach_lake_access: data
                                                            .amenities
                                                            .beachLakeAccess,
                                                        smoke_alarm: data
                                                            .amenities
                                                            .smokeAlarm,
                                                        first_aid: data
                                                            .amenities.firstAid,
                                                        fire_extinguish: data
                                                            .amenities
                                                            .fireExtinguish,
                                                        cctv:
                                                            data.amenities.cctv,
                                                      );
                                                    }
                                                  } else {
                                                    print("index different");
                                                  }
                                                },
                                                child: Center(
                                                  child: AnimatedContainer(
                                                      duration:
                                                          Duration(seconds: 2),
                                                      height: Get.height * .05,
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
                                                                  .circular(
                                                                      50)),
                                                      alignment:
                                                          Alignment.center,
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
                                              InkWell(
                                                onTap: () {
                                                  Get.toNamed(
                                                      Routes.EDITAMENITIES,
                                                      arguments: [data]);
                                                },
                                                child: Center(
                                                    child: Text(
                                                      "Edit More Details",
                                                      style: TextStyle(
                                                        color: AppColors
                                                            .textColorGreen,
                                                        fontSize: 12,
                                                      ),
                                                    )),
                                              ),

                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Get.toNamed(
                                                      Routes.EDITAMENITIES,
                                                      arguments: [data]);
                                                },
                                                child: Center(
                                                    child: Text(
                                                  "Change Amenities",
                                                  style: TextStyle(
                                                    color: AppColors
                                                        .textColorGreen,
                                                    fontSize: 12,
                                                  ),
                                                )),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Get.toNamed(
                                                      Routes.EDITRESTRICTION);
                                                },
                                                child: Center(
                                                  child: Text(
                                                    "Change Restrictions",
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .textColorGreen,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  controller.listingID.value =
                                                      data.listingId;
                                                  controller
                                                      .getListingImagesController(
                                                          controller
                                                              .listingID.value
                                                              .toString());
                                                  Get.toNamed(Routes
                                                      .ADDIMAGEEDITLISTING);
                                                },
                                                child: Center(
                                                  child: Text(
                                                    "Change Images",
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .textColorGreen,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
