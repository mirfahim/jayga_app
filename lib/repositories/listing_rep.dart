import 'package:get/get.dart';
import 'package:jayga/models/get_review_model.dart';
import 'package:jayga/models/listing/filtered_listing_model.dart';
import 'package:jayga/models/listing_model.dart';
import 'package:jayga/models/make_booking_res_model.dart';
import 'package:jayga/models/profile/profile_model.dart';
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
  Future<FilteredListingModel> filteredListing({
    String? guestNo,
    String? bedNo,
    String? district,
    String? town,
    String? allow_short_stay,
  }) async {
    APIManager _manager = APIManager();
    final response = await _manager.get(
        "https://new.jayga.xyz/api/filter-listings",

    );
    print("filtered response is $response");

    return FilteredListingModel.fromJson(response);
  }
  Future<ProfileModel> getProfile(id) async {
    APIManager _manager = APIManager();
    final response = await _manager.get(
        "${ApiUrl.getProfile}$id",

    );
    print("login response is $response");

    return ProfileModel.fromJson(response);
  }

  editProfile({
    String? user_id,
    String? lister_id,


  }) async {

    Map<String, String> data =
    {
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
    var uri = Uri.parse(ApiUrl.updateProfile,);

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
  Future<BookingHistoryModel> bookingHistory(id) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(
        "https://jayga.xyz/API/V1/booking_history-api.php", {"user_id": id});
    print("login response is $response");

    return BookingHistoryModel.fromJson(response);
  }

  Future<List<GetReviewModel>> getReviewRep(id) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(
        "https://jayga.xyz/API/V1/get_review-api.php",
        {"user_id": "20230813_112222_7479"});
    print("login response is $response");
    return List.from(response.map((item) => GetReviewModel.fromJson(item)));

    //return response;
  }
  editProfileRep({String? userId}) async {
    APIManager _manager = APIManager();
    try{
      final response = await _manager
          .postAPICall("https://new.jayga.xyz/api/user/edit", {
        "user_id": "1",
        "user_name": "mirff101",
        "user_email": "mir@gamil.com",
        "phone": "02783084390",
        "user_nid": "34132431",
        "user_dob": "1998-04-27",
        "user_address": "jessore",
        "is_lister": "1",
      },
      header: {});
      print("profile edit is $response");
      return response;
    }catch(e){
      print("error is $e");
      final response = await _manager
          .postAPICall(ApiUrl.updateProfile, {
        "user_id": "1",
        "user_name": "mir101",
        "user_email": "mir@gamil.com",
        "phone": "02783084390",
        "user_nid": "34132431",
        "user_dob": "1998-04-27",
        "user_address": "jessore",
        "is_lister": "1",
      });
      print("profile edit is $response");
      return response;
    }

  }
  Future getPaymentUrl() async {
    APIManager _manager = APIManager();
    final response = await _manager
        .postAPICall("https://jayga.xyz/API/V1/ssl_payment-api.php", {});
    print("login response is $response");
    return response;

    //return response;
  }

  Future<MakeBookingResponseModel> makeBooking() async {
    APIManager _manager = APIManager();
    final response = await _manager
        .postAPICall("https://jayga.xyz/API/V1/create_booking-api.php", {
      "user_id": "20230813_112222_7479",
      "lister_id": "74",
      "listing_id": "36",
      "date_enter": "2023-10-18",
      "date_exit": "2023-10-20",
      "short_stay_flag": "0",
      "time_id": "0",
      "all_day_flag": "1"
    });
    print("make booking response is $response");
    return MakeBookingResponseModel.fromJson(response);
  }

  Future makeReview({userID, listerId, listingId, review}) async {
    APIManager _manager = APIManager();
    final response = await _manager
        .postAPICall("https://jayga.xyz/API/V1/create_review-api.php", {
      "user_id": "20230813_112222_7479",
      "lister_id": "74",
      "listing_id": "36",
      "stars": "3",
      "review": "good app",
    });
    print("make booking response is $response");

    return response;
  }

  Future addListingRep(
      {lister_id,
      lister_name,
      guest_num,
      nid_number,
      bed_num,
      bathroom_num,
      listing_title,
      listing_description,
      full_day_price_set_by_user,
      listing_address,
      zip_code,
      district,
      town,
      allow_short_stay,
      describe_peaceful,
      describe_unique,
      describe_familyfriendly,
      describe_stylish,
      describe_central,
      describe_spacious,
      listing_type,
      lati,
      longi,
      appartments,
      cabin,
      lounge,
      farm,
      campsite,
      hotel,
      bread_breakfast,
      wifi,
      tv,
      kitchen,
      washing_machine,
      free_parking,
      breakfast_included,
      air_condition,
      dedicated_workspace,
      pool,
      hot_tub,
      patio,
      bbq_grill,
      fire_pit,
      gym,
      beach_lake_access,
      smoke_alarm,
      first_aid,
      fire_extinguish,
      cctv}) async {
    APIManager _manager = APIManager();
    print("api is ${ApiUrl.addListing}");
    final response = await _manager
        .postAPICall(ApiUrl.addListing, {

      "lister_name": "fahim22",
      "lister_id": "2",
      "guest_num": "4",
      "nid_number": "27346786243878243",
      "bed_num": "2",
      "bathroom_num": "2",
      "listing_title": "House apartment 3",
      "listing_description": "App Is working",
      "full_day_price_set_by_user": "2700.00",
      "listing_address": "123 Forest Lane",
      "zip_code": "12345",
      "district": "Mountain District",
      "town": "Pineville",
      "allow_short_stay": "1",
      "describe_peaceful": "1",
      "describe_unique": "0",
      "describe_familyfriendly": "1",
      "describe_stylish": "0",
      "describe_central": "1",
      "describe_spacious": "1",
      "listing_type": "Cabin",
      "lati": "40.1234856",
      "longi": "74.1283456",
      "apartments": "0",
      "cabin": "1",
      "lounge": "0",
      "farm": "0",
      "campsite": "0",
      "hotel": "0",
      "bread_breakfast": "1",
      "wifi": "1",
      "tv": "1",
      "kitchen": "1",
      "washing_machine": "1",
      "free_parking": "1",
      "breakfast_included": "1",
      "air_condition": "0",
      "dedicated_workspace": "1",
      "pool": "1",
      "hot_tub": "0",
      "patio": "1",
      "bbq_grill": '1',
      "fire_pit": "1",
      "outdooring":"0",
      "gym": "0",
      "beach_lake_access": "1",
      "smoke_alarm": '1',
      "first_aid": "1",
      "fire_extinguish": '0',
      "cctv": "0",
      "indoor_smoking":"0",
      "party":"1",
      "pets":"0",
      "late_night_entry":"0",
      "unknown_guest_entry":"0",
      "specific_requirement":"0",
    });
    print("add listing response is $response");
    return response;
  }

// "https://jayga.xyz/API/V1/add_listing_images-api.php",
  //listing_id: 43
  // lister_id: 76
  // listing_pictures[]: [choose pic]
  upload({
    String? listing_id,
    String? lister_id,
    List<File>? listImages,
    File? imageFile,
  }) async {
    Map<String, String> data = {
      "listing_id": listing_id!,
      "lister_id": "76",
    };

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

    // string to uri"
    var uri = Uri.parse(ApiUrl.addListingImage);

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
    var multipartFile = new http.MultipartFile(
        'photo', stream, length,
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
