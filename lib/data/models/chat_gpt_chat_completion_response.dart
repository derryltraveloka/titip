// To parse this JSON data, do

import 'dart:convert';

class ChatGptChatCompletionResponse {
  final String? message;
  final List<RecommendedHotel>? recommendedHotels;
  final String? trailingMessage;

  ChatGptChatCompletionResponse({
    this.message,
    this.recommendedHotels,
    this.trailingMessage,
  });

  factory ChatGptChatCompletionResponse.fromRawJson(String str) =>
      ChatGptChatCompletionResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChatGptChatCompletionResponse.fromJson(Map<String, dynamic> json) {
    try {
      final List<RecommendedHotel> hotels = json["recommendedHotels"] == null
          ? []
          : List<RecommendedHotel>.from(json["recommendedHotels"]!
              .map((x) => RecommendedHotel.fromJson(x)));
      return ChatGptChatCompletionResponse(
        message: json["message"],
        recommendedHotels: hotels,
        trailingMessage: json["trailingMessage"],
      );
    } catch (e) {
      return ChatGptChatCompletionResponse(
        message: json["message"],
        recommendedHotels: [],
        trailingMessage: json["trailingMessage"],
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "recommendedHotels": recommendedHotels == null
            ? []
            : List<dynamic>.from(recommendedHotels!.map((x) => x.toJson())),
        "trailingMessage": trailingMessage,
      };
}

class RecommendedHotel {
  final String? city;
  final List<String>? hotels;

  RecommendedHotel({
    this.city,
    this.hotels,
  });

  factory RecommendedHotel.fromRawJson(String str) =>
      RecommendedHotel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RecommendedHotel.fromJson(Map<String, dynamic> json) =>
      RecommendedHotel(
        city: json["city"],
        hotels: json["hotels"] == null
            ? []
            : List<String>.from(json["hotels"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "hotels":
            hotels == null ? [] : List<dynamic>.from(hotels!.map((x) => x)),
      };
}
