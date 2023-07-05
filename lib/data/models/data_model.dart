import 'package:titip_itinerary_planner/data/models/hotel_model.dart';

class DataModel{

  final String? message;
  final HotelModel? hotels;
  final String? trailingMessage;


  const DataModel({
    required this.message,
    required this.hotels,
    required this.trailingMessage,

  });


  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
        message: map['message'],
        hotels: map["hotels"],
        trailingMessage: map['trailingMessage']
    );
  }
  //
  // Map<String, dynamic> toMap() {
  //   return {
  //     'role': role,
  //     'content': content
  //   };
  // }

}