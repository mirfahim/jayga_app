import 'package:carousel_slider/carousel_slider.dart';
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
import '../../../routes/app_pages.dart';
import 'my_booking_history/payment_webview.dart';

class MakeBookingDetailsView extends GetView<BookingController> {
  const MakeBookingDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var index = Get.arguments[0];
    var data = controller.listingData.value[index];
    print("my booking details data ++++++++++++++ $index");

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
        onWillPop: ()async{


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
                            height: MediaQuery.of(context).size.height*.25,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.transparent, width: 2),
                              color: AppColors.appBackGroundBrn,
                            ),
                            child: CarouselSlider(
                              options: CarouselOptions(height: 400.0),
                              items: data.images.map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                                      decoration: BoxDecoration(
                                          color: Colors.transparent
                                      ),
                                      child:   CachedNetworkImage(
                                        imageUrl: "https://jayga.xyz/${i.listingTargetlocation}",
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
                                Row(
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width * .6,
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
                                      width:
                                          MediaQuery.of(context).size.width * .3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${data.fullDayPriceSetByUser}tk",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: AppColors.textColorGreen),
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
                                Center(child: Text(data.listingAddress)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text("800 sqft"),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.bed,
                                          ),
                                          Text("1"),
                                          Icon(
                                            Icons.bed,
                                          ),
                                          Text("1"),
                                          Icon(
                                            Icons.bed,
                                          ),
                                          Text("1"),
                                        ],
                                      ),
                                    )
                                  ],
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
                                      mainAxisAlignment: MainAxisAlignment.center,
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
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Max Guest:4",
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
                                          "Bed Room:4",
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
                                          "Bathroom:4",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          Icon(
                                            Icons.supervised_user_circle_sharp,
                                            color: AppColors.textColorGreen,
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
                                          Icon(
                                            Icons.supervised_user_circle_sharp,
                                            color: AppColors.textColorGreen,
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
                                          Icon(
                                            Icons.supervised_user_circle_sharp,
                                            color: AppColors.textColorGreen,
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
                                          Icon(
                                            Icons.supervised_user_circle_sharp,
                                            color: AppColors.textColorGreen,
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
                                          Icon(
                                            Icons.supervised_user_circle_sharp,
                                            color: AppColors.textColorGreen,
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
                                      "4.8",
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
                                            arguments: [index]);
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
                                Container(
                                  height: 140,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Text(
                                              "Cleanness",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              AnimatedContainer(
                                                duration: Duration(seconds: 2),
                                                height: 20,
                                                width: 140,
                                                decoration: BoxDecoration(
                                                    color:
                                                        AppColors.textColorGreen,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                alignment: Alignment.center,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "5.0",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Text(
                                              "Communication",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              AnimatedContainer(
                                                duration: Duration(seconds: 2),
                                                height: 20,
                                                width: 140,
                                                decoration: BoxDecoration(
                                                    color:
                                                        AppColors.textColorGreen,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                alignment: Alignment.center,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "5.0",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Text(
                                              "Check-in",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              AnimatedContainer(
                                                duration: Duration(seconds: 2),
                                                height: 20,
                                                width: 140,
                                                decoration: BoxDecoration(
                                                    color:
                                                        AppColors.textColorGreen,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                alignment: Alignment.center,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "5.0",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Text(
                                              "Accuracy",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              AnimatedContainer(
                                                duration: Duration(seconds: 2),
                                                height: 20,
                                                width: 140,
                                                decoration: BoxDecoration(
                                                    color:
                                                        AppColors.textColorGreen,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                alignment: Alignment.center,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "5.0",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Text(
                                              "Location",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              AnimatedContainer(
                                                duration: Duration(seconds: 2),
                                                height: 20,
                                                width: 140,
                                                decoration: BoxDecoration(
                                                    color:
                                                        AppColors.textColorGreen,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                alignment: Alignment.center,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "5.0",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Text(
                                              "Value",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              AnimatedContainer(
                                                duration: Duration(seconds: 2),
                                                height: 20,
                                                width: 140,
                                                decoration: BoxDecoration(
                                                    color:
                                                        AppColors.textColorGreen,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                alignment: Alignment.center,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "5.0",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
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
                                    height:
                                        MediaQuery.of(context).size.height * .15,
                                    child: ListView.builder(
                                        itemCount:
                                            controller.getReview.value.length,
                                        itemBuilder: (BuildContext c, i) {
                                          var data = controller.getReview[i];
                                          return ListTile(
                                            title: Row(
                                              children: [
                                                Text(
                                                  data.listerName,
                                                  style: TextStyle(fontSize: 22),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.orange,
                                                  size: 15,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  size: 15,
                                                  color: Colors.orange,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  size: 15,
                                                  color: Colors.orange,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  size: 15,
                                                  color: Colors.orange,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  size: 15,
                                                  color: Colors.orange,
                                                ),
                                              ],
                                            ),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "April 2023",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.black54),
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
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/kaif.png"))),
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
                                      width:
                                          MediaQuery.of(context).size.width - 100,
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
                                        arguments: [index]);
                                    //controller.visible.value++;
                                    // controller.loginController();
                                  },
                                  child: Center(
                                    child: AnimatedContainer(
                                      duration: Duration(seconds: 2),
                                      height: 40,
                                      width:
                                          MediaQuery.of(context).size.width - 100,
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
                                Container(
                                  height: 100,
                                  child: GoogleMap(
                                    onMapCreated: (c) {
                                      c = controller.mapController!;
                                    },
                                    initialCameraPosition: CameraPosition(
                                      target: LatLng(37.7749,
                                          -122.4194), // San Francisco coordinates
                                      zoom: 12.0,
                                    ),
                                  ),
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Text(
                                      "Host Restriction",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        if(controller.seeRestriction.value == false){
                                          controller.seeRestriction.value = true;
                                        }else{
                                          controller.seeRestriction.value = false;
                                        }

                                      },
                                        child: controller.seeRestriction.value == false
                                            ? Icon(Icons.arrow_drop_down_circle_outlined, color: AppColors.textColorGreen,)
                                            : Icon(Icons.arrow_circle_up, color: AppColors.textColorGreen,)
                                    ),

                                  ],
                                ),
                                controller.seeRestriction.value == false ? Container():    Container(
                                  height: MediaQuery.of(context).size.height*.22,
                                  child: Column(
                                      children: [
                                        ListTile(
                                          title: Text("Late night entry"),
                                          leading:  Container(
                                            height: 30,
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              alignment: Alignment.bottomLeft,
                                              // color: AppColors.backgroundColor,
                                              child: Image.asset(
                                                'assets/icons/host/no_entry.png',
                                                height: 30,
                                                width: 30,
                                              ),
                                            ),
                                          ),
                                        ),
                                        ListTile(
                                          title: Text("No pets are allowed"),
                                          leading:  Container(
                                            height: 30,
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              alignment: Alignment.bottomLeft,
                                              // color: AppColors.backgroundColor,
                                              child: Image.asset(
                                                'assets/icons/host/no_smoke.png',
                                                height: 30,
                                                width: 30,
                                              ),
                                            ),
                                          ),
                                        ),
                                        ListTile(
                                          title: Text("No parties are allowed"),
                                          leading:  Container(
                                            height: 30,
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              alignment: Alignment.bottomLeft,
                                              // color: AppColors.backgroundColor,
                                              child: Image.asset(
                                                'assets/icons/host/party.png',
                                                height: 30,
                                                width: 30,
                                              ),
                                            ),
                                          ),
                                        ),


                                      ]

                                  ),
                                ),
                                Divider(),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                              insetPadding: EdgeInsets.all(0),
                                              elevation: 20,
                                              backgroundColor: Colors.transparent,
                                              content: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: AvailablityCheckView()));
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
                                Divider(),
                                InkWell(
                                  onTap: (){
                                    Get.to(PaymentWeb(url: "https://jayga.io/refund.html" , appBar: "Policy",));
                                  },
                                  child: Text(
                                    "Cancelation Policy",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
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
                : AllAlemnitiesView();
          }),
        ),
      ),
    );
  }
}
