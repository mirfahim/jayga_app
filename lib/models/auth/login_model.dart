// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String? status;
  String? message;
  User? user;

  LoginModel({
     this.status,
     this.message,
     this.user,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    message: json["message"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "user": user!.toJson(),
  };
}

class User {
  String? userId;
  String? userPhoneNum;
  String? otp;
  String? accToken;

  User({
     this.userId,
     this.userPhoneNum,
     this.otp,
     this.accToken,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["user_id"],
    userPhoneNum: json["user_phone_num"],
    otp: json["otp"],
    accToken: json["acc_token"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "user_phone_num": userPhoneNum,
    "otp": otp,
    "acc_token": accToken,
  };
}
