import 'package:get/get.dart';
import 'package:jayga/models/get_review_model.dart';
import 'package:jayga/models/listing_model.dart';
import 'package:jayga/models/make_booking_res_model.dart';

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
        "date_enter":"2023-08-18",
        "date_exit":"2023-08-20",

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

}
