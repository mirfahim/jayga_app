import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/booking/view/all_alemnities.dart';
import 'package:jayga/modules/booking/view/avaiblity_check.dart';
import 'package:jayga/modules/booking/view/my_booking_history/payment_webview.dart';
import 'package:jayga/modules/booking/view/my_booking_history/review_list_view.dart';
import 'package:jayga/modules/group_tour/controller/group_tour_controller.dart';
import 'package:jayga/modules/group_tour/view/package_includes.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:slide_countdown/slide_countdown.dart';
import '../../../routes/app_pages.dart';
import '../../../services/location_service.dart';

import 'package:intl/intl.dart';

class GroupTourDetails extends GetView<GroupTourController> {
  const GroupTourDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var data = Get.arguments[0];


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
      body: WillPopScope(
        onWillPop: () async {
          Get.offAllNamed(Routes.BASE);
          return true;
        },
        child: SingleChildScrollView(
          child: Obx(() {
            return controller.seeAmenities.value == false
                ? Container(
              color: AppColors.appBackGroundBrn,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * .25,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: Colors.transparent, width: 2),
                        color: AppColors.appBackGroundBrn,
                      ),
                      child: CarouselSlider(
                        options: CarouselOptions(
                            height: 400.0,
                        autoPlay: true),
                        items: data.images!.map<Widget>((i) {
                          print("all images are ${data.images.length}");
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    color: Colors.transparent
                                ),
                                child:   CachedNetworkImage(
                                  //imageUrl: "http://new.jaygaheight: MediaQuery.of(context).size.height *.12/uploads/listings/66dGWkgYLX5JyZGg0uHTv9N8M1bGhcCtBNzsX3MD.jpg",
                                  imageUrl: "https://new.jayga.io/uploads/listings/${i.listingFilename}",
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.circular(20),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                  placeholder: (context, url) =>
                                  const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Image(
                                      image: AssetImage(
                                        'assets/images/jayga_logo.png',
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                  const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Image(
                                      image: AssetImage(
                                        'assets/images/jayga_logo.png',),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      )
                  ),

                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: SlideCountdownSeparated(
                              duration: const Duration(days: 2),
                              separatorType: SeparatorType.title,
                              slideDirection: SlideDirection.up,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            margin: EdgeInsets.all(8),
                            child: Table(

                              border: TableBorder.all(),
                              columnWidths: const <int, TableColumnWidth>{
                                0: IntrinsicColumnWidth(),
                                1: FlexColumnWidth(),
                                2: FixedColumnWidth(40),
                              },
                              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                              children: <TableRow>[
                                TableRow(
                                  decoration: BoxDecoration(


                                  ),
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text("Tour Name", style: TextStyle(color: AppColors.textColorGreen),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text("Name of the tour", style: TextStyle(color: AppColors.textColorBlack, fontSize: 12)),
                                    ),


                                    SizedBox(
                                      height: Get.height*.05,
                                      width: Get.width*.1,
                                      child: Checkbox(
                                          value: controller.checkTitle.value,
                                          onChanged: (e){
                                            controller.checkTitle.value = e!;
                                          },
                                        ),
                                    ),

                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text("Destination",  style: TextStyle(color: AppColors.textColorGreen)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text("destination place name", style: TextStyle(color: AppColors.textColorBlack, fontSize: 12)),
                                    ),
                                    SizedBox(
                                      height: Get.height*.05,
                                      width: Get.width*.1,
                                      child: Checkbox(
                                        value: controller.checkTitle.value,
                                        onChanged: (e){
                                          controller.checkTitle.value = e!;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text("Cost",  style: TextStyle(color: AppColors.textColorGreen)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text("8000/head", style: TextStyle(color: AppColors.textColorBlack, fontSize: 12)),
                                    ),
                                    SizedBox(
                                      height: Get.height*.05,
                                      width: Get.width*.1,
                                      child: Checkbox(
                                        value: controller.checkTitle.value,
                                        onChanged: (e){
                                          controller.checkTitle.value = e!;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text("Tour period",  style: TextStyle(color: AppColors.textColorGreen)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text("3nights, 4 days", style: TextStyle(color: AppColors.textColorBlack, fontSize: 12)),
                                    ),
                                    SizedBox(
                                      height: Get.height*.05,
                                      width: Get.width*.1,
                                      child: Checkbox(
                                        value: controller.checkTitle.value,
                                        onChanged: (e){
                                          controller.checkTitle.value = e!;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text("Journey Date",  style: TextStyle(color: AppColors.textColorGreen)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text("27 January , 2023", style: TextStyle(color: AppColors.textColorBlack, fontSize: 12)),
                                    ),
                                    SizedBox(
                                      height: Get.height*.05,
                                      width: Get.width*.1,
                                      child: Checkbox(
                                        value: controller.checkTitle.value,
                                        onChanged: (e){
                                          controller.checkTitle.value = e!;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text("End Date",  style: TextStyle(color: AppColors.textColorGreen)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text("31 January , 2023", style: TextStyle(color: AppColors.textColorBlack, fontSize: 12)),
                                    ),
                                    SizedBox(
                                      height: Get.height*.05,
                                      width: Get.width*.1,
                                      child: Checkbox(
                                        value: controller.checkTitle.value,
                                        onChanged: (e){
                                          controller.checkTitle.value = e!;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text("Registration last Date",  style: TextStyle(color: AppColors.textColorGreen)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text("25 January , 2023",  style: TextStyle(color: AppColors.textColorBlack, fontSize: 12)),
                                    ),
                                    SizedBox(
                                      height: Get.height*.05,
                                      width: Get.width*.1,
                                      child: Checkbox(
                                        value: controller.checkTitle.value,
                                        onChanged: (e){
                                          controller.checkTitle.value = e!;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text("Spot",  style: TextStyle(color: AppColors.textColorGreen,)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text("Sajek, Nilgiri, Jhorna, Hill Trek", style: TextStyle(color: AppColors.textColorBlack, fontSize: 12)),
                                    ),
                                    SizedBox(
                                      height: Get.height*.05,
                                      width: Get.width*.1,
                                      child: Checkbox(
                                        value: controller.checkTitle.value,
                                        onChanged: (e){
                                          controller.checkTitle.value = e!;
                                        },
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            )
                          ),




                          Divider(),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            children: [
                              Text(
                                "Breakfast:${data.guestNum}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                color: Colors.grey,
                                height: 10,
                                width: 2,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Lunch:${data.bedNum}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                color: Colors.grey,
                                height: 10,
                                width: 2,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Dinner:${data.bathroomNum}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                color: Colors.grey,
                                height: 10,
                                width: 2,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Snacks:${data.bathroomNum}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 30,
                                child: Text(
                                  maxLines: 2,
                                  "Description",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  //  Get.toNamed(Routes.HOME);
                                  //controller.visible.value++;
                                  // controller.loginController();
                                },
                                child: AnimatedContainer(
                                  duration: Duration(seconds: 2),
                                  height: 20,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius:
                                      BorderRadius.circular(50)),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "3D Tour",
                                    style: TextStyle(
                                      color: AppColors.backgroundColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          Center(
                            child: Text(
                              data.listingDescription,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 70,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: AppColors.textColorWhite,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: AppColors.textColorGreen,
                                      width: 2),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  //crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/icons/single_room.png",
                                      color: AppColors.textColorGreen,
                                      height: 20,
                                      width: 20,
                                    ),
                                    Center(
                                      child: Container(
                                        height: 30,
                                        width: 50,
                                        child: Center(
                                          child: Text(
                                            "Single Room",
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.normal,
                                                fontSize: 12,
                                                color: AppColors
                                                    .textColorGreen),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 70,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: AppColors.textColorWhite,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: AppColors.textColorGreen,
                                      width: 2),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  //crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/icons/sanitary.png",
                                      color: AppColors.textColorGreen,
                                      height: 20,
                                      width: 20,
                                    ),
                                    Center(
                                      child: Container(
                                        height: 30,
                                        width: 50,
                                        child: Center(
                                          child: Text(
                                            "Sanitary stations",
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.normal,
                                                fontSize: 12,
                                                color: AppColors
                                                    .textColorGreen),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 70,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: AppColors.textColorWhite,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: AppColors.textColorGreen,
                                      width: 2),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  //crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/icons/host/place_offer/wifi.png",
                                      color: AppColors.textColorGreen,
                                      height: 20,
                                      width: 20,
                                    ),
                                    Center(
                                      child: Container(
                                        height: 30,
                                        width: 50,
                                        child: Center(
                                          child: Text(
                                            "Personal WIFI",
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.normal,
                                                fontSize: 12,
                                                color: AppColors
                                                    .textColorGreen),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 70,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: AppColors.textColorWhite,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: AppColors.textColorGreen,
                                      width: 2),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  //crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/icons/bathroom.png",
                                      color: AppColors.textColorGreen,
                                      height: 20,
                                      width: 20,
                                    ),
                                    Center(
                                      child: Container(
                                        height: 30,
                                        width: 50,
                                        child: Center(
                                          child: Text(
                                            "Bathroom",
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.normal,
                                                fontSize: 12,
                                                color: AppColors
                                                    .textColorGreen),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              controller.seeAmenities.value = true;
                            },
                            child: Center(
                              child: Text(
                                "Package Includes",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: AppColors.textColorGreen),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            title: Row(
                              children: [
                                Text(
                                  "Jayga",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: AppColors.textColorGreen),
                                ),
                                Text(
                                  " Protect",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black54),
                                ),
                              ],
                            ),
                            subtitle: Text(
                              "Every booking includes free protection from Host cancellations, listing inaccuracies, and other issues like trouble checking in.",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: Colors.black54),
                            ),
                          ),
                          Text(
                            "Reviews",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black54),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                              Text(
                                controller.getReviewModel.value
                                    .averageRating ==
                                    null
                                    ? "5"
                                    : controller.getReviewModel.value
                                    .averageRating
                                    .toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black54),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                  height: 15,
                                  width: 2,
                                  color: Colors.black54),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  // controller.selectReview.value = true;
                                  Get.to(ReviewListView(),
                                      arguments: [data]);
                                },
                                child: Text(
                                  "${controller.getReview.value.length} reviews",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: AppColors.textColorGreen),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          Center(
                            child: Text(
                              "Highlighted reviews",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          Divider(
                            thickness: 2,
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height *
                                  .15,
                              child: controller.getReview.value.isEmpty
                                  ? Text("No review yet")
                                  : ListView.builder(
                                  itemCount: controller
                                      .getReview.value.length,
                                  itemBuilder: (BuildContext c, i) {
                                    var data =
                                    controller.getReview[i];
                                    return ListTile(
                                      title: Row(
                                        children: [
                                          Text(
                                            data.userName ??
                                                "No Data",
                                            style: TextStyle(
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            DateFormat.yMd()
                                                .add_jm()
                                                .format(
                                              data.createdAt,
                                            ),
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight:
                                                FontWeight.normal,
                                                color:
                                                Colors.black54),
                                          ),
                                          Text(
                                            data.description,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight:
                                                FontWeight.normal,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      leading: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.textColorGreen,
                                        ),
                                        child: Icon(Icons.verified_user, color: Colors.white, size: 30,),
                                        // color: AppColors.backgroundColor,
                                      ),
                                    );
                                  })),
                          Divider(
                            thickness: 1,
                          ),
                          ListTile(
                            title: Text(
                              data.listerName,
                              style: TextStyle(fontSize: 22),
                            ),
                            subtitle: Text("Hosted by"),
                            trailing: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/kaif.png"))),
                              // color: AppColors.backgroundColor,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                              Text(
                                "15 host reviews",
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.verified_user,
                                color: Colors.green,
                              ),
                              Text(
                                "Identity Verified",
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          Divider(),
                          InkWell(
                            onTap: () {
                              controller.makePhoneCall("01764314845");
                              //  Get.toNamed(Routes.HOME);
                              //controller.visible.value++;
                              // controller.loginController();
                            },
                            child: Center(
                              child: AnimatedContainer(
                                duration: Duration(seconds: 2),
                                height: 40,
                                width: MediaQuery.of(context).size.width -
                                    100,
                                decoration: BoxDecoration(
                                    color: AppColors.textColorGreen,
                                    borderRadius:
                                    BorderRadius.circular(50)),
                                alignment: Alignment.center,
                                child: Text(
                                  "Get Support",
                                  style: TextStyle(
                                    color: AppColors.backgroundColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.BOOKGROUPTOUR,
                                  arguments: [data]);
                              //controller.visible.value++;
                              // controller.loginController();
                            },
                            child: Center(
                              child: AnimatedContainer(
                                duration: Duration(seconds: 2),
                                height: 40,
                                width: MediaQuery.of(context).size.width -
                                    100,
                                decoration: BoxDecoration(
                                    color: AppColors.textColorGreen,
                                    borderRadius:
                                    BorderRadius.circular(50)),
                                alignment: Alignment.center,
                                child: Text(
                                  "Book Now",
                                  style: TextStyle(
                                    color: AppColors.backgroundColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Location",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black54),
                          ),
                          Text(
                            "View on map:",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                color: AppColors.textColorGreen),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Stack(
                            children: [
                              SizedBox(
                                height:
                                MediaQuery.of(context).size.height *
                                    .4,
                                width: MediaQuery.of(context).size.width,
                                child: GoogleMap(
                                    gestureRecognizers: Set()
                                      ..add(Factory<PanGestureRecognizer>(
                                              () => PanGestureRecognizer()))
                                      ..add(Factory<
                                          VerticalDragGestureRecognizer>(
                                              () =>
                                              VerticalDragGestureRecognizer())),
                                    zoomControlsEnabled: true,
                                    scrollGesturesEnabled: true,
                                    initialCameraPosition: CameraPosition(
                                      target: LatLng(
                                          double.parse(data.lat),
                                          double.parse(data.long)),
                                      zoom: 10,
                                      //target: LatLng(23.797911, 90.414391),
                                    ),
                                    markers: {
                                      Marker(
                                        markerId:
                                        MarkerId('selected-location'),
                                        position: LatLng(
                                            double.parse(data.lat),
                                            double.parse(data.long)),
                                        infoWindow: InfoWindow(
                                          title: 'Selected Location',
                                        ),
                                      ),
                                    }),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Host Restriction",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    if (controller.seeRestriction.value ==
                                        false) {
                                      controller.seeRestriction.value =
                                      true;
                                    } else {
                                      controller.seeRestriction.value =
                                      false;
                                    }
                                  },
                                  child: controller
                                      .seeRestriction.value ==
                                      false
                                      ? Icon(
                                    Icons
                                        .arrow_drop_down_circle_outlined,
                                    color: AppColors.textColorGreen,
                                  )
                                      : Icon(
                                    Icons.arrow_circle_up,
                                    color: AppColors.textColorGreen,
                                  )),
                            ],
                          ),
                          controller.seeRestriction.value == false
                              ? Container()
                              : Container(
                            height:
                            MediaQuery.of(context).size.height *
                                .34,
                            child: Column(children: [
                              ListTile(
                                title: Text("Late night entry"),
                                leading: Container(
                                  height: 30,
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    alignment: Alignment.bottomLeft,
                                    // color: AppColors.backgroundColor,
                                    child: Image.asset(
                                      'assets/icons/host/restriction/no_entry.png',
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text("No pets are allowed"),
                                leading: Container(
                                  height: 30,
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    alignment: Alignment.bottomLeft,
                                    // color: AppColors.backgroundColor,
                                    child: Image.asset(
                                      'assets/icons/host/restriction/no_smoke.png',
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ),
                              ),
                              ListTile(
                                title:
                                Text("No parties are allowed"),
                                leading: Container(
                                  height: 30,
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    alignment: Alignment.bottomLeft,
                                    // color: AppColors.backgroundColor,
                                    child: Image.asset(
                                      'assets/icons/host/restriction/party.png',
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),


                          Divider(),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(PaymentWeb(
                                    url: "https://jayga.io/refund.html",
                                    appBar: "Policy",
                                  ));
                                },
                                child: Text(
                                  "Cancelation Policy",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    Get.to(PaymentWeb(
                                      url: "https://jayga.io/refund.html",
                                      appBar: "Policy",
                                    ));
                                  },
                                  child: controller
                                      .seeRestriction.value ==
                                      false
                                      ? Icon(
                                    Icons
                                        .arrow_drop_down_circle_outlined,
                                    color: AppColors.textColorGreen,
                                  )
                                      : Icon(
                                    Icons.arrow_circle_up,
                                    color: AppColors.textColorGreen,
                                  )),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Icon(
                                Icons.flag,
                                color: Colors.red,
                              ),
                              Text(
                                "Report this posting",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
                : PackageIncludes();
          }),
        ),
      ),
    );
  }
}
