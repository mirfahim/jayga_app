import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:jayga/models/lister_model.dart';
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

import '../../../routes/app_pages.dart';
import '../../../services/auth_services.dart';
import '../../home/view/home_page_view.dart';

class HostController extends GetxController {
  //TODO: Implement BaseController
  final pageIndex = 1.obs;
  final userData = UserModel().obs;
  final term = false.obs;
  final loading = false.obs;
  final currentIndex = 0.obs;
  final nidPic = "".obs;
  final districtId = "".obs;
  //final nidPic = "".obs;
  final imageList = <File>[].obs;
  final lister_image = "".obs;
  final utility_image = "".obs;
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
  final textDetector = MlKitOcr();
  final nidNo = ''.obs;

  // main form

  final type_of_property = "".obs;
  final house = 0.obs;
  final flat = 0.obs;
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
  final numBath = 0.obs;
  final shortStay = 0.obs;

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
  final listingImages = [].obs;
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

  void getImage(ImageSource imageSource, String type) async {
    selectedImagePath = ''.obs;
    selectedImageSize = ''.obs;

    // Crop code
    cropImagePath = ''.obs;
    cropImageSize = ''.obs;

    // Compress code
    compressImagePath = ''.obs;
    compressImageSize = ''.obs;

    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";

      // Crop
      final cropImageFile = await ImageCropper().cropImage(
          sourcePath: selectedImagePath.value,
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
        imageList.add(selectedNIDFront.value);
        nidPic.value = base64Encode(bytes);

        nidRead();
      }
      if (type == 'lister_image') {
        lister_image.value = base64Encode(bytes);
        print("lister_image image is ${lister_image.value}");
        selectedUsrFile.value = File(targetPath);
        imageList.add(selectedUsrFile.value);
      }
      if (type == 'utility') {
        utility_image.value = base64Encode(bytes);
        print("utility image is ${utility_image.value}");
        selectedUtilityFile.value = File(targetPath);

        imageList.add(selectedUtilityFile.value);
      }

      if (type == 'listing') {
        utility_image.value = base64Encode(bytes);

        print("utility image is ${utility_image.value}");
        selectedUtilityFile.value = File(targetPath);

        listingImages.add(selectedUtilityFile.value);
        listingImagesBase64.add(base64Encode(bytes));
      }
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  addImage(listingIDd) {
    ListingRep()
        .upload(
            imageFile: imageList[0],
            listImages: imageList.value,
            listing_id: listingIDd)
        .then((value) {});
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

  getUserLocation() {}
  addListingController() {
    loading.value = true;
    print("add listing called");
    ListingRep()
        .addListingRep(
            lister_id: "1",
            lister_name: "Atifa karim",
            guest_num: "4",
            nid_number: "27346786243878243",
            bed_num: "2",
            bathroom_num: "2",
            listing_title: houseTitle.value,
            listing_description: "App Is working",
            full_day_price_set_by_user: "2700.00",
            listing_address: "123 Forest Lane",
            zip_code: "12345",
            district: "Mountain District",
            town: "Pineville",
            allow_short_stay: "1",
            describe_peaceful: "1",
            describe_unique: "0",
            describe_familyfriendly: "1",
            describe_stylish: "0",
            describe_central: "1",
            describe_spacious: "1",
            listing_type: "Cabin",
            lati: "40.123456",
            longi: "-74.123456",
            appartments: "0",
            cabin: "1",
            lounge: "0",
            farm: "0",
            campsite: "0",
            hotel: "0",
            bread_breakfast: "1",
            wifi: "1",
            tv: "1",
            kitchen: "1",
            washing_machine: "1",
            free_parking: "1",
            breakfast_included: "1",
            air_condition: "0",
            dedicated_workspace: "1",
            pool: "1",
            hot_tub: "0",
            patio: "1",
            bbq_grill: '1',
            fire_pit: "0",
            gym: "0",
            beach_lake_access: "1",
            smoke_alarm: '1',
            first_aid: "1",
            fire_extinguish: '0',
            cctv: "0")
        .then((value) {
      if (value != null) {
        addImage(value['listing_id']["id"][0]["listing_id"]);
        loading.value = false;
      } else {
        print("listing did not added.");
        loading.value = false;
      }
    });
  }
}
