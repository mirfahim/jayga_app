// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String? status;
  String? messege;
  User? user;

  LoginModel({
     this.status,
     this.messege,
     this.user,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    messege: json["messege"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "messege": messege,
    "user": user!.toJson(),
  };
}

class User {
  int userId;
  String phone;
  String authToken;

  User({
    required this.userId,
    required this.phone,
    required this.authToken,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["user_id"],
    phone: json["phone"],
    authToken: json["authToken"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "phone": phone,
    "authToken": authToken,
  };
}
