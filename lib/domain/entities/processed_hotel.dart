class ProcessedHotel {
  final String? hotelName;
  final String? regionName;
  final String? imageUrl;
  final String? targetUrl;
  final double? star;
  final double? userRating;
  final int? numReviews;
  final double? rate;
  final String? description;

  const ProcessedHotel({
    this.description,
    this.hotelName,
    this.regionName,
    this.imageUrl,
    this.targetUrl,
    this.star,
    this.userRating,
    this.numReviews,
    this.rate,
  });
}

ProcessedHotel mockProcessedHotel = const ProcessedHotel(
  hotelName: "Grand Tjokro Premiere Bandung",
  imageUrl:
      "https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/10008390-c43520109e4aa4f8091c941fe1d2a569.jpeg?tr=q-40,w-300,h-300&_src=imagekit",
  numReviews: 16304,
  star: 4.0,
  userRating: 8.5,
  rate: 949000,
  regionName: "Cihampelas, Bandung",
  targetUrl:
      "https://www.traveloka.com/en-id/hotel/indonesia/grand-tjokro-premiere-bandung-3000010008390?spec=08-07-2023.09-07-2023.1.1.HOTEL.3000010008390.Grand%20Tjokro%20Premiere%20Bandung.1",
  description:
      "Padma Hotel Bandung is located in area / city Ciumbuleuit.\n\n\n24-hours front desk is available to serve you, from check-in to check-out, or any assistance you need. Should you desire more, do not hesitate to ask the front desk, we are always ready to accommodate you.\nWiFi is available within public areas of the property to help you to stay connected with family and friends.",
);

// Future<ProcessedHotel> getHotel(String name){
//
// }

Future<ProcessedHotel> mockProcessedHotelFuture() async {
  await Future.delayed(const Duration(seconds: 5));
  return mockProcessedHotel;
}
