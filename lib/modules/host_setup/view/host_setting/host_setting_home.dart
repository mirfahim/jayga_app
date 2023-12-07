import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/host_setup/controller/host_controller.dart';
import 'package:jayga/routes/app_pages.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';
import 'package:badges/badges.dart' as badges;
import 'package:intl/intl.dart';

class HostProfileSetting extends GetView<HostController> {
  const HostProfileSetting({Key? key}) : super(key: key);

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
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.PROFILELISTING);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * .1,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * .09,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: ListTile(
                            title: Text(
                              "Your house listing",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            leading: Container(
                              height: MediaQuery.of(context).size.height * .05,
                              width: MediaQuery.of(context).size.width * .1,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_outlined),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Start a new listing",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.CREATEJAYGAFORM);
                    },
                    child: ListTile(
                      title: Text(
                        "Create listing",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      leading: Container(
                        height: MediaQuery.of(context).size.height * .05,
                        width: MediaQuery.of(context).size.width * .1,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "You have ${controller.historyList.value.where((element) => element.bookingStatus == "0").length} booking request",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  controller.historyList.value
                          .where((element) => element.bookingStatus == "0")
                          .toList()
                          .isEmpty
                      ? Container()
                      : SizedBox(
                          height: 20,
                        ),
                  Container(
                    height: MediaQuery.of(context).size.height * .4,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.historyList.value
                            .where((element) => element.bookingStatus == "0")
                            .length,
                        itemBuilder: (BuildContext context, index) {
                          var data = controller.historyList.value
                              .where((element) => element.bookingStatus == "0")
                              .toList()[index];
                          return Card(
                            child: Container(
                              height: MediaQuery.of(context).size.height * .3,
                              width: MediaQuery.of(context).size.width * .7,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Booking Request",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    RichText(
                                        text: TextSpan(
                                            text: "Booking Placed at ",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 12),
                                            children: [
                                          TextSpan(
                                              text:
                                                  '${DateFormat.yMd().add_jm().format(data.updatedAt!)}',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 15)),
                                        ])),
                                    Container(
                                        margin: EdgeInsets.all(8),
                                        child: Table(
                                          border: TableBorder.all(),
                                          columnWidths: const <int,
                                              TableColumnWidth>{
                                            0: IntrinsicColumnWidth(),
                                            1: FlexColumnWidth(),
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
                                                    "Info Title",
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .jaygaWhite),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text("Information",
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .jaygaWhite,
                                                          fontSize: 12)),
                                                ),
                                              ],
                                            ),
                                            TableRow(
                                              decoration: BoxDecoration(
                                                color: AppColors.jaygaWhite,
                                              ),
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text(
                                                    "Listing Title",
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .textColorBlack,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text(
                                                      data.listings!
                                                          .listingTitle!,
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .textColorBlack,
                                                          fontSize: 12)),
                                                ),
                                              ],
                                            ),
                                            TableRow(
                                              decoration: BoxDecoration(
                                                color: AppColors.jaygaWhite,
                                              ),
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text(
                                                    "Customer Name",
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .textColorBlack,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text(
                                                      data.bookingOrderName!,
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .textColorBlack,
                                                          fontSize: 12)),
                                                ),
                                              ],
                                            ),
                                            TableRow(
                                              decoration: BoxDecoration(
                                                color: AppColors.jaygaWhite,
                                              ),
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text(
                                                    "Customer mobile",
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .textColorBlack,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text("00000000000",
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .textColorBlack,
                                                          fontSize: 12)),
                                                ),
                                              ],
                                            ),
                                            TableRow(
                                              decoration: BoxDecoration(
                                                color: AppColors.jaygaWhite,
                                              ),
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text(
                                                    "Check in",
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .textColorBlack,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text(
                                                      DateFormat.yMd().format(
                                                          DateTime.parse(
                                                              data.dateEnter!)),
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .textColorBlack,
                                                          fontSize: 12)),
                                                ),
                                              ],
                                            ),
                                            TableRow(
                                              decoration: BoxDecoration(
                                                color: AppColors.jaygaWhite,
                                              ),
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text(
                                                    "Check out",
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .textColorBlack,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text(
                                                      DateFormat.yMd().format(
                                                          DateTime.parse(
                                                              data.dateExit!)),
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .textColorBlack,
                                                          fontSize: 12)),
                                                ),
                                              ],
                                            ),
                                            TableRow(
                                              decoration: BoxDecoration(
                                                color: AppColors.jaygaWhite,
                                              ),
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text(
                                                    "Total Stay",
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .textColorBlack,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Text(
                                                        data.daysStayed!,
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .textColorBlack,
                                                            fontSize: 12))),
                                              ],
                                            ),
                                          ],
                                        )),
                                    Container(
                                      width: Get.width * .5,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'Are you sure you want to decline?'),
                                                      actions: [
                                                        ElevatedButton(
                                                          onPressed: () =>
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(false),
                                                          //return false when click on "NO"
                                                          child: Text('No'),
                                                        ),
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            controller.changeBookingStatus(
                                                                booking_id: data
                                                                    .bookingId,
                                                                booking_status:
                                                                    2);
                                                          },
                                                          //return true when click on "Yes"
                                                          child: Text('Yes'),
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            },
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .04,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .2,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                color: AppColors.redButton,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                  child: Text("Decline")),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller.changeBookingStatus(
                                                  booking_id: data.bookingId,
                                                  booking_status: 1);
                                            },
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .04,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .2,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                color: AppColors.greenButton,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child:
                                                  Center(child: Text("Accept")),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "Guests will be arriving for late check-in for a stay of ${data.daysStayed} days",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.green),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Your reservations",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  controller.historyList.value
                          .where((element) => element.bookingStatus == "1")
                          .toList()
                          .isEmpty
                      ? Text("No reservation yet")
                      : Container(
                          height: MediaQuery.of(context).size.height * .7,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .7,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Overview",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height * .5,
                                    child: ListView.builder(
                                        itemCount: controller.historyList.value
                                            .where((element) =>
                                                element.bookingStatus == "1")
                                            .length,
                                        itemBuilder:
                                            (BuildContext context, index) {
                                          var data = controller
                                              .historyList.value
                                              .where((element) =>
                                                  element.bookingStatus == "1")
                                              .toList()[index];
                                          return Card(
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .3,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .09,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Text(
                                                        "Reservation",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14),
                                                      ),
                                                      Container(
                                                          margin:
                                                              EdgeInsets.all(8),
                                                          child: Table(
                                                            border: TableBorder
                                                                .all(),
                                                            columnWidths: const <
                                                                int,
                                                                TableColumnWidth>{
                                                              0: IntrinsicColumnWidth(),
                                                              1: FlexColumnWidth(),
                                                            },
                                                            defaultVerticalAlignment:
                                                                TableCellVerticalAlignment
                                                                    .middle,
                                                            children: <
                                                                TableRow>[
                                                              TableRow(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: AppColors
                                                                      .textColorGreen,
                                                                ),
                                                                children: <
                                                                    Widget>[
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            4.0),
                                                                    child: Text(
                                                                      "Info Title",
                                                                      style: TextStyle(
                                                                          color:
                                                                              AppColors.jaygaWhite),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            4.0),
                                                                    child: Text(
                                                                        "Information",
                                                                        style: TextStyle(
                                                                            color:
                                                                                AppColors.jaygaWhite,
                                                                            fontSize: 12)),
                                                                  ),
                                                                ],
                                                              ),
                                                              TableRow(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: AppColors
                                                                      .jaygaWhite,
                                                                ),
                                                                children: <
                                                                    Widget>[
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            4.0),
                                                                    child: Text(
                                                                      "Listing Title",
                                                                      style: TextStyle(
                                                                          color:
                                                                              AppColors.textColorBlack),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            4.0),
                                                                    child: Text(
                                                                        data.listings!
                                                                            .listingTitle!,
                                                                        style: TextStyle(
                                                                            color:
                                                                                AppColors.textColorBlack,
                                                                            fontSize: 12)),
                                                                  ),
                                                                ],
                                                              ),
                                                              TableRow(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: AppColors
                                                                      .jaygaWhite,
                                                                ),
                                                                children: <
                                                                    Widget>[
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            4.0),
                                                                    child: Text(
                                                                      "Customer Name",
                                                                      style: TextStyle(
                                                                          color:
                                                                              AppColors.textColorBlack),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            4.0),
                                                                    child: Text(
                                                                        data
                                                                            .bookingOrderName!,
                                                                        style: TextStyle(
                                                                            color:
                                                                                AppColors.textColorBlack,
                                                                            fontSize: 12)),
                                                                  ),
                                                                ],
                                                              ),
                                                              TableRow(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: AppColors
                                                                      .jaygaWhite,
                                                                ),
                                                                children: <
                                                                    Widget>[
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            4.0),
                                                                    child: Text(
                                                                      "Customer mobile",
                                                                      style: TextStyle(
                                                                          color:
                                                                              AppColors.textColorBlack),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            4.0),
                                                                    child: Text(
                                                                        "00000000000",
                                                                        style: TextStyle(
                                                                            color:
                                                                                AppColors.textColorBlack,
                                                                            fontSize: 12)),
                                                                  ),
                                                                ],
                                                              ),
                                                              TableRow(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: AppColors
                                                                      .jaygaWhite,
                                                                ),
                                                                children: <
                                                                    Widget>[
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            4.0),
                                                                    child: Text(
                                                                      "Check in",
                                                                      style: TextStyle(
                                                                          color:
                                                                              AppColors.textColorBlack),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            4.0),
                                                                    child: Text(
                                                                        DateFormat.yMd().format(DateTime.parse(data
                                                                            .dateEnter!)),
                                                                        style: TextStyle(
                                                                            color:
                                                                                AppColors.textColorBlack,
                                                                            fontSize: 12)),
                                                                  ),
                                                                ],
                                                              ),
                                                              TableRow(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: AppColors
                                                                      .jaygaWhite,
                                                                ),
                                                                children: <
                                                                    Widget>[
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            4.0),
                                                                    child: Text(
                                                                      "Check out",
                                                                      style: TextStyle(
                                                                          color:
                                                                              AppColors.textColorBlack),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            4.0),
                                                                    child: Text(
                                                                        DateFormat.yMd().format(DateTime.parse(data
                                                                            .dateExit!)),
                                                                        style: TextStyle(
                                                                            color:
                                                                                AppColors.textColorBlack,
                                                                            fontSize: 12)),
                                                                  ),
                                                                ],
                                                              ),
                                                              TableRow(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: AppColors
                                                                      .jaygaWhite,
                                                                ),
                                                                children: <
                                                                    Widget>[
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            4.0),
                                                                    child: Text(
                                                                      "Total Stay",
                                                                      style: TextStyle(
                                                                          color:
                                                                              AppColors.textColorBlack),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              4.0),
                                                                      child: Text(
                                                                          data
                                                                              .daysStayed!,
                                                                          style: TextStyle(
                                                                              color: AppColors.textColorBlack,
                                                                              fontSize: 12))),
                                                                ],
                                                              ),
                                                            ],
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
