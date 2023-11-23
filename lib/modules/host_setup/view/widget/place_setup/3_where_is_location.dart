import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/booking/view/all_alemnities.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/modules/host_setup/controller/host_controller.dart';
import 'package:jayga/services/location_service.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WhereIsPlace extends GetView<HostController> {
  const WhereIsPlace({Key? key}) : super(key: key);
//page7
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
    color: AppColors.appBackGroundBrn,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .3,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40)),
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Where is your place located?",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black),
                ),
                Text(
                  "Your address is only shared with guests after they’ve made a reservation",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.black54),
                ),
                SizedBox(
                  height: 20,
                ),



              ],
            ),
          ),
        ),
        SizedBox(height: 20,),
        Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .4,
              width: MediaQuery.of(context).size.width * .9,
              child: GoogleMap(
                gestureRecognizers: Set()
                  ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
                  ..add(Factory<VerticalDragGestureRecognizer>(
                          () => VerticalDragGestureRecognizer())),
                zoomControlsEnabled: true,
                scrollGesturesEnabled: true,
                onTap: (latLng) {
                  controller.selectLocation.value = latLng;
                },
                initialCameraPosition: CameraPosition(
                  //target: LatLng(Get.find<LocationService>().currentLocation['lat'], Get.find<LocationService>().currentLocation['lng']),
                  zoom: 50,
                  target: LatLng(23.797911, 90.414391),
                ),
                markers: controller.selectLocation.value != null
                    ? {
                  Marker(
                    markerId: MarkerId('selected-location'),
                    position: controller.selectLocation.value!,
                    infoWindow: InfoWindow(
                      title: 'Selected Location',
                      snippet:
                      'Lat: ${controller.selectLocation.value!.latitude}, Lng: ${controller.selectLocation.value!.longitude}',
                    ),
                  ),
                }
                    : {},
              ),
            ),
          ],
        ),
      ],
    ),
      );
    });
  }
}

