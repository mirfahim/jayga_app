import 'package:get/get.dart';
import 'package:jayga/models/get_review_model.dart';
import 'package:jayga/models/listing_model.dart';
import 'package:jayga/models/make_booking_res_model.dart';
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

  Future<BookingHistoryModel> bookingHistory(id) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(
      "https://jayga.xyz/API/V1/booking_history-api.php",
      {"user_id": id}

    );
    print("login response is $response");

    return BookingHistoryModel.fromJson(response);
  }
   Future<List<GetReviewModel>> getReviewRep(id) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(
        "https://jayga.xyz/API/V1/get_review-api.php",
        {"user_id": "20230813_112222_7479"}

    );
    print("login response is $response");
    return List.from(response.map((item) => GetReviewModel.fromJson(item)));

    //return response;
  }

  Future<MakeBookingResponseModel> makeBooking() async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(
      "https://jayga.xyz/API/V1/booking-api.php",
      {
        "user_id": "20230813_112222_7479",
        "lister_id": "74",
        "listing_id":"36",
        "date_enter":"2023-09-18",
        "date_exit":"2023-09-20",

      }

    );
    print("make booking response is $response");
    return MakeBookingResponseModel.fromJson(response);
  }

  Future makeReview({userID, listerId, listingId, review}) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(
        "https://jayga.xyz/API/V1/create_review-api.php",
        {
          "user_id": "20230813_112222_7479",
          "lister_id": "74",
          "listing_id":"36",
          "stars":"3",
          "review":"good app",

        }

    );
    print("make booking response is $response");

    return response;
  }

  Future addListingRep() async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(
        "https://jayga.xyz/API/V1/add_listing-api.php",
        {
          "lister_id": "76",
          "lister_name": "Atifa karim",
          "guest_num": "4",
          "bed_num": "2",
          "bathroom_num": "2",
          "listing_title": "Cozy Mountain Cabin",
          "listing_description": "Listing added from app",
          "full_day_price_set_by_user": "3000.00",
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
          "lati": "40.123456",
          "longi": "-74.123456",
          "appartments": "0",
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
          "fire_pit": "0",
          "gym": "0",
          "beach_lake_access": "1",
          "smoke_alarm": '1',
          "first_aid": "1",
          "fire_extinguish": '0',
          "cctv": "0"

        }

    );
    print("add listing response is $response");
    return response;
  }
// "https://jayga.xyz/API/V1/add_listing_images-api.php",
  //listing_id: 43
  // lister_id: 76
  // listing_pictures[]: [choose pic]
  upload(
      {
        String? listing_id,
        String? lister_id,
        List<File>? listImages,

        File?  imageFile,



      }) async {

    Map<String, String> data = {
      "listing_id": "48",
      "lister_id": "76",
    };


    // string to uri"
    var uri = Uri.parse("https://jayga.xyz/API/V1/add_listing_images-api.php");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
//myzoo_2023@asia

    // add file to multipart
    for (int i = 0; i < listImages!.length; i++) {
      print("hlw 1");
      // open a bytestream
      var stream = new http.ByteStream(DelegatingStream.typed(listImages[i].openRead()));
      // get file length
      print("hlw 2");
      var length = await listImages[i].length();
      print("hlw 3");
      var multipartFile = new http.MultipartFile('listing_pictures[]', stream, length,
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
    request.headers.addAll(  {
      //'X-Requested-With': 'XMLHttpRequest',
     // "Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
      // 'Content-Type': 'multipart/form-data',

      "Content-Type": "application/json",
      // "Accept": "application/json"

      // "Accept-Encoding": "gzip, deflate, br",
      // "Accept":"*/*",
      // "Connection": "keep-alive"


    },);
    // send
    http.Response response = await http.Response.fromStream(await request.send());
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
