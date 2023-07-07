// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter_test/flutter_test.dart';
import 'package:titip_itinerary_planner/data/data_sources/traveloka_remote_data_source.dart';
import 'package:titip_itinerary_planner/data/models/traveloka_get_hotel_response.dart';
import 'package:titip_itinerary_planner/domain/entities/processed_hotel.dart';



Future<void> main() async {
  TravelokaGetHotelResponse res =
      await TravelokaRemoteDataSourceImpl().getHotel("Padma Hotel Bandung");

  print(res.description);

  ProcessedHotel hotel = res.toEntity();

  print(hotel.targetUrl);
}
