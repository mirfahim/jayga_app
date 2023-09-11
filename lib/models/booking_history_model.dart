// To parse this JSON data, do
//
//     final bookingHistoryModel = bookingHistoryModelFromJson(jsonString);

import 'dart:convert';

BookingHistoryModel bookingHistoryModelFromJson(String str) => BookingHistoryModel.fromJson(json.decode(str));

String bookingHistoryModelToJson(BookingHistoryModel data) => json.encode(data.toJson());

class BookingHistoryModel {
  List<BookingHistory> bookings;

  BookingHistoryModel({
    required this.bookings,
  });

  factory BookingHistoryModel.fromJson(Map<String, dynamic> json) => BookingHistoryModel(
    bookings: List<BookingHistory>.from(json["bookings"].map((x) => BookingHistory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "bookings": List<dynamic>.from(bookings.map((x) => x.toJson())),
  };
}

class BookingHistory {
  String bookingId;
  String userId;
  String listingId;
  String listerId;
  dynamic timeFlag;
  dynamic timeId;
  dynamic allDayFlag;
  String daysStayed;
  DateTime dateEnter;
  DateTime dateExit;
  dynamic payAmount;
  dynamic paymentFlag;
  ListingHistory listing;
  List<Image> images;

  BookingHistory({
    required this.bookingId,
    required this.userId,
    required this.listingId,
    required this.listerId,
    required this.timeFlag,
    required this.timeId,
    required this.allDayFlag,
    required this.daysStayed,
    required this.dateEnter,
    required this.dateExit,
    required this.payAmount,
    required this.paymentFlag,
    required this.listing,
    required this.images,
  });

  factory BookingHistory.fromJson(Map<String, dynamic> json) => BookingHistory(
    bookingId: json["booking_id"],
    userId: json["user_id"],
    listingId: json["listing_id"],
    listerId: json["lister_id"],
    timeFlag: json["time_flag"],
    timeId: json["time_id"],
    allDayFlag: json["all_day_flag"],
    daysStayed: json["days_stayed"],
    dateEnter: DateTime.parse(json["date_enter"]),
    dateExit: DateTime.parse(json["date_exit"]),
    payAmount: json["pay_amount"],
    paymentFlag: json["payment_flag"],
    listing: ListingHistory.fromJson(json["listing"]),
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "booking_id": bookingId,
    "user_id": userId,
    "listing_id": listingId,
    "lister_id": listerId,
    "time_flag": timeFlag,
    "time_id": timeId,
    "all_day_flag": allDayFlag,
    "days_stayed": daysStayed,
    "date_enter": "${dateEnter.year.toString().padLeft(4, '0')}-${dateEnter.month.toString().padLeft(2, '0')}-${dateEnter.day.toString().padLeft(2, '0')}",
    "date_exit": "${dateExit.year.toString().padLeft(4, '0')}-${dateExit.month.toString().padLeft(2, '0')}-${dateExit.day.toString().padLeft(2, '0')}",
    "pay_amount": payAmount,
    "payment_flag": paymentFlag,
    "listing": listing.toJson(),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class Image {
  String listingFilename;

  Image({
    required this.listingFilename,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    listingFilename: json["listing_filename"],
  );

  Map<String, dynamic> toJson() => {
    "listing_filename": listingFilename,
  };
}

class ListingHistory {
  String listingId;
  String listerId;
  String listerName;
  String guestNum;
  String bedNum;
  String bathroomNum;
  String listingTitle;
  String listingDescription;
  String fullDayPriceSetByUser;
  String listingAddress;
  String zipCode;
  String district;
  String town;
  String allowShortStay;
  String describePeaceful;
  String describeUnique;
  String describeFamilyfriendly;
  String describeStylish;
  String describeCentral;
  String describeSpacious;
  String bathroomPrivate;
  String breakfastAvailability;
  String roomLock;
  String whoElseMightBeThere;
  String listingType;
  dynamic lati;
  dynamic longi;

  ListingHistory({
    required this.listingId,
    required this.listerId,
    required this.listerName,
    required this.guestNum,
    required this.bedNum,
    required this.bathroomNum,
    required this.listingTitle,
    required this.listingDescription,
    required this.fullDayPriceSetByUser,
    required this.listingAddress,
    required this.zipCode,
    required this.district,
    required this.town,
    required this.allowShortStay,
    required this.describePeaceful,
    required this.describeUnique,
    required this.describeFamilyfriendly,
    required this.describeStylish,
    required this.describeCentral,
    required this.describeSpacious,
    required this.bathroomPrivate,
    required this.breakfastAvailability,
    required this.roomLock,
    required this.whoElseMightBeThere,
    required this.listingType,
    required this.lati,
    required this.longi,
  });

  factory ListingHistory.fromJson(Map<String, dynamic> json) => ListingHistory(
    listingId: json["listing_id"],
    listerId: json["lister_id"],
    listerName: json["lister_name"],
    guestNum: json["guest_num"],
    bedNum: json["bed_num"],
    bathroomNum: json["bathroom_num"],
    listingTitle: json["listing_title"],
    listingDescription: json["listing_description"],
    fullDayPriceSetByUser: json["full_day_price_set_by_user"],
    listingAddress: json["listing_address"],
    zipCode: json["zip_code"],
    district: json["district"],
    town: json["town"],
    allowShortStay: json["allow_short_stay"],
    describePeaceful: json["describe_peaceful"],
    describeUnique: json["describe_unique"],
    describeFamilyfriendly: json["describe_familyfriendly"],
    describeStylish: json["describe_stylish"],
    describeCentral: json["describe_central"],
    describeSpacious: json["describe_spacious"],
    bathroomPrivate: json["bathroom_private"] ?? "No data",
    breakfastAvailability: json["breakfast_availability"] ?? "No Data",
    roomLock: json["room_lock"] ?? "No data",
    whoElseMightBeThere: json["who_else_might_be_there"] ?? "No Data",
    listingType: json["listing_type"] ?? "No Data",
    lati: json["lati"],
    longi: json["longi"],
  );

  Map<String, dynamic> toJson() => {
    "listing_id": listingId,
    "lister_id": listerId,
    "lister_name": listerName,
    "guest_num": guestNum,
    "bed_num": bedNum,
    "bathroom_num": bathroomNum,
    "listing_title": listingTitle,
    "listing_description": listingDescription,
    "full_day_price_set_by_user": fullDayPriceSetByUser,
    "listing_address": listingAddress,
    "zip_code": zipCode,
    "district": district,
    "town": town,
    "allow_short_stay": allowShortStay,
    "describe_peaceful": describePeaceful,
    "describe_unique": describeUnique,
    "describe_familyfriendly": describeFamilyfriendly,
    "describe_stylish": describeStylish,
    "describe_central": describeCentral,
    "describe_spacious": describeSpacious,
    "bathroom_private": bathroomPrivate,
    "breakfast_availability": breakfastAvailability,
    "room_lock": roomLock,
    "who_else_might_be_there": whoElseMightBeThere,
    "listing_type": listingType,
    "lati": lati,
    "longi": longi,
  };
}
