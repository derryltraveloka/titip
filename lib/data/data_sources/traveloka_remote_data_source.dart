// send TravelokaGetHotelRequest (hotel name) and return TravelokaGetHotelResponse

import 'package:titip_itinerary_planner/data/models/traveloka_get_hotel_request.dart';
import 'package:titip_itinerary_planner/data/models/traveloka_get_hotel_response.dart';

abstract class TravelokaRemoteDataSource {
  Future<TravelokaGetHotelResponse> getHotel(
      TravelokaGetHotelRequest travelokaGetHotelRequest);
}

class TravelokaRemoteDataSourceImpl implements TravelokaRemoteDataSource{
  @override
  Future<TravelokaGetHotelResponse> getHotel(TravelokaGetHotelRequest travelokaGetHotelRequest) {
    // TODO: implement getChatCompletions


    throw UnimplementedError();
  }

}