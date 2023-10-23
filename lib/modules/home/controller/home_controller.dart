import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jayga/models/lister_model.dart';
import 'package:jayga/models/listing_model.dart';
import 'package:jayga/models/profile/profile_model.dart';
import 'package:jayga/repositories/auth/auth_rep.dart';
import 'package:jayga/repositories/listing_rep.dart';
import 'package:jayga/routes/app_pages.dart';
import 'package:jayga/services/auth_services.dart';
import 'package:jayga/utils/ui_support.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:in_app_review/in_app_review.dart';
import '../../../models/listing_model.dart';

class HomeController extends GetxController {
  //TODO: Implement LoginController
  final userData = UserModel().obs;
  var JobData = TextEditingController().obs;
  var nameController = TextEditingController().obs;
  var passController = TextEditingController().obs;
  final visible = 0.obs;
  final listingData = <Listing>[].obs;
  final seeListView = false.obs;
  final profileData = ProfileModel().obs;
  final otpNum = 0.obs;
  var phoneNumCOntroller = TextEditingController().obs;
  var pinCodeController = TextEditingController().obs;
  StreamController<ErrorAnimationType>? pinErrorController;
  //image
  final formKey = GlobalKey<FormState>();
  final visibleForLogin = 0.obs;
  final visibleForGoogle = 0.obs;
  final visibleForFB = 0.obs;
  final visibleOTP = 0.obs;
  final visibleRegister = 0.obs;
  final  fcmToken = "".obs;

  final profileModel = ProfileModel().obs;
  final selectedProfileFile = File('').obs;
  final editPhnLoad = 0.obs;
  final profileImagesList = <File>[].obs;
  final profileImagesBase64 = <String>[].obs;
  final profile_image = "".obs;
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  // Crop code
  var cropImagePath = ''.obs;
  var cropImageSize = ''.obs;
  // Compress code
  var compressImagePath = ''.obs;
  var compressImageSize = ''.obs;
  final InAppReview inAppReview = InAppReview.instance;
  //end image
  @override
  void onInit() {
    profileController();
    pinErrorController = StreamController<ErrorAnimationType>();
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
  sendOtpWithMuthoFun() async{

    AuthRepository().sendOtpWithMuthoFun(phoneNumCOntroller.value.text, otpNum.value.toString() ).then((e) async{
      print("hlw muthofun1");
      if(e['message']== "SMS queued successfully!"){
        print("hlw muthofun2");

        Get.toNamed(Routes.OTPPAGE);

      }else {
        print("hlw muthofun3");

      }

      print("my login data $e");


    });
  }

  makeRandomOtpNUm(){
    var rng = new Random();
    otpNum.value =  rng.nextInt(900000) + 100000;
    print("my otp code is ${otpNum.value}");
    sendOtpWithMuthoFun() ;
  }
  profileController() async {
    ListingRep().getProfile(Get.find<AuthService>().currentUser.value.user!.userId).then((e) async {
      print("my profile data ${e.userData![0].name}");
      if (e != null) {
        profileData.value = e;
        print("profile data +++++++++++++++${profileData.value}");

        // Get.offAllNamed(Routes.BASE);
      } else {
        print("error ++++++++++++++");
      }
    });
  }
  addProfileImage(userId){
    ListingRep().uploadUserImage(imageFile: selectedProfileFile.value, userID: userId ).then((value) {});
  }
  editProfileController({String? id, }) {
 print("user id is $id");
    ListingRep().editProfileRep(userId: id).then((value) {
      print("edit profile response is $value");
      if (value["message"] ==
          "User information updated") {
        Get.showSnackbar(
            Ui.successSnackBar(message: value["message"], title: 'Error'.tr));
      }
    });
  }


  appReview()async{
    if (await inAppReview.isAvailable()) {
    inAppReview.requestReview();
    }
  }



  void getImage(ImageSource imageSource, String type, String id,) async {
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

      if (type == 'profile') {
        profile_image.value = base64Encode(bytes);

        print("utility image is ${profile_image.value}");
        selectedProfileFile.value = File(targetPath);

        profileImagesList.add(selectedProfileFile.value);
        profileImagesBase64.add(base64Encode(bytes));
        addProfileImage(id);

      }
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
