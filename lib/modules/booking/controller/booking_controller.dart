import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jayga/models/get_review_model.dart';
import 'package:jayga/models/listing_model.dart';
import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';
import 'package:jayga/modules/A_Base/view/profile/profile_screen.dart';
import 'package:jayga/modules/A_Base/view/saved_screen/saved_screen.dart';

import 'package:intl/intl.dart';
import '../../../models/booking_history_model.dart';
import '../../../repositories/listing_rep.dart';
import '../../../routes/app_pages.dart';
import '../../home/view/home_page_view.dart';


class BookingController extends GetxController {
  //TODO: Implement BaseController
  final seeListView = false.obs;
  final landingPage = 1.obs;
  final currentIndex = 0.obs;
  final visible = 0.obs;
  final visibleReview = 0.obs;
  final listingId = "".obs;
  final categoryDataLoaded = false.obs;
  final listingData = <Listing>[].obs;
  final detailsData = <Listing>[].obs;
  final getReview = <GetReviewModel>[].obs;
  final historyList = <BookingHistory>[].obs;
  final seeAmenities = false.obs;
 // final listingData = <Listing>[].obs;
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  DateTime selectedCheckinDate = DateTime.now();
  DateTime selectedCheckoutDate = DateTime.now();
  var startDate = ''.obs;
  var endDate = ''.obs;

  var myFormat = DateFormat('yyyy-MM-dd');

  @override
  void onInit() {
    listingController();
    bookingHistoryController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  listingController() async{
    visible.value++;
    ListingRep().listingRep().then((e) async{

      print("my registerr data $e");
      if(e != null){

        visible.value = 0;
        listingData.value = e.listings;
        print("total listing +++++++++++++++${listingData.value.length}");



        // Get.offAllNamed(Routes.BASE);



      } else {
        print("error ++++++++++++++");
        visible.value = 0;

      }

    });
  }
  getReviewController(listingId) async{
    visible.value++;
    ListingRep().getReviewRep(listingId).then((e) async{

      print("my registerr data $e");
      if(e != null){

        visible.value = 0;
        getReview.value = e;
        print("total review +++++++++++++++${getReview.value.length}");



        // Get.offAllNamed(Routes.BASE);



      } else {
        print("error ++++++++++++++");
        visible.value = 0;

      }

    });
  }
  bookingHistoryController() async{
    visible.value++;
    ListingRep().bookingHistory("20230813_112222_7479").then((e) async{

      print("my registerr data $e");
      if(e != null){

        visible.value = 0;
        historyList.value = e.bookings;
        print("total history +++++++++++++++${historyList.value.length}");



        // Get.offAllNamed(Routes.BASE);



      } else {
        print("error ++++++++++++++");
        visible.value = 0;

      }

    });
  }
  makeReview() async{
    visible.value++;
    ListingRep().makeReview(listerId:"", listingId: "", userID: "", review: "").then((e) async{

      print("my registerr data $e");
      if(e != null){

        visible.value = 0;

        print("total history +++++++++++++++$e");



        // Get.offAllNamed(Routes.BASE);



      } else {
        print("error ++++++++++++++");
        visible.value = 0;

      }

    });
  }
  makeBookingController(BuildContext context) async{
   visible.value++;
    ListingRep().makeBooking().then((e) async{

      print("my registerr data $e");
      if(e != null){



        visible.value = 0;
      //  listingData.value = e.listings;
       // print("total listing +++++++++++++++${listingData.value.length}");


        showDialog(
            context:
            context,
            builder:
                (BuildContext
            context) {
              return AlertDialog(
                  insetPadding: EdgeInsets.all(0),
                  elevation:
                  20,
                  backgroundColor:
                  Colors.white,
                  content: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width * .7,
                        height: MediaQuery.of(context).size.width * .4,
                        child: Column(
                          children: [
                            Text("Your transaction has been successful!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                            Text("Your booking has been placed", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                            Text("You can view your bookings in the ‘My Bookings’ tab in the menu section.", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18)),

                          ],
                        ) ),
                  )
              );
            });
        // Get.offAllNamed(Routes.BASE);



      } else {
        print("error ++++++++++++++");
        visible.value = 0;

      }

    });
  }
  // date select


  Future<void> selectCheckInDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedCheckinDate,
        firstDate: DateTime(1920, 8),
        lastDate: DateTime(2100),);
    if (picked != null && picked != selectedCheckinDate) {
      selectedCheckinDate = picked;
    }
    startDate.value = "${myFormat.format(selectedCheckinDate)}";
  }
  Future<void> selectCheckoutDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedCheckoutDate,
        firstDate: DateTime(1920, 8),
        lastDate:  DateTime(2100),);
    if (picked != null && picked != selectedCheckoutDate) {
      selectedCheckoutDate = picked;
    }
    endDate.value = "${myFormat.format(selectedCheckoutDate)}";
  }

  getDateDifferenceNum(){

    final difference = selectedCheckoutDate.difference(selectedCheckinDate).inDays;
    return difference;
  }
}




// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0



/// Example event class.
class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(
        item % 4 + 1, (index) => Event('Event $item | ${index + 1}')))
  ..addAll({
    kToday: [
      Event('Today\'s Event 1'),
      Event('Today\'s Event 2'),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
        (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);