import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jayga/models/get_review_model.dart';
import 'package:jayga/models/listing/filtered_listing_model.dart';
import 'package:jayga/models/listing/get_lister_profile_listing_model.dart';
import 'package:jayga/models/listing/get_listing_images_model.dart';
import 'package:jayga/models/listing_model.dart';
import 'package:jayga/models/make_booking_res_model.dart';
import 'package:jayga/models/profile/cover_image_model.dart';
import 'package:jayga/models/profile/image_model.dart';
import 'package:jayga/models/profile/profile_model.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/routes/app_pages.dart';
import 'package:jayga/utils/ui_support.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import '../../api_provider/api_provider.dart';
import '../../api_provider/api_url.dart';
import '../../services/auth_services.dart';
import '../models/booking_history_model.dart';

class ListingRep {
  Future<ListingMOdel> listingRep() async {
    APIManager _manager = APIManager();
    final response = await _manager.get(
      "https://jayga.xyz/API/V1/listing-api.php",
    );
    print("login response is $response");

    return ListingMOdel.fromJson(response);
  }

  Future deleteListingImage({
    String? imageID,
  }) async {
    APIManager _manager = APIManager();
    print("delete image response is calling");
    final response = await _manager.get(
      ApiUrl.deleteListingImage + imageID!,
    );
    print("delete image");
    print("delete image $response");

    return response;
  }

  Future<GetListingFilterModel> filteredListing({
    String? guestNo,
    String? bedNo,
    String? district,
    String? town,
    String? allow_short_stay,
  }) async {
    APIManager _manager = APIManager();
    print("filtered response is calling");
    final response = await _manager.get(
      "https://new.jayga.io/api/filter-listings",
    );
    print("filtered response is calling before response");
    print("filtered response is $response");

    return GetListingFilterModel.fromJson(response);
  }

  Future<GetListingImagesModel> getListingImages(id) async {
    APIManager _manager = APIManager();
    final response = await _manager.get(
      "${ApiUrl.getListingImages}$id",
    );
    print("listing images is $response");

    return GetListingImagesModel.fromJson(response);
  }

  Future<ProfileModel> getProfile(id) async {
    APIManager _manager = APIManager();
    final response = await _manager.get(
      "${ApiUrl.getProfile}$id",
    );
    print("profile response is $response");

    return ProfileModel.fromJson(response);
  }

  editProfile({
    String? user_id,
    String? lister_id,
  }) async {
    Map<String, String> data = {
      "user_id": user_id!,
      "user_name": "mir101",
      "user_email": "mir@gamil.com",
      "phone": "02783084390",
      "user_nid": "34132431",
      "user_dob": "1994-11-29",
      "user_address": "jessore",
      "is_lister": "1",
      //"photo":,
    };

    // string to uri"
    var uri = Uri.parse(
      ApiUrl.updateProfile,
    );

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
//myzoo_2023@asia

    request.fields.addAll(data);
    // request.headers.addAll(
    //   {
    //     //'X-Requested-With': 'XMLHttpRequest',
    //     // "Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
    //     // 'Content-Type': 'multipart/form-data',
    //
    //     "Content-Type": "application/json",
    //     // "Accept": "application/json"
    //
    //     // "Accept-Encoding": "gzip, deflate, br",
    //     // "Accept":"*/*",
    //     // "Connection": "keep-alive"
    //   },
    // );
    // send
    http.Response response =
        await http.Response.fromStream(await request.send());
    print(response.statusCode);
    print(response.body);

    var bb = jsonDecode(response.body);
    return bb;
  }

  Future<BookingHistory> bookingHistory(id) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(
        "https://new.jayga.io/api/booking-history", {"user_id": id});
    print("booking historyy response is $response");

