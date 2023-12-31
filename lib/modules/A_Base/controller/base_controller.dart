import 'dart:convert';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jayga/modules/A_Base/view/saved_screen/saved_screen.dart';
import 'package:jayga/modules/home/profile/profile_screen.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../routes/app_pages.dart';
import '../../booking/view/booking_home_page.dart';
import '../../booking/view/my_booking_history/my_booking_screen.dart';
import 'package:geolocator/geolocator.dart';

class BaseController extends GetxController {
  //TODO: Implement BaseController
  final landingPage = 1.obs;
  final currentIndex = 0.obs;
  final address = "".obs;
  final isOpened = false.obs;
  final scaffoldKey = GlobalKey<ScaffoldState>().obs;
  GeolocatorService geolocatorService = GeolocatorService();
  final categoryDataLoaded = false.obs;
  final gsideMenuKey = GlobalKey<SideMenuState>().obs;
  final endSideMenuKey = GlobalKey<SideMenuState>().obs;

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
  toggleMenu([bool end = false]) {
    if (end) {
      final _state = endSideMenuKey.value.currentState;
      if (_state!.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    } else {
      final _state = gsideMenuKey.value.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    }
  }
  void openDrawer() {
    scaffoldKey.value.currentState!.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.value.currentState!.openEndDrawer();
  }
  advancedStatusCheck(BuildContext context) async {
    print("hlw version ________________________");
    final newVersion = NewVersionPlus(
      //iOSId: 'com.google.Vespa',
      androidId: 'com.jayga.app',
    );
    var status = await newVersion.getVersionStatus();
    print("version status ${status!.appStoreLink}");
    if (status.canUpdate == true) {
      newVersion.showUpdateDialog(
        launchMode: LaunchMode.externalApplication,
        context: context,
        versionStatus: status,
        dialogTitle: 'Update Available!',
        dialogText:
        'Upgrade Jayga ${status.localVersion} to Jayga ${status.storeVersion}',
      );
    }
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