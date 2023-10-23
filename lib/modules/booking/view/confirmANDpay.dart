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
    var index = Get.arguments[0];
    var data = controller.listingData.value[index];
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
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      'assets/images/room1.png',
                                    ),
                                  )),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .6,
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                      // Text(data.),
                                    ],
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
                              Text(
                                "Cancelation Policy",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                              Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text",
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
                                      MediaQuery.of(context).size.height * .15,
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
                                                .05,
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
                                                .05,
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
                                                .05,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .8,
                                        child: Column(
                                          children: [
                                            Text(
                                              "GUESTS",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "1 guest",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Colors.black),
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
                                        fontSize: 18,
                                        color: AppColors.textColorGreen),
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 60,
                                    width: 80,
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
                                    height: 60,
                                    width: 80,
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
                                        fontSize: 18,
                                        color: AppColors.textColorGreen),
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 60,
                                    width: 80,
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
                                    height: 60,
                                    width: 80,
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
                                    child: controller.term.value == false
                                        ? Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color:
                                                      AppColors.textColorBlack,
                                                  width: 1),
                                            ))
                                        : Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                    'assets/icons/tick.png',
                                                  ),
                                                )),
                                          ),
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
                                      controller.getPaymentUrl();
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
