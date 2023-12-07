import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/booking/view/all_alemnities.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';
import 'package:jayga/utils/ui_support.dart';

class ConfirmAndPayView extends GetView<BookingController> {
  const ConfirmAndPayView({Key? key}) : super(key: key);

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
          return controller.seeAmenities.value == false
              ? Container(
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
                                  Text(
                                    "${data.bedNum} Bed, ${data.bathroomNum} Bath",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black),
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
                              Text(
                                "Host Restriction",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Divider(),
                              Column(
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
                                            'assets/icons/host/restriction/no_entry.png',
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
                                            'assets/icons/host/restriction/no_smoke.png',
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
                                            'assets/icons/host/restriction/party.png',
                                            height: 30,
                                            width: 30,
                                          ),
                                        ),
                                      ),
                                    ),


                                  ]

                              ),
                              Divider(),
                              // Row(
                              //   children: [
                              //     Icon(
                              //       Icons.flag,
                              //       color: Colors.red,
                              //     ),
                              //     Text(
                              //       "Report this posting",
                              //       style: TextStyle(
                              //         color: Colors.black,
                              //         fontSize: 18,
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              SizedBox(
                                height: 20,
                              ),

                              Text(
                                "Cancelation Policy",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                              Text(
                                "We want you to be completely satisfied with your purchase. If you have any issues or are not satisfied with our products, please contact our customer support team within 30 days of your purchase to request a refund.To be eligible for a refund, your item must be unused and in the same condition that you received it. ",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                            ],
                          ),
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    data.fullDayPriceSetByUser,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "BDT/NIGHT",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .25,
                                  width: MediaQuery.of(context).size.width * .8,
                                  decoration: BoxDecoration(
                                    color: AppColors.textColorWhite,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.black54, width: 2),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    //crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .08,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .39,
                                            child: Column(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    controller
                                                        .selectCheckInDate(
                                                            context);
                                                  },
                                                  child: Text(
                                                    "CHECK-IN",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 15,
                                                        color: Colors.blue),
                                                  ),
                                                ),
                                                controller
                                                        .startDate.value.isEmpty
                                                    ? Text(
                                                        "Select Date",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black54),
                                                      )
                                                    : Text(
                                                        controller
                                                            .startDate.value,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black),
                                                      ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            color: Colors.black54,
                                            height: 50,
                                            width: 2,
                                          ),
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .08,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .39,
                                            child: Column(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    if(controller.selectedCheckinDate.toString().isNotEmpty){
                                                      controller
                                                          .selectCheckoutDate(
                                                          context);
                                                    } else{
                                                      Get.showSnackbar(Ui.errorSnackBar(
                                                          message:"Select Checkin date first", title: 'Error'.tr));
                                                    }

                                                  },
                                                  child: Text(
                                                    "CHECK-OUT",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 15,
                                                        color: Colors.blue),
                                                  ),
                                                ),
                                                controller.endDate.value.isEmpty
                                                    ? Text(
                                                        "Select Checkout",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black45),
                                                      )
                                                    : Text(
                                                        controller
                                                            .endDate.value,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black),
                                                      ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        thickness: 2,
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .08,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .8,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                if (controller.guestNum.value > 0) {
                                                                  controller.guestNum.value--;



                                                                } else {

                                                                }
                                                              },
                                                              child: CircleAvatar(
                                                                radius: 15,
                                                                backgroundColor: AppColors.textColorGreen,
                                                                child: CircleAvatar(
                                                                  radius: 13,
                                                                  backgroundColor: AppColors.textColorWhite,
                                                                  child: Icon(Icons.remove),
                                                                ),
                                                              ),
                                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "GUESTS",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.normal,
                                                      fontSize: 15,
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                  "${controller.guestNum.value} guest",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            InkWell(
                                              onTap: () {
                                 if(int.parse(data.guestNum) > controller.guestNum.value){
                                   controller.guestNum.value++;
                                 } else {
                                   Get.showSnackbar(Ui.errorSnackBar(
                                       message: "You can not cross max guest number set by lister", title: 'Error'.tr));
                                 }




                                              },
                                              child: CircleAvatar(
                                                radius: 15,
                                                backgroundColor: AppColors.textColorGreen,
                                                child: CircleAvatar(
                                                  radius: 13,
                                                  backgroundColor: AppColors.textColorWhite,
                                                  child: Icon(Icons.add),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
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
                                      controller.makeBookingController(context, listing_id: data.listingId , lister_id: data.listerId, amount: int.parse(data.fullDayPriceSetByUser) * controller.getDateDifferenceNum() );
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
                )
              : AllAlemnitiesView();
        }),
      ),
    );
  }
}
