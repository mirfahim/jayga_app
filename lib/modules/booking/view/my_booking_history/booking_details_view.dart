import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/view/my_booking_history/give_review.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';
import 'package:intl/intl.dart';
import '../../controller/booking_controller.dart';

class MyBookingHistoryDetailsView extends GetView<BookingController> {
  const MyBookingHistoryDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var index = Get.arguments[0];
    var data = controller.historyList[index];
    return  Scaffold(

      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(70.0), // here the desired height
        child:  Column(
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
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.appBackGroundBrn,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: MediaQuery.of(context).size.height*.25,
                    width: MediaQuery.of(context).size.width *.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Colors.transparent, width: 2),
                      color: AppColors.appBackGroundBrn,
                    ),
                    child: CarouselSlider(
                      options: CarouselOptions(height: 400.0,),
                      items: data.listings!.images!.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  color: Colors.transparent
                              ),
                              child:   CachedNetworkImage(
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
                SizedBox(width: 20,),
                Container(
                  width: MediaQuery.of(context).size.width * .7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Booking Details:",
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.black54),),
                      Text("${data.listings!.bedNum.toString()} Bed, ${data.listings!.bathroomNum.toString()} Bath",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),),
                      Text("Uttara, Dhaka",
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color:AppColors.textColorGreen),),

                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width ,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Check In Time:",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),),
                      Text(DateFormat.yMd().add_jm().format(data.listings!.createdAt),
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.black54),),
                      Text("Check Out Time:",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),),
                      Text(DateFormat.yMd().add_jm().format(data.listings!.createdAt),
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.black54),),
                      // SizedBox(height: 10,),
                      // Text("Want to change the date?",
                      //   style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: AppColors.textColorGreen),),

                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Text("Location",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black54),),

                Text("View on map:",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: AppColors.textColorGreen),),
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
                                double.parse(data.listings!.lat),
                                double.parse(data.listings!.long)),
                            zoom: 20,
                            //target: LatLng(23.797911, 90.414391),
                          ),
                          markers: {
                            Marker(
                              markerId:
                              MarkerId('selected-location'),
                              position: LatLng(
                                  double.parse(data.listings!.lat),
                                  double.parse(data.listings!.long)),
                              infoWindow: InfoWindow(
                                title: 'Selected Location',
                              ),
                            ),
                          }),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Divider(),
                ListTile(
                  title: Text(data.listings!.listerName, style: TextStyle(fontSize: 22),),
                  subtitle: Text("Hosted by"),
                  trailing: Container(
                    height: 100,
                   width: 100,
                   decoration: BoxDecoration(
                        shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/kaif.png"))),
                    // color: AppColors.backgroundColor,

                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange,),
                    Text("15 host reviews", style: TextStyle(fontSize: 15),),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(GiveReviewScreen(), arguments: [index]);
                        //  Get.toNamed(Routes.HOME);
                        //controller.visible.value++;
                        // controller.loginController();
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 2),
                        height: controller.visible.value == 1 ? 50 : 40,
                        width: controller.visible.value == 1 ? 50 : 140,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange),

                            borderRadius: BorderRadius.circular(
                                controller.visible.value == 1 ? 60 : 50)),

                        alignment: Alignment.center,
                        child: controller.visible.value == 1
                            ? Center(child: CircularProgressIndicator())
                            : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                          "Add Review",
                          style: TextStyle(
                                color: AppColors.textColorBlack,
                                fontSize: 12,
                          ),
                        ),
                                Icon(Icons.add, color: Colors.orange,)
                              ],
                            ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.verified_user, color: Colors.green,),
                    Text("Identity Verified", style: TextStyle(fontSize: 15),),
                  ],
                ),

                SizedBox(height: 10,),
                InkWell(
                  onTap: () {
                    Get.to(GiveReviewScreen(), arguments: [index]);
                    //  Get.toNamed(Routes.HOME);
                    //controller.visible.value++;
                    // controller.loginController();
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 2),
                    height: controller.visible.value == 1 ? 50 : 40,
                    width: controller.visible.value == 1 ? 50 : 140,
                    decoration: BoxDecoration(
                        color: AppColors.textColorGreen,
                        borderRadius: BorderRadius.circular(
                            controller.visible.value == 1 ? 60 : 50)),
                    alignment: Alignment.center,
                    child: controller.visible.value == 1
                        ? Center(child: CircularProgressIndicator())
                        : Text(
                      "Contact Host",
                      style: TextStyle(
                        color: AppColors.backgroundColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Divider(),
                Text(
                  "Host Restriction",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Divider(),
                Text(
                  "Cancelation Policy",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );


  }
}
