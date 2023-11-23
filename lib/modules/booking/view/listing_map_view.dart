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
import '../../../routes/app_pages.dart';
import '../../../services/location_service.dart';
import 'my_booking_history/payment_webview.dart';
import 'package:intl/intl.dart';

class ListingMapView extends GetView<BookingController> {
  const ListingMapView({Key? key}) : super(key: key);

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
      body: WillPopScope(
        onWillPop: () async {
          Get.offAllNamed(Routes.BASE);
          return true;
        },
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .9,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                gestureRecognizers: Set()
                  ..add(Factory<PanGestureRecognizer>(
                      () => PanGestureRecognizer()))
                  ..add(Factory<VerticalDragGestureRecognizer>(
                      () => VerticalDragGestureRecognizer())),
                zoomControlsEnabled: true,
                scrollGesturesEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: LatLng(23.797911, 90.414391),
                  zoom: 10,
                  //target: LatLng(23.797911, 90.414391),
                ),
                markers: Set<Marker>.from(controller.markers.value),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
