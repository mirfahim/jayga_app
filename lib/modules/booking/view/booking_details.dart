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
import 'package:jayga/modules/booking/view/my_booking_history/review_list_view.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:video_player/video_player.dart';
import '../../../routes/app_pages.dart';
import '../../../services/location_service.dart';
import 'my_booking_history/payment_webview.dart';
import 'package:intl/intl.dart';

class MakeBookingDetailsView extends GetView<BookingController> {
  const MakeBookingDetailsView({Key? key}) : super(key: key);

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
                              options: CarouselOptions(height: 400.0),
                              items: data.images!.map<Widget>((i) {
                                print("all images are ${data.images.length}");
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5.0),
                                      decoration: BoxDecoration(
                                          color: Colors.transparent),
                                      child: CachedNetworkImage(
                                        //imageUrl: "http://new.jaygaheight: MediaQuery.of(context).size.height *.12/uploads/listings/66dGWkgYLX5JyZGg0uHTv9N8M1bGhcCtBNzsX3MD.jpg",
                                        imageUrl:
                                            "https://new.jayga.io/uploads/listings/${i.listingFilename}",
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                                              'assets/images/jayga_logo.png',
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            )),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .6,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${data.bedNum.toString()} Bed, ${data.bathroomNum.toString()} Bath",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${data.fullDayPriceSetByUser}tk",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color:
                                                    AppColors.textColorGreen),
                                          ),
                                          Text(
                                            "/Night",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 18,
                                                color: Colors.black54),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text(
                                  "${data.listingTitle}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textColorGreen),
                                )),
                                Center(
                                    child: Text(
                                        "${data.listingAddress}, ${data.town},${data.district}")),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * .05,
                                  child: Center(
                                    child: RatingBar.builder(
                                      initialRating: controller.getReviewModel
                                                  .value.averageRating ==
                                              null
                                          ? 5
                                          : controller.getReviewModel.value
                                              .averageRating!
                                              .toDouble(),
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 30,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 14,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ),
                                ),
                                Divider(),
                                SizedBox(
                                  height: 10,
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
                                        if (controller.seeVideo.value ==
                                            false) {
                                          controller.seeVideo.value = true;
                                          controller.playVideoController();
                                        } else {
                                          controller.videoController.dispose();
                                          controller.seeVideo.value = false;
                                        }

                                        //  Get.toNamed(Routes.HOME);
                                        //controller.visible.value++;
                                        // controller.loginController();
                                      },
                                      child: AnimatedContainer(
                                        duration: Duration(seconds: 2),
                                        height: 20,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: AppColors.textColorGreen,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        alignment: Alignment.center,
                                        child:  controller.seeVideo.value == true ?Text(
                                          "Hide Video",
                                          style: TextStyle(
                                            color: AppColors.backgroundColor,
                                            fontSize: 14,
                                          ),
                                        ): Text(
                                          "See Video",
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
                                controller.seeVideo.value == true
                                    ? Column(
                                        children: [
                                          Center(
                                            child: AspectRatio(
                                              aspectRatio: controller
                                                  .videoController
                                                  .value
                                                  .aspectRatio,
                                              child: VideoPlayer(
                                                  controller.videoController),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: () {

                                                if (controller.videoController.value.isPlaying) {
                                                  controller.videoController.pause();
                                                  print("video pause");
                                                } else {
                                                  controller.videoController.play();
                                                  print("video play");
                                                }
                                              },
                                              child: controller.videoController.value.isPlaying ? Icon(
                                                Icons.pause,
                                                size: 30,
                                              ):Icon(
                                                Icons.play_arrow_outlined,
                                                size: 30,
                                              ) )
                                        ],
                                      )
                                    : Container(),
                                SizedBox(
                                  height: 10,
                                ),
                                data.allowShortStay == "0"
                                    ? Center(
                                        child: Text(
                                          "Short Stay is not available for this place",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15,
                                              color: AppColors.redButton),
                                        ),
                                      )
                                    : Center(
                                        child: Text(
                                          "Short Stay is available for this place",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Max Guest:${data.guestNum}",
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
                                          "Bed Room:${data.bedNum}",
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
                                          "Bathroom:${data.bathroomNum}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ],
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
                                      "All Alemnities",
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
                                // Container(
                                //   height: 140,
                                //   child: Column(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       Row(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.spaceBetween,
                                //         children: [
                                //           Container(
                                //             child: Text(
                                //               "Cleanness",
                                //               style: TextStyle(
                                //                   fontSize: 15,
                                //                   fontWeight: FontWeight.bold,
                                //                   color: Colors.black),
                                //             ),
                                //           ),
                                //           Row(
                                //             children: [
                                //               AnimatedContainer(
                                //                 duration: Duration(seconds: 2),
                                //                 height: 20,
                                //                 width: 140,
                                //                 decoration: BoxDecoration(
                                //                     color: AppColors
                                //                         .textColorGreen,
                                //                     borderRadius:
                                //                         BorderRadius.circular(
                                //                             50)),
                                //                 alignment: Alignment.center,
                                //               ),
                                //               SizedBox(
                                //                 width: 5,
                                //               ),
                                //               Text(
                                //                 "5.0",
                                //                 style: TextStyle(
                                //                     fontSize: 15,
                                //                     fontWeight: FontWeight.bold,
                                //                     color: Colors.black),
                                //               )
                                //             ],
                                //           ),
                                //         ],
                                //       ),
                                //       Row(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.spaceBetween,
                                //         children: [
                                //           Container(
                                //             child: Text(
                                //               "Communication",
                                //               style: TextStyle(
                                //                   fontSize: 15,
                                //                   fontWeight: FontWeight.bold,
                                //                   color: Colors.black),
                                //             ),
                                //           ),
                                //           Row(
                                //             children: [
                                //               AnimatedContainer(
                                //                 duration: Duration(seconds: 2),
                                //                 height: 20,
                                //                 width: 140,
                                //                 decoration: BoxDecoration(
                                //                     color: AppColors
                                //                         .textColorGreen,
                                //                     borderRadius:
                                //                         BorderRadius.circular(
                                //                             50)),
                                //                 alignment: Alignment.center,
                                //               ),
                                //               SizedBox(
                                //                 width: 5,
                                //               ),
                                //               Text(
                                //                 "5.0",
                                //                 style: TextStyle(
                                //                     fontSize: 15,
                                //                     fontWeight: FontWeight.bold,
                                //                     color: Colors.black),
                                //               )
                                //             ],
                                //           ),
                                //         ],
                                //       ),
                                //       Row(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.spaceBetween,
                                //         children: [
                                //           Container(
                                //             child: Text(
                                //               "Check-in",
                                //               style: TextStyle(
                                //                   fontSize: 15,
                                //                   fontWeight: FontWeight.bold,
                                //                   color: Colors.black),
                                //             ),
                                //           ),
                                //           Row(
                                //             children: [
                                //               AnimatedContainer(
                                //                 duration: Duration(seconds: 2),
                                //                 height: 20,
                                //                 width: 140,
                                //                 decoration: BoxDecoration(
                                //                     color: AppColors
                                //                         .textColorGreen,
                                //                     borderRadius:
                                //                         BorderRadius.circular(
                                //                             50)),
                                //                 alignment: Alignment.center,
                                //               ),
                                //               SizedBox(
                                //                 width: 5,
                                //               ),
                                //               Text(
                                //                 "5.0",
                                //                 style: TextStyle(
                                //                     fontSize: 15,
                                //                     fontWeight: FontWeight.bold,
                                //                     color: Colors.black),
                                //               )
                                //             ],
                                //           ),
                                //         ],
                                //       ),
                                //       Row(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.spaceBetween,
                                //         children: [
                                //           Container(
                                //             child: Text(
                                //               "Accuracy",
                                //               style: TextStyle(
                                //                   fontSize: 15,
                                //                   fontWeight: FontWeight.bold,
                                //                   color: Colors.black),
                                //             ),
                                //           ),
                                //           Row(
                                //             children: [
                                //               AnimatedContainer(
                                //                 duration: Duration(seconds: 2),
                                //                 height: 20,
                                //                 width: 140,
                                //                 decoration: BoxDecoration(
                                //                     color: AppColors
                                //                         .textColorGreen,
                                //                     borderRadius:
                                //                         BorderRadius.circular(
                                //                             50)),
                                //                 alignment: Alignment.center,
                                //               ),
                                //               SizedBox(
                                //                 width: 5,
                                //               ),
                                //               Text(
                                //                 "5.0",
                                //                 style: TextStyle(
                                //                     fontSize: 15,
                                //                     fontWeight: FontWeight.bold,
                                //                     color: Colors.black),
                                //               )
                                //             ],
                                //           ),
                                //         ],
                                //       ),
                                //       Row(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.spaceBetween,
                                //         children: [
                                //           Container(
                                //             child: Text(
                                //               "Location",
                                //               style: TextStyle(
                                //                   fontSize: 15,
                                //                   fontWeight: FontWeight.bold,
                                //                   color: Colors.black),
                                //             ),
                                //           ),
                                //           Row(
                                //             children: [
                                //               AnimatedContainer(
                                //                 duration: Duration(seconds: 2),
                                //                 height: 20,
                                //                 width: 140,
                                //                 decoration: BoxDecoration(
                                //                     color: AppColors
                                //                         .textColorGreen,
                                //                     borderRadius:
                                //                         BorderRadius.circular(
                                //                             50)),
                                //                 alignment: Alignment.center,
                                //               ),
                                //               SizedBox(
                                //                 width: 5,
                                //               ),
                                //               Text(
                                //                 "5.0",
                                //                 style: TextStyle(
                                //                     fontSize: 15,
                                //                     fontWeight: FontWeight.bold,
                                //                     color: Colors.black),
                                //               )
                                //             ],
                                //           ),
                                //         ],
                                //       ),
                                //       Row(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.spaceBetween,
                                //         children: [
                                //           Container(
                                //             child: Text(
                                //               "Value",
                                //               style: TextStyle(
                                //                   fontSize: 15,
                                //                   fontWeight: FontWeight.bold,
                                //                   color: Colors.black),
                                //             ),
                                //           ),
                                //           Row(
                                //             children: [
                                //               AnimatedContainer(
                                //                 duration: Duration(seconds: 2),
                                //                 height: 20,
                                //                 width: 140,
                                //                 decoration: BoxDecoration(
                                //                     color: AppColors
                                //                         .textColorGreen,
                                //                     borderRadius:
                                //                         BorderRadius.circular(
                                //                             50)),
                                //                 alignment: Alignment.center,
                                //               ),
                                //               SizedBox(
                                //                 width: 5,
                                //               ),
                                //               Text(
                                //                 "5.0",
                                //                 style: TextStyle(
                                //                     fontSize: 15,
                                //                     fontWeight: FontWeight.bold,
                                //                     color: Colors.black),
                                //               )
                                //             ],
                                //           ),
                                //         ],
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                // SizedBox(
                                //   height: 10,
                                // ),
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
                                              var reviewdata =
                                                  controller.getReview[i];
                                              return ListTile(
                                                title: Row(
                                                  children: [
                                                    Text(
                                                      reviewdata.userName ??
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
                                                            reviewdata
                                                                .createdAt,
                                                          ),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                    Text(
                                                      reviewdata.description,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                leading: Obx(() {
                                                  return Container(
                                                    height: 70,
                                                    width: 70,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: CachedNetworkImage(
                                                      //imageUrl: "http://new.jaygaheight: MediaQuery.of(context).size.height *.12/uploads/listings/66dGWkgYLX5JyZGg0uHTv9N8M1bGhcCtBNzsX3MD.jpg",
                                                      imageUrl:
                                                          "https://new.jayga.io/uploads/useravatars/${controller.getUserImage(reviewdata.userId)}",
                                                      imageBuilder: (context,
                                                              imageProvider) =>
                                                          Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .transparent,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          image:
                                                              DecorationImage(
                                                            image:
                                                                imageProvider,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      placeholder:
                                                          (context, url) =>
                                                              const Padding(
                                                        padding:
                                                            EdgeInsets.all(5.0),
                                                        child: Image(
                                                          image: AssetImage(
                                                            'assets/images/jayga_logo.png',
                                                          ),
                                                        ),
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          const Padding(
                                                        padding:
                                                            EdgeInsets.all(5.0),
                                                        child: Image(
                                                          image: AssetImage(
                                                            'assets/images/jayga_logo.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    // color: AppColors.backgroundColor,
                                                  );
                                                }),
                                              );
                                            })),
                                Divider(
                                  thickness: 1,
                                ),
                                Obx(() {
                                  return ListTile(
                                    title: Text(
                                      data.listerName,
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    subtitle: Text("Hosted by"),
                                    trailing: Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: CachedNetworkImage(
                                        //imageUrl: "http://new.jaygaheight: MediaQuery.of(context).size.height *.12/uploads/listings/66dGWkgYLX5JyZGg0uHTv9N8M1bGhcCtBNzsX3MD.jpg",
                                        imageUrl:
                                            "https://new.jayga.io/uploads/useravatars/${controller.getListerImage(data.listerId)}",
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
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
                                              'assets/images/jayga_logo.png',
                                            ),
                                          ),
                                        ),
                                      ),
                                      // color: AppColors.backgroundColor,
                                    ),
                                  );
                                }),
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
                                    Get.toNamed(Routes.CONFIEMANDPAY,
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
                                Container(
                                    margin: EdgeInsets.all(8),
                                    child: Table(
                                      border: TableBorder.all(),
                                      columnWidths: const <int,
                                          TableColumnWidth>{
                                        0: IntrinsicColumnWidth(),
                                        1: FlexColumnWidth(),
                                        2: FlexColumnWidth(),
                                      },
                                      defaultVerticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      children: <TableRow>[
                                        TableRow(
                                          decoration: BoxDecoration(
                                            color: AppColors.textColorGreen,
                                          ),
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                "Company",
                                                style: TextStyle(
                                                    color: AppColors
                                                        .textColorGreen),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text("Price",
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .textColorBlack,
                                                      fontSize: 12)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text("Cancellation policy",
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .textColorBlack,
                                                      fontSize: 12)),
                                            ),
                                          ],
                                        ),
                                        TableRow(
                                          decoration: BoxDecoration(),
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                "1. Jayga LTD",
                                                style: TextStyle(
                                                    color: AppColors
                                                        .textColorGreen),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text("Price",
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .textColorBlack,
                                                      fontSize: 12)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Icon(
                                                Icons.check,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                        TableRow(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                "2. Obokash",
                                                style: TextStyle(
                                                    color: AppColors
                                                        .textColorGreen),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text("Price",
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .textColorBlack,
                                                      fontSize: 12)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Icon(
                                                Icons.check,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                        TableRow(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                "3. GoZayaan",
                                                style: TextStyle(
                                                    color: AppColors
                                                        .textColorGreen),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text("Price",
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .textColorBlack,
                                                      fontSize: 12)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Icon(
                                                Icons.check,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                        TableRow(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                "4. Air BNB",
                                                style: TextStyle(
                                                    color: AppColors
                                                        .textColorGreen),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text("Price",
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .textColorBlack,
                                                      fontSize: 12)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Icon(
                                                Icons.check,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
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
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                  insetPadding:
                                                      EdgeInsets.all(0),
                                                  elevation: 20,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  content: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child:
                                                          AvailablityCheckView()));
                                            });
                                      },
                                      child: Text(
                                        "Availability Check",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                    insetPadding:
                                                        EdgeInsets.all(0),
                                                    elevation: 20,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    content: Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        height: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child:
                                                            AvailablityCheckView()));
                                              });
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
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : AllAlemnitiesView();
          }),
        ),
      ),
    );
  }
}
