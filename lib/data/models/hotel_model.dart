class HotelModel{

  final String? city;

  final List<String>? listHotel;


  const HotelModel({
    required this.city,
    required this.listHotel,

  });


// factory MessagesModel.fromMap(Map<String, dynamic> map) {
//   return MessagesModel(
//       role: map['role'],
//       content: map['content']
//   );
// }
//
// Map<String, dynamic> toMap() {
//   return {
//     'role': role,
//     'content': content
//   };
// }

}