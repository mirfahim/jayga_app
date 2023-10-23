import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jayga/models/profile/profile_model.dart';

import 'package:jayga/modules/A_Base/view/saved_screen/saved_screen.dart';
import 'package:jayga/modules/home/profile/profile_screen.dart';
import 'package:jayga/repositories/listing_rep.dart';


import '../../../routes/app_pages.dart';
import '../../booking/view/booking_home_page.dart';
import '../../booking/view/my_booking_history/my_booking_screen.dart';
import '../../home/view/home_page_view.dart';
import 'package:geolocator/geolocator.dart';

class BaseController extends GetxController {
  //TODO: Implement BaseController
  final landingPage = 1.obs;
  final currentIndex = 0.obs;
  final address = "".obs;
  GeolocatorService geolocatorService = GeolocatorService();
  final categoryDataLoaded = false.obs;


  List<Widget> pages = [
    ExplorePageView(),
    SavedView(),
    MyBookingView(),
    ProfileView(),

  ];
  @override
  void onInit() {

    super.onInit();
  }

  @override
  void onReady() {
    geolocatorService.determinePosition().then((ele) {
      getAddressFromLatLng(ele!.latitude, ele.longitude);
    });
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Widget get currentPage => pages[currentIndex.value];

  Future<void> changePageOutRoot(int index) async {
    currentIndex.value = index;
    await Get.offNamedUntil(Routes.BASE, (Route route) {
      if (route.settings.name == Routes.BASE) {
        return true;
      }
      return false;
    }, arguments: index);
  }

  getAddressFromLatLng(double lat, double lng) async {
    String mapApiKey = "AIzaSyAG8IAuH-Yz4b3baxmK1iw81BH5vE4HsSs";
    String _host = 'https://maps.google.com/maps/api/geocode/json';
    final url = '$_host?key=$mapApiKey&language=bn&latlng=$lat,$lng&country:BD';
    if (lat != null && lng != null) {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        print("response of api google ==== ${response.body}");
        String _formattedAddress = data["results"][0]["formatted_address"];
        String _area =
        data["results"][0]["address_components"][1]["short_name"];
        print("response ==== $_formattedAddress");
        address.value = _area + ", " + _formattedAddress;
        return address.value;
      }
      return address.value;
    }
  }
}
class GeolocatorService {
  Future<Position?> determinePosition() async {
    print("location is -----");
    LocationPermission permission;
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    } else {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      //throw Exception('Error');
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}