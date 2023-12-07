import 'dart:convert';
import 'package:countries_world_map/countries_world_map.dart';
import 'package:countries_world_map/data/maps/world_map.dart';
import 'package:bangladesh/bangladesh.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/view/my_booking_history/payment_webview.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/routes/app_pages.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';
import 'package:badges/badges.dart' as badges;
import '../../../../services/auth_services.dart';

class TravelProfileView extends GetView<HomeController> {
  const TravelProfileView({Key? key}) : super(key: key);
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
      backgroundColor: AppColors.appBackGroundBrn,
      body: SingleChildScrollView(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .5,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.elliptical(
                                MediaQuery.of(context).size.width * 0.5, 100.0),
                            bottomRight: Radius.elliptical(
                                MediaQuery.of(context).size.width * 0.5, 100.0),
                          ),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250'),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Icon(
                              Icons.close,
                              color: Color(0xffC3C3C3),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                'Cora Richardson',
                                style: TextStyle(
                                  color: Color(0xffBDBDBD),
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Color(0xffD8D8D8),
                            child: Icon(
                              Icons.chat,
                              size: 30,
                              color: Color(0xff6E6E6E),
                            ),
                          ),
                          CircleAvatar(
                            radius: 70,
                            backgroundImage: NetworkImage(
                                'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250'),
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Color(0xffD8D8D8),
                            child: Icon(
                              Icons.favorite_rounded,
                              size: 30,
                              color: Color(0xff6E6E6E),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Text(
                  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("His Travel Interests"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Trekking',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '|',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Mountain',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '|',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Camping',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '|',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Lake',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                color: Color(0xffF8F8F8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Column(
                        children: [
                          Text('Article'),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '20',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 1,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Column(
                        children: [
                          Text('Popularity'),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '200',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 1,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Column(
                        children: [
                          Text('Points'),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '80',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                color: Color(0xffF8F8F8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Column(
                        children: [
                          Text('Visited Country'),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '20',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 1,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Column(
                        children: [
                          Text('Visited Division'),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '200',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 1,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Column(
                        children: [
                          Text('Visited District'),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '80',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: Get.width ,
                child: SimpleMap(
                  // String of instructions to draw the map.
                  instructions: SMapWorld.instructions,

                  // Default color for all countries.
                  defaultColor: Colors.grey,

                  // Matching class to specify custom colors for each area.
                  colors: SMapWorldColors(

                    uS: controller.khulnaVisit.value == true ?Colors.green : Colors.grey, // This makes USA green
                    cN: controller.barishalVisit.value == true ?Colors.green : Colors.grey, // This makes China green
                    rU: controller.dhakaVisit.value == true ?Colors.green : Colors.grey, // This makes Russia green
                    bN: controller.rajshahiVisit.value == true ? Colors.red : Colors.grey,
                    bD: controller.rajshahiVisit.value == true ? Colors.red : Colors.grey,
                    iN: controller.rajshahiVisit.value == true ? Colors.red : Colors.grey,
                    nE: controller.rajshahiVisit.value == true ? Colors.red : Colors.grey,
                    bH: controller.rajshahiVisit.value == true ? Colors.red : Colors.grey,
                    pA: controller.rajshahiVisit.value == true ? Colors.red : Colors.grey,
                    aF: controller.rajshahiVisit.value == true ? Colors.red : Colors.grey,
                    mY: controller.rajshahiVisit.value == true ? Colors.red : Colors.grey,
                    sR: controller.rajshahiVisit.value == true ? Colors.red : Colors.grey,
                    aR: controller.rajshahiVisit.value == true ? Colors.red : Colors.grey,
                    tZ: controller.rajshahiVisit.value == true ? Colors.red : Colors.grey,


                  ).toMap(),

                  // Details of what area is being touched, giving you the ID, name and tapdetails
                  callback: (id, name, tapdetails) {
                    print(id);
                  },
                ),
              ),
              Center(
                child: BangladeshMap(
                  width: Get.width * .7,
                  height: Get.height * .5,
                  rangpurColor:
                  controller.rangpurVisit.value == false
                      ? Colors.grey
                      : Colors.orange,
                  rajshahiColor:
                  controller.rajshahiVisit.value == false
                      ? Colors.grey
                      : Colors.red,
                  dhakaColor: controller.dhakaVisit.value == false
                      ? Colors.grey
                      : Colors.indigo,
                  sylhetColor: controller.shyletVisit.value == false
                      ? Colors.grey
                      : Colors.blue,
                  khulnaColor: controller.khulnaVisit.value == false
                      ? Colors.grey
                      : Colors.teal,
                  chittagongColor:
                  controller.chittagongVisit.value == false
                      ? Colors.grey
                      : Colors.lightGreen,
                  barisalColor:
                  controller.barishalVisit.value == false
                      ? Colors.grey
                      : Colors.pink,
                  mymensinghColor:
                  controller.mymanVisit.value == false
                      ? Colors.grey
                      : Colors.brown,
                  showBorder: true,
                  showName: true,
                  showDivisionBorder: true,
                  showDistrictBorder: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showPopup(context, String type) {
    return showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.zero,
            //title: Text('Select '),
            content: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Get.theme.scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Wrap(
                children: <Widget>[
                  // ListTile(
                  //     leading: const Icon(Icons.photo_library),
                  //     title: Text('Photo Library'.tr),
                  //     onTap: () {
                  //       controller.getImage(ImageSource.gallery, type);
                  //       Get.back();
                  //     }),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: Text('Camera'.tr),
                    onTap: () {
                      controller.getImage(ImageSource.camera, type, "2");
                      Get.back();
                    },
                  ),
                ],
              ),
            )
            // actions: <Widget>[

            // ],
            );
      },
    );
  }
}
