// To parse this JSON data, do
//
//     final getReviewModel = getReviewModelFromJson(jsonString);

import 'dart:convert';

GetReviewModel getReviewModelFromJson(String str) => GetReviewModel.fromJson(json.decode(str));

String getReviewModelToJson(GetReviewModel data) => json.encode(data.toJson());

class GetReviewModel {
  int? status;
  int? averageRating;
  List<Review>? reviews;

  GetReviewModel({
     this.status,
     this.averageRating,
     this.reviews,
  });

  factory GetReviewModel.fromJson(Map<String, dynamic> json) => GetReviewModel(
    status: json["status"],
    averageRating: json["average_rating"],
    reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "average_rating": averageRating,
    "reviews": List<dynamic>.from(reviews!.map((x) => x.toJson())),
  };
}

class Review {
  String reviewId;
  String userId;
  String userName;
  String listingId;
  dynamic listerId;
  dynamic listerName;
  String stars;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  Review({
    required this.reviewId,
    required this.userId,
    required this.userName,
    required this.listingId,
    required this.listerId,
    required this.listerName,
    required this.stars,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    reviewId: json["review_id"],
    userId: json["user_id"],
    userName: json["user_name"],
    listingId: json["listing_id"],
    listerId: json["lister_id"],
    listerName: json["lister_name"],
    stars: json["stars"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "review_id": reviewId,
    "user_id": userId,
    "user_name": userName,
    "listing_id": listingId,
    "lister_id": listerId,
    "lister_name": listerName,
    "stars": stars,
    "description": description,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
