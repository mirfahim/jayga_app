import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:jayga/models/booking_history_model.dart';
import 'package:jayga/models/lister_model.dart';
import 'package:jayga/models/listing/get_listing_images_model.dart';
import 'package:jayga/models/profile/profile_model.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/utils/ui_support.dart';
import 'package:ml_kit_ocr/ml_kit_ocr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:jayga/modules/A_Base/view/saved_screen/saved_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jayga/repositories/listing_rep.dart';

import '../../../models/listing/get_lister_profile_listing_model.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth_services.dart';
import '../../home/view/home_page_view.dart';

class HostController extends GetxController {
  //TODO: Implement BaseController
  final pageIndex = 1.obs;
  final userData = UserModel().obs;
  final term = false.obs;
  final loading = false.obs;
  final isActive = false.obs;
  final isActiveInt = 0.obs;
  final currentIndex = 0.obs;
  final nidPic = "".obs;
  final districtId = "".obs;
  final districtName = "".obs;
  final areaName = "".obs;
  //final nidPic = "".obs;
  final imageList = <File>[].obs;
  final nidImageList = <File>[].obs;
  final lister_image = "".obs;
  final profileData = ProfileModel().obs;
  final nid_back = "".obs;
  final utility_image = "".obs;
  final listing_image = "".obs;
  final categoryDataLoaded = false.obs;
  final seeAmenities = false.obs;
  var nameController = TextEditingController().obs;
  // image
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  // Crop code
  var cropImagePath = ''.obs;
  var cropImageSize = ''.obs;
  // Compress code
  var compressImagePath = ''.obs;
  var compressImageSize = ''.obs;
  String? nidNumber;
  String text = "TEXT";
  final selectedNIDFront = File('').obs;
  final selectedUsrFile = File('').obs;
  final selectedUtilityFile = File('').obs;
  final selectedListingFile = File('').obs;
  final textDetector = MlKitOcr();
  final nidNo = ''.obs;
  final historyList = <Booking>[].obs;
  final getListerProfileListing = <ProfileListing>[].obs;
  final getListingImages = <ListingImage>[].obs;
  // main form

  final type_of_property = "".obs;
  final listingType = "".obs;
  final house = 0.obs;
  final flat = 0.obs;
  final selectIndex = 0.obs;
  final cabin = 0.obs;
  final lounge = 0.obs;
  final farm = 0.obs;
  final campsite = 0.obs;
  final hotel = 0.obs;
  final bedBrk = 0.obs;
  final entirePlace = 0.obs;
  final a_room = 0.obs;
  final shared_room = 0.obs;
  var streetAddress = TextEditingController().obs;
  var town = TextEditingController().obs;
  var district = TextEditingController().obs;
  var zip = TextEditingController().obs;
  final numGuest = 0.obs;
  final numbedRooms = 0.obs;
  final numBeds = 0.obs;
  final listingID = "".obs;
  final numBath = 0.obs;
  final shortStay = 0.obs;
  final sliderList = [
    "assets/images/ex_land1.png",
    "assets/images/ex_land1.png",
    "assets/images/ex_land1.png",
  ].obs;

  //tell guest what place has to offer
  final qwifi = 0.obs;
  final qTv = 0.obs;
  final qKitchen = 0.obs;
  final qwmachine = 0.obs;
  final qfreeParking = 0.obs;
  final qbreakFast = 0.obs;
  final qAirCOn = 0.obs;
  final qWorkSpace = 0.obs;
  final qPool = 0.obs;
  final qHotTub = 0.obs;
  final qPatio = 0.obs;
  final qBBqGrill = 0.obs;
  final qDiningArea = 0.obs;
  final qFirePit = 0.obs;
  final qGym = 0.obs;
  final selectLocation = const LatLng(0, 0).obs;
  final qLakeAccess = 0.obs;
  final qSmokeAlarm = 0.obs;
  final qFirstAidKit = 0.obs;
  final qFireExtinguisher = 0.obs;
  final qCCtv = 0.obs;
//  var  mapController = GoogleMapController();
  //tell guest what place has to offer end
  //restriction
  final rIndoorSmoking = 0.obs;
  final r = 0.obs;
  final rParty = 0.obs;
  final rPets = 0.obs;
  var rAnythingSpecificMessage = TextEditingController().obs;
  final rUnvaccinnated = 0.obs;
  final rLateNigth = 0.obs;
  final rUnknwnGst = 0.obs;
  final listingImages = <File>[].obs;
  final listingImagesBase64 = <String>[].obs;

