import 'dart:convert';

import 'package:get/get.dart';

import '../../api_provider/api_provider.dart';
import '../../api_provider/api_url.dart';
import '../../services/auth_services.dart';


class AuthRepository {
  Future userLogin(String mobile) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(
      "https://jayga.xyz/API/V1/login-api.php?phone_number=$mobile",
      {'email': mobile, },
    );
    print("login response is $response");

    return response;
  }

  Future registerRep(String name, String email, String dob, String token) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(
      "https://jayga.xyz/API/V1/register-api.php",
      {'acc_token': token,
        'user_name': "email",
        'user_email': "email",
        'user_dob': "dob",
      },
    );
    print("login response is $response");

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
