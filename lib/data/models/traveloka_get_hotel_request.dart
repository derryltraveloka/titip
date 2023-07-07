import 'dart:convert';

class TravelokaGetHotelRequest {
  final Hotels? hotels;

  TravelokaGetHotelRequest({
    this.hotels,
  });

  factory TravelokaGetHotelRequest.fromRawJson(String str) => TravelokaGetHotelRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TravelokaGetHotelRequest.fromJson(Map<String, dynamic> json) => TravelokaGetHotelRequest(
    hotels: json["hotels"] == null ? null : Hotels.fromJson(json["hotels"]),
  );

  Map<String, dynamic> toJson() => {
    "hotels": hotels?.toJson(),
  };
}

class Hotels {
  final String? name;

  Hotels({
    this.name,
  });

  factory Hotels.fromRawJson(String str) => Hotels.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Hotels.fromJson(Map<String, dynamic> json) => Hotels(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