  //restriction end
  var houseTitle = TextEditingController().obs;
  //describe house
  final dPeaceful = 0.obs;

  final dUnique = 0.obs;
  final dFamilyFrndly = 0.obs;
  final dStylish = 0.obs;
  final dCentral = 0.obs;
  final dSpacious = 0.obs;
  var listingDescription = TextEditingController().obs;
  var listingPrice = TextEditingController().obs;
  // end form

  Completer<GoogleMapController> controllerMap = Completer();
  static final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  @override
  void onInit() {
    getBookingController();
    getListerProfileListingController();
    profileController();
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

  refreshController() {
    pageIndex.value = 1;
    term.value = false;
    listingImages.clear();
    nidImageList.clear();
    houseTitle.value.clear();
    listingPrice.value.clear();
  }

  void getImage(ImageSource imageSource, String type) async {
    selectedImagePath = ''.obs;
    selectedImageSize = ''.obs;

    // Crop code
    cropImagePath = ''.obs;
    cropImageSize = ''.obs;

    // Compress code
    compressImagePath = ''.obs;
    compressImageSize = ''.obs;

    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";

      // Crop
      final cropImageFile = await ImageCropper().cropImage(
          sourcePath: selectedImagePath.value,
          aspectRatioPresets: [CropAspectRatioPreset.ratio4x3],
          maxWidth: 512,
          maxHeight: 512,
          compressFormat: ImageCompressFormat.jpg);
      cropImagePath.value = cropImageFile!.path;
      cropImageSize.value =
          ((File(cropImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";

      // Compress
      print('compress path: ${cropImagePath.value}');
      final dir = Directory.systemTemp;
      final targetPath =
          dir.absolute.path + '/' + cropImagePath.value.split('/').last;
      var compressedFile = await FlutterImageCompress.compressAndGetFile(
          cropImagePath.value, targetPath,
          quality: 100, keepExif: false, autoCorrectionAngle: true, rotate: 0);
      compressImagePath.value = compressedFile!.path;
      compressImageSize.value =
          ((File(compressImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";

      // final bytes = compressedFile.readAsBytesSync();

      List<int> bytes = compressedFile.readAsBytesSync();

      if (type == 'nid_front') {
        //  selectedNIDFront.value = File(compressedFile.path);

        selectedNIDFront.value = File(targetPath);
        nidImageList.add(selectedNIDFront.value);
        nidPic.value = base64Encode(bytes);
        print("listing nid images ${nidImageList.value[0]}");
        print("total nid listing images are ${nidImageList.length.toString()}");
        nidRead();
      }
      if (type == 'nid_back') {
        nid_back.value = base64Encode(bytes);
        print("lister_image image is ${lister_image.value}");
        selectedUsrFile.value = File(targetPath);
        nidImageList.add(selectedUsrFile.value);
        print("listing nid images ${nidImageList.value[0]}");
        print("total nid listing images are ${nidImageList.length.toString()}");
      }
      if (type == 'lister_image') {
        lister_image.value = base64Encode(bytes);
        print("lister_image image is ${lister_image.value}");
        selectedUsrFile.value = File(targetPath);
        nidImageList.add(selectedUsrFile.value);
        print("listing nid images ${nidImageList.value[0]}");
        print("total nid listing images are ${nidImageList.length.toString()}");
      }
      if (type == 'utility') {
        utility_image.value = base64Encode(bytes);
        print("utility image is ${utility_image.value}");
        selectedUtilityFile.value = File(targetPath);

        nidImageList.add(selectedUtilityFile.value);
      }

      if (type == 'listing') {
        listing_image.value = base64Encode(bytes);

        print("listing  image is ${utility_image.value}");
        selectedListingFile.value = File(targetPath);

        listingImages.add(selectedListingFile.value);
        listingImagesBase64.add(base64Encode(bytes));
      }
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  getListingImagesController(id) {
    getListingImages.value.clear();
    ListingRep().getListingImages(id).then((value) {
      getListingImages.value = value.listingImages;
      print("get listing images length ${getListingImages.value.length}");
    });
  }

  addNidImage(listingIDd) {
    print("listing nid images ${nidImageList.value[0]}");
    print("total nid listing images are ${nidImageList.length.toString()}");
    ListingRep()
        .uploadNidImage(
            listImages: nidImageList.value,
            listing_id: listingIDd,
            lister_id: Get.find<AuthService>()
                .currentUser
                .value
                .user!
                .userId
                .toString())
        .then((value) {});
  }

  addImage(listingIDd) {
    String a = "";
    print("listing images ${listingImages.value[0]}");
    print("total listing images are ${listingImages.length.toString()}");
    ListingRep()
        .upload(
            listImages: listingImages.value,
            listing_id: listingIDd,
            lister_id: Get.find<AuthService>()
                .currentUser
                .value
                .user!
                .userId
                .toString())
        .then((value) {
      Get.showSnackbar(Ui.successSnackBar(
          message: "Listing picture updated", title: 'Success'));
      getListingImagesController(listingIDd);
    });
    return a;
  }

  nidRead() async {
    print("started nid checking 1........");
    final inputImage = InputImage.fromFile(selectedNIDFront.value);
    final RecognisedText recognisedText =
        await textDetector.processImage(inputImage);
    print("started nid checking 1........");
    String text = recognisedText.text;
    print(
        "started nid checking 1 and read test ___________________$text........");
    for (TextBlock block in recognisedText.blocks) {
      final Rect rect = block.rect;
      final List<Offset> cornerPoints = block.cornerPoints;
      final String text = block.text;
      final List<String> languages = block.recognizedLanguages;
      print("working here ++++++1111111111111");
      for (TextLine line in block.lines) {
        // Same getters as TextBlock
        print('nid line: ${line.text}');

        if (line.text.contains('ID NO:')) {
          print("working here ++++++2222222");
          nidNo.value = line.text.replaceAll('ID NO:', '').trim();

          print(
              'nid no: ${line.text.replaceAll('ID NO:', '').replaceAll(' ', '')}');
          print("working here ++++++3333333");
        } else if (line.text.contains('NID No') ||
            line.text.contains('NID NO')) {
          print("working here ++++++444444444");
          nidNo.value = line.text.replaceAll('NID No', '').trim();
          print('nid no +++++++++++++++++++ FROM NID NO: ${nidNo.value}');
          print("working here ++++++555555555");
        } else {
          print("working here ++++++6666666");
          final exp = RegExp(r'(\d{10})');
          print("working here ++++++777777");
          print("hlw nid 1 ${exp.stringMatch(line.text.replaceAll(' ', ''))}");
          userData.value.nid = exp.stringMatch(line.text.replaceAll(' ', ''));
          //  print("hlw nid ++++++++++++++++++++++$nid");
          //  nidNo.value = nid!;
          print('nid nid 1234: ${userData.value.nid}');
          print('nid nid: ${nidNo.value}');
        }
      }
    }

    //print("nid check 4${userData.value.nid!}");
    if (userData.value.nid == null) {
      Get.showSnackbar(Ui.errorSnackBar(
          message: "Please take a clear picture of your NID", title: 'Error'));
    } else {
      print('nid nid 1234: ${userData.value.nid}');

      // Get.back();
      pageIndex.value = 2;
      pageIndex.value = 1;
      print("duplicated nid check");
      //duplicateNIDCheck();
    }

    // print('nid data: ${text}');
  }

  profileController() async {
    ListingRep()
        .getProfile(Get.find<AuthService>().currentUser.value.user!.userId)
        .then((e) async {
      print("my profile data ${e.userData![0].name}");
      if (e != null) {
        profileData.value = e;
        print("profile data +++++++++++++++${profileData.value}");
      } else {
        print("error ++++++++++++++");
      }
    });
  }

  deleteListingImage({imageID, listingID}) {
    ListingRep().deleteListingImage(imageID: imageID).then((value) {
      print("image delete controller res $value");
      getListingImagesController(listingID);
    });
  }

  getUserLocation() {}
  addListingController() {
    loading.value = true;
    print(
        "add listing called user id is ${Get.find<AuthService>().currentUser.value.user!.userId.toString()}");
    ListingRep()
        .addListingRep(
      lister_id: profileData.value.userData!.first.id.toString(),
      lister_name:
          Get.find<HomeController>().profileData.value.userData!.first.name,
      guest_num: numGuest.value.toString(),
      nid_number: "27346786243878243",
      bed_num: numBeds.value.toString(),
      bathroom_num: numBath.value.toString(),
      listing_title: houseTitle.value.text,
      listing_description: listingDescription.value.text,
      full_day_price_set_by_user: listingPrice.value.text,
      listing_address: streetAddress.value.text,
      zip_code: zip.value.text,
      district: districtName.value,
      town: areaName.value,
      allow_short_stay: shortStay.value.toString(),
      describe_peaceful: "1",
      describe_unique: "0",
      describe_familyfriendly: "1",
      describe_stylish: "0",
      describe_central: "1",
      describe_spacious: "1",
      listing_type: listingType.value,
      lati: selectLocation.value!.latitude.toString(),
      longi: selectLocation.value!.longitude.toString(),
      appartments: flat.value.toString(),
      cabin: cabin.value.toString(),
      lounge: lounge.value.toString(),
      farm: farm.value.toString(),
      campsite: campsite.value.toString(),
      hotel: hotel.value.toString(),
      bread_breakfast: qbreakFast.value.toString(),
      wifi: qwifi.value.toString(),
      tv: qTv.value.toString(),
      kitchen: qKitchen.value.toString(),
      washing_machine: qwmachine.value.toString(),
      free_parking: qfreeParking.value.toString(),
      breakfast_included: qbreakFast.value.toString(),
      air_condition: qAirCOn.value.toString(),
      dedicated_workspace: qWorkSpace.value.toString(),
      pool: qPool.value.toString(),
      hot_tub: qHotTub.value.toString(),
      patio: qPatio.value.toString(),
      bbq_grill: qPatio.value.toString(),
      fire_pit: qPatio.value.toString(),
      gym: qPatio.value.toString(),
      beach_lake_access: qPatio.value.toString(),
      smoke_alarm: qPatio.value.toString(),
      first_aid: qPatio.value.toString(),
      fire_extinguish: qPatio.value.toString(),
      cctv: qPatio.value.toString(),
    )
        .then((value) {
      if (value != null) {
        addImage(value['listing_id']["id"]);
        addNidImage(value['listing_id']["id"]);
        loading.value = false;
        pageIndex.value = 19;
      } else {
        print("listing did not added.");
        loading.value = false;
      }
    });
  }

  changeBookingStatus({booking_id, booking_status}) {
    loading.value = true;
    print("change booking status");
    ListingRep()
        .changeBookingStatus(
      booking_id: booking_id.toString(),
      booking_status: booking_status.toString(),
    )
        .then((value) {
      getBookingController();
    });
  }
  changeListingActiveStatus({listingID, activeStatus}) {
    loading.value = true;
    print("change listing active status");
    ListingRep()
        .changeListingActiveStatus(
      listingID: listingID.toString(),
      activeStatus: activeStatus.toString(),
    )
        .then((value) {
      getListerProfileListingController();
      Get.find<BookingController>().filterdListingController();
    });
  }

  editListingController(
      {String? lister_id,
      String? lister_name,
      String? guest_num,
      String? nid_number,
      String? bed_num,
      String? bathroom_num,
      String? listing_title,
      String? listing_description,
      String? full_day_price_set_by_user,
      String? listing_address,
      String? zip_code,
      String? district,
      String? town,
      String? allow_short_stay,
      String? describe_peaceful,
      String? describe_unique,
      String? describe_familyfriendly,
      String? describe_stylish,
      String? describe_central,
      String? describe_spacious,
      String? listing_type,
      String? lati,
      String? longi,
      String? appartments,
      String? cabin,
      String? lounge,
      String? farm,
      String? campsite,
      String? hotel,
      String? bread_breakfast,
      String? wifi,
      String? tv,
      String? kitchen,
      String? washing_machine,
      String? free_parking,
      String? breakfast_included,
      String? air_condition,
      String? dedicated_workspace,
      String? pool,
      String? hot_tub,
      String? patio,
      String? bbq_grill,
      String? fire_pit,
      String? gym,
      String? beach_lake_access,
      String? smoke_alarm,
      String? first_aid,
      String? fire_extinguish,
      String? indoor_smoking,
      String? party,
      String? pets,
      String? listingID,
      String? late_night_entry,
      String? unknown_guest_entry,
      String? specific_requirement,
      String? cctv}) {
    print("update listing called");
    ListingRep()
        .editListingRep(
      lister_id: lister_id,
      listingID: listingID,
      lister_name: lister_name,
      guest_num: guest_num,
      nid_number: nid_number,
      bed_num: bed_num,
      bathroom_num: bathroom_num,
      listing_title: listing_title,
      listing_description: listing_description,
      full_day_price_set_by_user: full_day_price_set_by_user,
      listing_address: listing_address,
      zip_code: zip_code,
      district: district,
      town: town,
      allow_short_stay: allow_short_stay,
      describe_peaceful: describe_peaceful,
      describe_unique: describe_unique,
      describe_familyfriendly: describe_familyfriendly,
      describe_stylish: describe_stylish,
      describe_central: describe_central,
      describe_spacious: describe_spacious,
      listing_type: listing_type,
      lati: lati,
      longi: longi,
      appartments: "0",
      cabin: "0",
      lounge:"0",
      farm: "0",
      campsite: "0",
      hotel: "0",
      bread_breakfast: bread_breakfast,
      wifi: wifi,
      tv: tv,
      kitchen: kitchen,
      washing_machine: washing_machine,
      free_parking: free_parking,
      breakfast_included: breakfast_included,
      air_condition: air_condition,
      dedicated_workspace: dedicated_workspace,
      pool: pool,
      hot_tub: hot_tub,
      patio: patio,
      bbq_grill: bbq_grill,
      fire_pit: fire_pit,
      gym: gym,
      beach_lake_access: beach_lake_access,
      smoke_alarm: smoke_alarm,
      first_aid: first_aid,
      fire_extinguish: fire_extinguish,
      cctv: cctv,
    )
        .then((value) {
      if (value != null) {
        Get.find<BookingController>().checkInternetConnectivity();

        Get.offNamed(Routes.BASE);
        Get.showSnackbar(Ui.successSnackBar(
            message: "Listing profile updated", title: 'Success'));
        loading.value = false;
      } else {
        print("listing did not added.");
        loading.value = false;
      }
    });
  }

  getBookingController() {
    loading.value = true;
    print("get booking called");
    ListingRep()
        .getBooking(
      lister_id:
          Get.find<AuthService>().currentUser.value.user!.userId.toString(),
    )
        .then((value) {
      if (value != null) {
        historyList.value = value.bookings!;
        loading.value = false;
      } else {
        print("lister booking error");
        loading.value = false;
      }
    });
  }

  getListerProfileListingController() {
    loading.value = true;
    print(
        "get booking called lister id is${Get.find<AuthService>().currentUser.value.user!.userId.toString()}");
    ListingRep()
        .getListerProfileListing(
      lister_id:
          Get.find<AuthService>().currentUser.value.user!.userId.toString(),
    )
        .then((value) {
      if (value != null) {
        getListerProfileListing.value = value.profileListings!;
        loading.value = false;
      } else {
        print("lister profile listing list error");
        loading.value = false;
      }
    });
  }
}
