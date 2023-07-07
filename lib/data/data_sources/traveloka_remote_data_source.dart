// send TravelokaGetHotelRequest (hotel name) and return TravelokaGetHotelResponse

import 'dart:convert';

import 'package:titip_itinerary_planner/common/env_variable.dart';
import 'package:titip_itinerary_planner/data/models/traveloka_get_hotel_request.dart';
import 'package:titip_itinerary_planner/data/models/traveloka_get_hotel_response.dart';
import 'package:http/http.dart' as http;

import '../../common/constant.dart';

abstract class TravelokaRemoteDataSource {
  Future<TravelokaGetHotelResponse> getHotel(String hotelName);
}

class TravelokaRemoteDataSourceImpl implements TravelokaRemoteDataSource {
  @override
  Future<TravelokaGetHotelResponse> getHotel(String hotelName) async {
    TravelokaGetHotelRequest req =
        TravelokaGetHotelRequest(hotels: Hotels(name: hotelName));
    final body = req.toRawJson();
    print(body);
    try {
      final url = Uri.parse(BASE_URL)
          .replace(path: 'mock/chat/getHotelRecommendations');
      print(url);

      final response = await http.post(
        url,
        headers: defaultHeader,
        body: body,
      );
      final responseBody = json.decode(response.body);

      if (response.statusCode ~/ 100 == 2) {
        return TravelokaGetHotelResponse.fromJson(responseBody);
      }
      throw Exception();
    } on Exception {
      rethrow;
    }
  }
}
