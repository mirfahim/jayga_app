import 'dart:convert';

import 'package:get/get.dart';

import '../../api_provider/api_provider.dart';
import '../../api_provider/api_url.dart';
import '../../services/auth_services.dart';


class AuthRepository {
  Future userLogin(String mobile, String fcm) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(
      ApiUrl.login,
      {'phone': mobile, 'FCM_token': fcm, "is_lister": "0" },
    );
    print("login response is $response");

    return response;
  }

  Future registerRep(
      {String? name, String? email, String? dob, String? phone}) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(
      ApiUrl.register,
      {'user_name': name,
        'user_email': email,
        'phone': phone,
        'user_dob': dob,
        "is_lister":"0",

      },
    );
    print("register response is $response");

    return response;
  }
  Future sendOtpWithMuthoFun(String phone, String otp) async {
    print("otp started working");
    APIManager _manager = APIManager();
    Map body =  {
      "sender_id": "8809601010510",
      "receiver": phone,
      "message": otp,
      "remove_duplicate": "true",
    };
    final response = await _manager.postAPICallWithHeader(
      "https://sysadmin.muthobarta.com/api/v1/send-sms",

        {
          "sender_id": "8809601010510",
          "receiver": phone,
          "message": otp,
          "remove_duplicate": "true",
        },

      {
        "Authorization": "Token d275d614a4ca92e21d2dea7a1e2bb81fbfac1eb0",
        'content-type': 'application/json'
        //"X-Content-Type-Options": "nosniff",
       // "Referrer-Policy": "same-origin"

      }
    );
    print("otp response is $response");

    return response;
  }

}