    return BookingHistory.fromJson(response);
  }

  Future<GetReviewModel> getReviewRep(id) async {
    APIManager _manager = APIManager();
    final response = await _manager.get(
      "https://new.jayga.io/api/reviews/$id",
    );
    print("review get response is $response");
    return GetReviewModel.fromJson(response);

    //return response;
  }

  editProfileRep({
    String? userId,
    String? user_name,
    String? user_email,
    String? phone,
    String? user_nid,
    String? user_dob,
    String? user_address,
  }) async {
    var response;
    APIManager _manager = APIManager();

    response = await _manager.postAPICall(ApiUrl.updateProfile, {
      "user_id":
          Get.find<AuthService>().currentUser.value.user!.userId.toString(),
      "user_name": user_name,
      "user_email": "user_email@test",
      "phone": phone,
      "user_nid": user_nid,
      "user_dob": user_dob,
      "user_address": user_address,
      "is_lister": "1",
    });
    if (response["messege"] == "User information updated") {
      Get.showSnackbar(Ui.successSnackBar(
          message: "User information updated", title: 'Success'.tr));
    }
    print("profile edit is $response");
    return response;
  }

  Future getPaymentUrl({
    String? name,
    String? booking_id,
    String? trans_id,
    String? amount,
  }) async {
    APIManager _manager = APIManager();
    final response =
        await _manager.postAPICall("https://new.jayga.io/api/payment", {
      "booking_id": booking_id,
      "cus_phone": "34132431",
      "cus_email": "1998-04-27",
      "tran_id": trans_id,
      "total_amount": amount,
    });
    print("payment response is $response");
    return response;

    //return response;
  }

  Future makeBooking({
    String? userId,
    String? listerID,
    String? name,
    String? guestNum,
    String? email,
    String? date_enter,
    String? date_exit,
    String? message,
    String? listingID,
    String? trans_id,
    String? amount,
    String? daysStay,
    String? phone,
  }) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(ApiUrl.addBooking, {
      "user_id": userId,
      "lister_id": listerID,
      "listing_id": listingID,
      "date_enter": date_enter,
      "date_exit": date_exit,
      "short_stay_flag": "0",
      "tier": "0",
      "phone": phone,
      "all_day_flag": "1",
      "pay_amount": amount,
      "booking_order_name": name,
      "transaction_id": trans_id,
      "days_stayed": daysStay,
      "payment_flag": "1",
    });
    print("make booking response is $response");
    return response;
  }

  Future makeReview(
      {String? stars,
      String? listerId,
      String? listingId,
      String? review}) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(ApiUrl.addReview, {
      "user_id":
          Get.find<AuthService>().currentUser.value.user!.userId.toString(),
      "lister_id":
          Get.find<AuthService>().currentUser.value.user!.userId.toString(),
      "listing_id": listingId,
      "stars": stars!,
      "review": review!,
    });
    print("make booking response is $response");

    return response;
  }

  Future paymentStatus({
    String? booking_id,
    String? listerId,
    String? listingId,
    String? pay_amount,
  }) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(ApiUrl.paymentSTatusChanged, {
      "user_id":
          Get.find<AuthService>().currentUser.value.user!.userId.toString(),
      "lister_id": listerId,
      "booking_id": listingId,
      "pay_amount": pay_amount!,
      "listing_id": listingId!,
    });
    print("payment staus cjanged ++++++++++++++++++++++ $response");

    return response;
  }

  Future<GetListerProfileListingModel> getListerProfileListing({
    lister_id,
  }) async {
    APIManager _manager = APIManager();

    final response =
        await _manager.get("${ApiUrl.getListerProfileListing}$lister_id");
    print("get lister profile listing $response");
    if (response['status'] == true) {
    } else if (response['status'] == false) {}

    return GetListerProfileListingModel.fromJson(response);
  }

  Future<BookingHistory> getBooking({
    lister_id,
  }) async {
    APIManager _manager = APIManager();

    final response = await _manager.postAPICall(ApiUrl.getBooking, {
      "lister_id": lister_id,
    });
    print("add listing response is $response");
    if (response['status'] == true) {
    } else if (response['status'] == false) {}

    return BookingHistory.fromJson(response);
  }

  Future changeBookingStatus(
      {String? booking_id, String? booking_status}) async {
    APIManager _manager = APIManager();
    print("api is ${ApiUrl.changeListingActiveStatus}");
    final response = await _manager.postAPICall(ApiUrl.changeBookingStatus, {
      "booking_id": booking_id,
      "booking_status": booking_status,
    });
    print("add listing response is $response");
    if (response['status'] == true) {
      Get.showSnackbar(Ui.successSnackBar(
          message: response['bookings'], title: 'Success'.tr));
    } else if (response['status'] == false) {
      Get.showSnackbar(
          Ui.errorSnackBar(message: response['bookings'], title: 'Error'.tr));
    }

    return response;
  }

  Future changeListingActiveStatus(
      {String? listingID, String? activeStatus}) async {
    APIManager _manager = APIManager();
    print("api is ${ApiUrl.changeListingActiveStatus}");
    final response =
        await _manager.postAPICall(ApiUrl.changeListingActiveStatus, {
      "listing_id": listingID,
      "isActive": activeStatus,
    });
    print("add listing response is $response");
    if (response['status'] == true) {
      Get.showSnackbar(Ui.successSnackBar(
          message: response['bookings'], title: 'Success'.tr));
    } else if (response['status'] == false) {
      Get.showSnackbar(
          Ui.errorSnackBar(message: response['bookings'], title: 'Error'.tr));
    }

    return response;
  }

  Future editListingRep(
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
      String? late_night_entry,
      String? listingID,
      String? unknown_guest_entry,
      String? specific_requirement,
      String? cctv}) async {
    String userData =
        Get.find<AuthService>().currentUser.value.user!.userId.toString();
    print("lister id is ++++++++++++++++++++++++++ $userData");
    APIManager _manager = APIManager();
    print("api is ${ApiUrl.updateListing}");
    final response = await _manager.postAPICall(ApiUrl.updateListing, {
      "listing_id": listingID,
      "lister_name": lister_name,
      "user_id": userData,
      "guest_num": guest_num,
      "nid_number": "27346786243878243",
      "bed_num": bed_num,
      "bathroom_num": bathroom_num,
      "listing_title": listing_title,
      "listing_description": listing_description,
      "full_day_price_set_by_user": full_day_price_set_by_user,
      "listing_address": listing_address,
      "zip_code": zip_code,
      "district": district,
      "town": town,
      "allow_short_stay": allow_short_stay.toString(),
      "describe_peaceful": "1",
      "describe_unique": "0",
      "describe_familyfriendly": "1",
      "describe_stylish": "0",
      "describe_central": "1",
      "describe_spacious": "1",
      "listing_type": listing_type,
      "lati": lati,
      "longi": longi,
      "apartments": "0",
      "cabin": "0",
      "lounge": "0",
      "farm": "0",
      "campsite": "0",
      "hotel": "0",
      "bread_breakfast": bread_breakfast.toString(),
      "wifi": wifi.toString(),
      "tv": tv,
      "kitchen": kitchen,
      "washing_machine": washing_machine,
      "free_parking": free_parking,
      "breakfast_included": bread_breakfast,
      "air_condition": air_condition,
      "dedicated_workspace": dedicated_workspace,
      "pool": pool,
      "hot_tub": hot_tub,
      "patio": patio,
      "bbq_grill": bbq_grill,
      "fire_pit": fire_pit,
      "outdooring": fire_pit,
      "gym": gym,
      "beach_lake_access": beach_lake_access,
      "smoke_alarm": smoke_alarm,
      "first_aid": first_aid,
      "fire_extinguish": fire_extinguish,
      "cctv": cctv,
      "indoor_smoking": indoor_smoking ?? "0",
      "party": party ?? "0",
      "pets": pets ?? "0",
      "late_night_entry": late_night_entry ?? "0",
      "unknown_guest_entry": unknown_guest_entry ?? "0",
      "specific_requirement": specific_requirement ?? "0",
    });
    print("add listing response is $response");
    if (response['status'] == true) {
      Get.showSnackbar(Ui.successSnackBar(
          message: response['messege'], title: 'Success'.tr));
    } else if (response['status'] == false) {
      Get.showSnackbar(
          Ui.errorSnackBar(message: response['messege'], title: 'Error'.tr));
    }

    return response;
  }

  Future addListingRep(
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
      String? late_night_entry,
      String? unknown_guest_entry,
      String? specific_requirement,
      String? cctv}) async {
    APIManager _manager = APIManager();
    print("api is ${ApiUrl.addListing}");
    final response = await _manager.postAPICall(ApiUrl.addListing, {
      "lister_name": lister_name,
      "user_id": lister_id,
      "guest_num": guest_num,
      "nid_number": "27346786243878243",
      "bed_num": bed_num,
      "bathroom_num": bathroom_num,
      "listing_title": listing_title,
      "listing_description": listing_description,
      "full_day_price_set_by_user": full_day_price_set_by_user,
      "listing_address": listing_address,
      "zip_code": zip_code,
      "district": district,
      "town": town,
      "allow_short_stay": allow_short_stay.toString(),
      "describe_peaceful": "1",
      "describe_unique": "0",
      "describe_familyfriendly": "1",
      "describe_stylish": "0",
      "describe_central": "1",
      "describe_spacious": "1",
      "listing_type": listing_type,
      "lati": lati,
      "longi": longi,
      "apartments": appartments.toString(),
      "cabin": cabin.toString(),
      "lounge": "0",
      "farm": farm.toString(),
      "campsite": campsite.toString(),
      "hotel": hotel.toString(),
      "bread_breakfast": bread_breakfast.toString(),
      "wifi": wifi.toString(),
      "tv": tv,
      "kitchen": kitchen,
      "washing_machine": washing_machine,
      "free_parking": free_parking,
      "breakfast_included": bread_breakfast,
      "air_condition": air_condition,
      "dedicated_workspace": dedicated_workspace,
      "pool": pool,
      "hot_tub": hot_tub,
      "patio": patio,
      "bbq_grill": bbq_grill,
      "fire_pit": fire_pit,
      "outdooring": fire_pit,
      "gym": gym,
      "beach_lake_access": beach_lake_access,
      "smoke_alarm": smoke_alarm,
      "first_aid": first_aid,
      "fire_extinguish": fire_extinguish,
      "cctv": cctv,
      "indoor_smoking": indoor_smoking ?? "0",
      "party": party ?? "0",
      "pets": pets ?? "0",
      "late_night_entry": late_night_entry ?? "0",
      "unknown_guest_entry": unknown_guest_entry ?? "0",
      "specific_requirement": specific_requirement ?? "0",
    });
    print("add listing response is $response");
    if (response['status'] == true) {
      Get.showSnackbar(Ui.successSnackBar(
          message: response['messege'], title: 'Success'.tr));
    } else if (response['status'] == false) {
      Get.showSnackbar(
          Ui.errorSnackBar(message: response['messege'], title: 'Error'.tr));
    }

    return response;
  }

