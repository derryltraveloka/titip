import 'dart:convert';

import 'package:titip_itinerary_planner/domain/entities/processed_hotel.dart';
import 'package:titip_itinerary_planner/common/constant.dart';

class TravelokaGetHotelResponse {
  final String? id;
  final dynamic placeId;
  final String? type;
  final String? name;
  final dynamic numberOfHotel;
  final String? numHotels;
  final String? targetUrl;
  final dynamic landmarkType;
  final String? accommodationType;
  final GeoLocation? geoLocation;
  final String? matchingScore;
  final bool? searchByFormerlyName;
  final String? localeDisplayType;
  final String? displayName;
  final String? globalName;
  final String? additionalInfo;
  final dynamic distance;
  final String? description;
  final dynamic price;
  final String? photo;
  final dynamic review;

  TravelokaGetHotelResponse({
    this.id,
    this.placeId,
    this.type,
    this.name,
    this.numberOfHotel,
    this.numHotels,
    this.targetUrl,
    this.landmarkType,
    this.accommodationType,
    this.geoLocation,
    this.matchingScore,
    this.searchByFormerlyName,
    this.localeDisplayType,
    this.displayName,
    this.globalName,
    this.additionalInfo,
    this.distance,
    this.description,
    this.price,
    this.photo,
    this.review,
  });

  factory TravelokaGetHotelResponse.fromRawJson(String str) =>
      TravelokaGetHotelResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TravelokaGetHotelResponse.fromJson(Map<String, dynamic> json) =>
      TravelokaGetHotelResponse(
        id: json["id"],
        placeId: json["placeId"],
        type: json["type"],
        name: json["name"],
        numberOfHotel: json["numberOfHotel"],
        numHotels: json["numHotels"],
        targetUrl: json["targetUrl"],
        landmarkType: json["landmarkType"],
        accommodationType: json["accommodationType"],
        geoLocation: json["geoLocation"] == null
            ? null
            : GeoLocation.fromJson(json["geoLocation"]),
        matchingScore: json["matchingScore"],
        searchByFormerlyName: json["searchByFormerlyName"],
        localeDisplayType: json["localeDisplayType"],
        displayName: json["displayName"],
        globalName: json["globalName"],
        additionalInfo: json["additionalInfo"],
        distance: json["distance"],
        description: json["description"],
        price: json["price"],
        photo: json["photo"],
        review: json["review"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "placeId": placeId,
        "type": type,
        "name": name,
        "numberOfHotel": numberOfHotel,
        "numHotels": numHotels,
        "targetUrl": targetUrl,
        "landmarkType": landmarkType,
        "accommodationType": accommodationType,
        "geoLocation": geoLocation?.toJson(),
        "matchingScore": matchingScore,
        "searchByFormerlyName": searchByFormerlyName,
        "localeDisplayType": localeDisplayType,
        "displayName": displayName,
        "globalName": globalName,
        "additionalInfo": additionalInfo,
        "distance": distance,
        "description": description,
        "price": price,
        "photo": photo,
        "review": review,
      };

  ProcessedHotel toEntity() {
    return ProcessedHotel(
        targetUrl: "$HOTEL_LEADING_URL/$targetUrl",
        regionName: additionalInfo,
        imageUrl: photo,
        hotelName: displayName,
        description: description);
  }
}

class GeoLocation {
  final String? lon;
  final String? lat;
  final bool? valid;

  GeoLocation({
    this.lon,
    this.lat,
    this.valid,
  });

  factory GeoLocation.fromRawJson(String str) =>
      GeoLocation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GeoLocation.fromJson(Map<String, dynamic> json) => GeoLocation(
        lon: json["lon"],
        lat: json["lat"],
        valid: json["valid"],
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
        "valid": valid,
      };
}
