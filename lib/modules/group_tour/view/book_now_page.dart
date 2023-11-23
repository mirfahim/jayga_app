import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/booking/view/all_alemnities.dart';
import 'package:jayga/modules/group_tour/controller/group_tour_controller.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';
import 'package:jayga/utils/ui_support.dart';

class BookGroupTour extends GetView<GroupTourController> {
  const BookGroupTour({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Obx(() {
          return  Container(
            color: AppColors.appBackGroundBrn,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*.15,
                        width: MediaQuery.of(context).size.width*.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: "https://new.jayga.io/uploads/listings/${data.images.first.listingFilename}",
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
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                            Text(
                              data.listingAddress,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height*.05,
                              child: RatingBar.builder(
                                initialRating: controller.getReviewModel.value.averageRating == null ? 5 :controller.getReviewModel.value.averageRating!.toDouble(),
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize:18,
                                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
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
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.bed,
                                  ),
                                  Text(data.bedNum.toString()),
                                  Icon(
                                    Icons.bathroom,
                                  ),
                                  Text(data.bathroomNum.toString()),
                                  Icon(
                                    Icons.bathtub,
                                  ),
                                  Text(data.privateBathroom.toString()),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),
                  child: Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "Booking Details",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
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
                        SizedBox(
                          height: 10,
                        ),

                        SizedBox(
                          height: 30,
                          child: ListTile(
                            title: Text(
                                "${data.fullDayPriceSetByUser} x ${controller.getDateDifferenceNum()} nights"),
                            trailing: Text(
                                "${int.parse(data.fullDayPriceSetByUser) * controller.getDateDifferenceNum()}"),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: ListTile(
                            title: Text("Long stay discount"),
                            trailing: Text("0"),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: ListTile(
                            title: Text("Cleaning fee"),
                            trailing: Text("0"),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: ListTile(
                            title: Text("Service fee"),
                            trailing: Text("0"),
                          ),
                        ),
                        Divider(),
                        SizedBox(
                          height: 30,
                          child: ListTile(
                            title: Text(
                              "Total Fee",
                              style:
                              TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: Text(
                              "${int.parse(data.fullDayPriceSetByUser) * controller.getDateDifferenceNum()}",
                              style:
                              TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            "Payment",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Add your desired payment Method",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              "Pay with Credit/ Debit Card",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.textColorGreen),
                            ),
                            Spacer(),
                            Container(
                              height: Get.height*.1,
                              width: Get.width*.15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      'assets/icons/visa.png',
                                    ),
                                  )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: Get.height*.1,
                              width: Get.width*.15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      'assets/icons/master.png',
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Pay with MFS",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.textColorGreen),
                            ),
                            Spacer(),
                            Container(
                              height: Get.height*.1,
                              width: Get.width*.15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      'assets/icons/bkash.png',
                                    ),
                                  )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: Get.height*.1,
                              width: Get.width*.15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      'assets/icons/nagad.png',
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: () {
                                  if (controller.term.value == true) {
                                    controller.term.value = false;
                                  } else {
                                    controller.term.value = true;
                                  }
                                },
                                child:  Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(20),
                                    border: Border.all(
                                        color:
                                        AppColors.textColorBlack,
                                        width: 1),
                                  ),
                                  child: controller.term.value == false
                                      ?Container() : Icon(Icons.verified, color: AppColors.textColorGreen,),)

                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              width:
                              MediaQuery.of(context).size.width * .7,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Accept Terms & Conditions",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black54),
                                  ),
                                  Text(
                                    "By selecting this button you will accpect our terms and conditions",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                        color: AppColors.textColorGreen),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            if (controller.term.value == true) {
                              if (controller.endDate.value.isEmpty &&
                                  controller.startDate.value.isEmpty) {
                                Get.showSnackbar(Ui.errorSnackBar(
                                    message:
                                    "Please give checkIn and CheckOut Date",
                                    title: 'Error'.tr));
                              } else {
                                //controller.makeBookingController(context, lister_id: data.listerId, listing_id: data.listingId);
                                controller.makeBookingController(context, listing_id: data.listingId ,  amount: int.parse(data.fullDayPriceSetByUser) * controller.getDateDifferenceNum() );
                                // controller.getPaymentUrl();
                              }
                            } else {
                              Get.showSnackbar(Ui.errorSnackBar(
                                  message:
                                  "Please agree on terms and conditions.",
                                  title: 'Error'.tr));
                            }

                            //  Get.toNamed(Routes.HOME);
                            //controller.visible.value++;
                            // controller.loginController();
                          },
                          child: Center(
                            child: AnimatedContainer(
                              duration: Duration(seconds: 2),
                              height: 40,
                              // height: controller.visibleForLogin.value == 1 ? 50 : 60,
                              width: controller.visible.value == 1
                                  ? MediaQuery.of(context).size.width * .5
                                  : MediaQuery.of(context).size.width *
                                  .7,
                              decoration: BoxDecoration(
                                  color: AppColors.textColorGreen,
                                  borderRadius:
                                  BorderRadius.circular(50)),
                              alignment: Alignment.center,
                              child: Text(
                                "Confirm Stay",
                                style: TextStyle(
                                  color: AppColors.backgroundColor,
                                  fontSize: 12,
                                ),
                              ),
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
              ],
            ),
          );

        }),
      ),
    );
  }
}