// "https://jayga.xyz/API/V1/add_listing_images-api.php",
  //listing_id: 43
  // lister_id: 76
  // listing_pictures[]: [choose pic]
  uploadNidImage({
    String? listing_id,
    String? lister_id,
    List<File>? listImages,
  }) async {
    Map<String, String> data = {
      "listing_id": listing_id!,
      "user_id": lister_id!,
    };
    print("my listing id is $listing_id");
    // string to uri"
    var uri = Uri.parse(ApiUrl.addListingNIDImage);

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
//myzoo_2023@asia

    // add file to multipart
    for (int i = 0; i < listImages!.length; i++) {
      print("hlw 1");
      // open a bytestream
      var stream =
          new http.ByteStream(DelegatingStream.typed(listImages[i].openRead()));
      // get file length
      print("hlw 2");
      var length = await listImages[i].length();
      print("hlw 3");
      var multipartFile = new http.MultipartFile(
          'listing_nid[]', stream, length,
          filename: basename(listImages[i].path));
      print("hlw 4");
      request.files.add(multipartFile);
    }

    // if (_image.length > 0) {
    //   for (var i = 0; i < _image.length; i++) {
    //     request.files.add(http.MultipartFile('picture',
    //         File(_image[i].path).readAsBytes().asStream(), File(_image[i].path).lengthSync(),
    //         filename: basename(_image[i].path.split("/").last)));
    //   }

    request.fields.addAll(data);
    request.headers.addAll(
      {
        //'X-Requested-With': 'XMLHttpRequest',
        // "Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
        // 'Content-Type': 'multipart/form-data',

        "Content-Type": "application/json",
        // "Accept": "application/json"

        // "Accept-Encoding": "gzip, deflate, br",
        // "Accept":"*/*",
        // "Connection": "keep-alive"
      },
    );
    // send
    http.Response response =
        await http.Response.fromStream(await request.send());
    print(response.statusCode);
    print(response.body);

    // listen for response
    // response.stream.transform(utf8.decoder).listen((value) {
    //   print("hlw everyone $value");
    //    a = value;
    // });
    // print("hlw sujkkur ${response.stream}");
    var bb = jsonDecode(response.body);
    return bb;
  }

  upload({
    String? listing_id,
    String? lister_id,
    List<File>? listImages,
    File? imageFile,
  }) async {
    Map<String, String> data = {
      "listing_id": listing_id!,
      "lister_id": lister_id!,
    };
    print("my listing id is $listing_id");
    // string to uri"
    var uri = Uri.parse(ApiUrl.addListingImage);

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
//myzoo_2023@asia

    // add file to multipart
    for (int i = 0; i < listImages!.length; i++) {
      print("hlw 1");
      // open a bytestream
      var stream =
          new http.ByteStream(DelegatingStream.typed(listImages[i].openRead()));
      // get file length
      print("hlw 2");
      var length = await listImages[i].length();
      print("hlw 3");
      var multipartFile = new http.MultipartFile(
          'listing_pictures[]', stream, length,
          filename: basename(listImages[i].path));
      print("hlw 4");
      request.files.add(multipartFile);
    }

    // if (_image.length > 0) {
    //   for (var i = 0; i < _image.length; i++) {
    //     request.files.add(http.MultipartFile('picture',
    //         File(_image[i].path).readAsBytes().asStream(), File(_image[i].path).lengthSync(),
    //         filename: basename(_image[i].path.split("/").last)));
    //   }

    request.fields.addAll(data);
    request.headers.addAll(
      {
        //'X-Requested-With': 'XMLHttpRequest',
        // "Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
        // 'Content-Type': 'multipart/form-data',

        "Content-Type": "application/json",
        // "Accept": "application/json"

        // "Accept-Encoding": "gzip, deflate, br",
        // "Accept":"*/*",
        // "Connection": "keep-alive"
      },
    );
    // send
    http.Response response =
        await http.Response.fromStream(await request.send());
    print(response.statusCode);
    print(response.body);

    // listen for response
    // response.stream.transform(utf8.decoder).listen((value) {
    //   print("hlw everyone $value");
    //    a = value;
    // });
    // print("hlw sujkkur ${response.stream}");
    var bb = jsonDecode(response.body);
    return bb;
  }

  uploadUserImage({
    String? userID,
    List<File>? listImages,
    File? imageFile,
  }) async {
    Map<String, String> data = {
      "user_id": userID!,
    };
     print("uploading user image________________________");
    // string to uri"
    var uri = Uri.parse(ApiUrl.addUserImage);

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
//myzoo_2023@asia

    // add file to multipart
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile!.openRead()));
    // get file length
    print("hlw 2");
    var length = await imageFile!.length();
    var multipartFile = new http.MultipartFile('photo', stream, length,
        filename: basename(imageFile.path));
    print("hlw 4");
    request.files.add(multipartFile);
    // if (_image.length > 0) {
    //   for (var i = 0; i < _image.length; i++) {
    //     request.files.add(http.MultipartFile('picture',
    //         File(_image[i].path).readAsBytes().asStream(), File(_image[i].path).lengthSync(),
    //         filename: basename(_image[i].path.split("/").last)));
    //   }

    request.fields.addAll(data);
    request.headers.addAll(
      {
        //'X-Requested-With': 'XMLHttpRequest',
        // "Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
        // 'Content-Type': 'multipart/form-data',

        "Content-Type": "application/json",
        // "Accept": "application/json"

        // "Accept-Encoding": "gzip, deflate, br",
        // "Accept":"*/*",
        // "Connection": "keep-alive"
      },
    );
    // send
    http.Response response =
        await http.Response.fromStream(await request.send());
    print(response.statusCode);
    print(response.body);

    // listen for response
    // response.stream.transform(utf8.decoder).listen((value) {
    //   print("hlw everyone $value");
    //    a = value;
    // });
    // print("hlw sujkkur ${response.stream}");
    var bb = jsonDecode(response.body);
    return bb;
  }
  //
  Future<GetUserImage> getUserImage({
    id,
  }) async {
    APIManager _manager = APIManager();

    final response = await _manager.get(ApiUrl.getUserImage + id,
    );
    print("get cover image $response");
    if (response['status'] == true) {
    } else if (response['status'] == false) {}

    return GetUserImage.fromJson(response);
  }
  //
  Future<GetCoverImage> getCoverImage({
    id,
  }) async {
    APIManager _manager = APIManager();

    final response = await _manager.get(ApiUrl.getCoverImage + id,
    );
    print("get cover image $response");
    if (response['status'] == true) {
    } else if (response['status'] == false) {}

    return GetCoverImage.fromJson(response);
  }
