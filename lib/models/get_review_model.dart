// To parse this JSON data, do
//
//     final getReviewModel = getReviewModelFromJson(jsonString);

import 'dart:convert';

List<GetReviewModel> getReviewModelFromJson(String str) => List<GetReviewModel>.from(json.decode(str).map((x) => GetReviewModel.fromJson(x)));

String getReviewModelToJson(List<GetReviewModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetReviewModel {
  String reviewId;
  String userId;
  String listingId;
  String listerId;
  String listerName;
  String stars;
  String description;

  GetReviewModel({
    required this.reviewId,
    required this.userId,
    required this.listingId,
    required this.listerId,
    required this.listerName,
    required this.stars,
    required this.description,
  });

  factory GetReviewModel.fromJson(Map<String, dynamic> json) => GetReviewModel(
    reviewId: json["review_id"],
    userId: json["user_id"],
    listingId: json["listing_id"],
    listerId: json["lister_id"],
    listerName: json["lister_name"],
    stars: json["stars"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "review_id": reviewId,
    "user_id": userId,
    "listing_id": listingId,
    "lister_id": listerId,
    "lister_name": listerName,
    "stars": stars,
    "description": description,
  };
}
