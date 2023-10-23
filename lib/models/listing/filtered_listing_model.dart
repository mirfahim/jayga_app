// To parse this JSON data, do
//
//     final filteredListingModel = filteredListingModelFromJson(jsonString);

import 'dart:convert';

FilteredListingModel filteredListingModelFromJson(String str) => FilteredListingModel.fromJson(json.decode(str));

String filteredListingModelToJson(FilteredListingModel data) => json.encode(data.toJson());

class FilteredListingModel {
  int status;
  List<FilteredListing> filteredListing;

  FilteredListingModel({
    required this.status,
    required this.filteredListing,
  });

  factory FilteredListingModel.fromJson(Map<String, dynamic> json) => FilteredListingModel(
    status: json["status"],
    filteredListing: List<FilteredListing>.from(json["filtered_listing"].map((x) => FilteredListing.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "filtered_listing": List<dynamic>.from(filteredListing.map((x) => x.toJson())),
  };
}

class FilteredListing {
  String listingId;
  String listerId;
  String listerName;
  dynamic nidNumber;
  String guestNum;
  String bedNum;
  String bathroomNum;
  String listingTitle;
  String listingDescription;
  String fullDayPriceSetByUser;
  String listingAddress;
  String district;
  String town;
  String zipCode;
  String allowShortStay;
  String describePeaceful;
  String describeUnique;
  String describeFamilyfriendly;
  String describeStylish;
  String describeCentral;
  String describeSpacious;
  String privateBathroom;
  String doorLock;
  String breakfastIncluded;
  String unknownGuestEntry;
  String listingType;
  dynamic lat;
  dynamic long;
  String isApproved;
  DateTime createdAt;
  DateTime updatedAt;
  List<Image> images;

  FilteredListing({
    required this.listingId,
    required this.listerId,
    required this.listerName,
    required this.nidNumber,
    required this.guestNum,
    required this.bedNum,
    required this.bathroomNum,
    required this.listingTitle,
    required this.listingDescription,
    required this.fullDayPriceSetByUser,
    required this.listingAddress,
    required this.district,
    required this.town,
    required this.zipCode,
    required this.allowShortStay,
    required this.describePeaceful,
    required this.describeUnique,
    required this.describeFamilyfriendly,
    required this.describeStylish,
    required this.describeCentral,
    required this.describeSpacious,
    required this.privateBathroom,
    required this.doorLock,
    required this.breakfastIncluded,
    required this.unknownGuestEntry,
    required this.listingType,
    required this.lat,
    required this.long,
    required this.isApproved,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
  });

  factory FilteredListing.fromJson(Map<String, dynamic> json) => FilteredListing(
    listingId: json["listing_id"],
    listerId: json["lister_id"]??"0",
    listerName: json["lister_name"],
    nidNumber: json["nid_number"],
    guestNum: json["guest_num"],
    bedNum: json["bed_num"],
    bathroomNum: json["bathroom_num"],
    listingTitle: json["listing_title"],
    listingDescription: json["listing_description"],
    fullDayPriceSetByUser: json["full_day_price_set_by_user"],
    listingAddress: json["listing_address"],
    district: json["district"],
    town: json["town"],
    zipCode: json["zip_code"],
    allowShortStay: json["allow_short_stay"],
    describePeaceful: json["describe_peaceful"],
    describeUnique: json["describe_unique"],
    describeFamilyfriendly: json["describe_familyfriendly"],
    describeStylish: json["describe_stylish"],
    describeCentral: json["describe_central"],
    describeSpacious: json["describe_spacious"],
    privateBathroom: json["private_bathroom"],
    doorLock: json["door_lock"],
    breakfastIncluded: json["breakfast_included"],
    unknownGuestEntry: json["unknown_guest_entry"],
    listingType: json["listing_type"],
    lat: json["lat"],
    long: json["long"],
    isApproved: json["isApproved"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "listing_id": listingId,
    "lister_id": listerId,
    "lister_name": listerName,
    "nid_number": nidNumber,
    "guest_num": guestNum,
    "bed_num": bedNum,
    "bathroom_num": bathroomNum,
    "listing_title": listingTitle,
    "listing_description": listingDescription,
    "full_day_price_set_by_user": fullDayPriceSetByUser,
    "listing_address": listingAddress,
    "district": district,
    "town": town,
    "zip_code": zipCode,
    "allow_short_stay": allowShortStay,
    "describe_peaceful": describePeaceful,
    "describe_unique": describeUnique,
    "describe_familyfriendly": describeFamilyfriendly,
    "describe_stylish": describeStylish,
    "describe_central": describeCentral,
    "describe_spacious": describeSpacious,
    "private_bathroom": privateBathroom,
    "door_lock": doorLock,
    "breakfast_included": breakfastIncluded,
    "unknown_guest_entry": unknownGuestEntry,
    "listing_type": listingType,
    "lat": lat,
    "long": long,
    "isApproved": isApproved,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class Image {
  String listingImgId;
  String listingId;
  String listerId;
  String listingFilename;
  String listingTargetlocation;
  DateTime createdAt;
  DateTime updatedAt;

  Image({
    required this.listingImgId,
    required this.listingId,
    required this.listerId,
    required this.listingFilename,
    required this.listingTargetlocation,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    listingImgId: json["listing_img_id"],
    listingId: json["listing_id"],
    listerId: json["lister_id"],
    listingFilename: json["listing_filename"],
    listingTargetlocation: json["listing_targetlocation"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "listing_img_id": listingImgId,
    "listing_id": listingId,
    "lister_id": listerId,
    "listing_filename": listingFilename,
    "listing_targetlocation": listingTargetlocation,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