// cover photo
  uploadUserCoverImage({
    String? userID,
    List<File>? listImages,
    File? imageFile,
  }) async {
    Map<String, String> data = {
      "user_id": userID!,
    };
    print("uploading user image________________________");
    // string to uri"
    var uri = Uri.parse(ApiUrl.addCoverPhoto);

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
//myzoo_2023@asia

    // add file to multipart
    var stream =
    new http.ByteStream(DelegatingStream.typed(imageFile!.openRead()));
    // get file length
    print("hlw 2");
    var length = await imageFile!.length();
    var multipartFile = new http.MultipartFile('photo', stream, length,
        filename: basename(imageFile.path));
    print("hlw 4");
    request.files.add(multipartFile);
    // if (_image.length > 0) {
    //   for (var i = 0; i < _image.length; i++) {
    //     request.files.add(http.MultipartFile('picture',
    //         File(_image[i].path).readAsBytes().asStream(), File(_image[i].path).lengthSync(),
    //         filename: basename(_image[i].path.split("/").last)));
    //   }

    request.fields.addAll(data);
    request.headers.addAll(
      {
        //'X-Requested-With': 'XMLHttpRequest',
        // "Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
        // 'Content-Type': 'multipart/form-data',

        "Content-Type": "application/json",
        // "Accept": "application/json"

        // "Accept-Encoding": "gzip, deflate, br",
        // "Accept":"*/*",
        // "Connection": "keep-alive"
      },
    );
    // send
    http.Response response =
    await http.Response.fromStream(await request.send());
    print(response.statusCode);
    print(response.body);

    // listen for response
    // response.stream.transform(utf8.decoder).listen((value) {
    //   print("hlw everyone $value");
    //    a = value;
    // });
    // print("hlw sujkkur ${response.stream}");
    var bb = jsonDecode(response.body);
    return bb;
  }
}
