// ignore_for_file: unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:titip_itinerary_planner/data/data_sources/traveloka_remote_data_source.dart';
import 'package:titip_itinerary_planner/data/models/traveloka_get_hotel_response.dart';
import 'package:titip_itinerary_planner/domain/entities/processed_hotel.dart';
import 'package:titip_itinerary_planner/presentation/utils/currency_formatter.dart';
import 'package:titip_itinerary_planner/presentation/utils/custom_color.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HotelCard extends StatelessWidget {
  final String? hotelName;

  const HotelCard({super.key, this.hotelName});

  @override
  Widget build(BuildContext context) {
    if (hotelName == null || hotelName!.isEmpty) return const SizedBox.shrink();
    return FutureBuilder<TravelokaGetHotelResponse>(
      future: TravelokaRemoteDataSourceImpl().getHotel(hotelName!),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const SizedBox.shrink();
        }

        if (snapshot.hasData) {
          final processedHotel = snapshot.data!.toEntity();

          return Card(
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => launchUrlString("${processedHotel.targetUrl}"),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 1.5,
                        child: CachedNetworkImage(
                          imageUrl: processedHotel.imageUrl ?? "",
                          fit: BoxFit.cover,
                          progressIndicatorBuilder: (_, __, downloadProgress) =>
                              Center(
                                  child: CircularProgressIndicator(
                                      value: downloadProgress.progress)),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: const ShapeDecoration(
                          color: Color(0xFF335C9A),
                          shape: StadiumBorder(),
                        ),
                        child: const Text(
                          "Available at Traveloka",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${processedHotel.hotelName}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        // const SizedBox(height: 3),
                        // Builder(
                        //   builder: (context) {
                        //     if (processedHotel.star == null) {
                        //       return const SizedBox.shrink();
                        //     }
                        //
                        //     final count = processedHotel.star!.round();
                        //     final children = List.generate(
                        //       count,
                        //       (_) => const Icon(
                        //         Icons.star_rounded,
                        //         color: Color(0xFFFADC12),
                        //       ),
                        //     ).toList();
                        //     return Row(children: children);
                        //   },
                        // ),
                        const SizedBox(height: 3),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_rounded,
                              color: Colors.black54,
                              size: 16,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                "${processedHotel.regionName}",
                                style: const TextStyle(color: Colors.black54),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                        const Divider(thickness: 1),
                        if (processedHotel.description != null &&
                            processedHotel.description!.isNotEmpty)
                          Text(
                            processedHotel.description!,
                            maxLines: 7,
                            overflow: TextOverflow.ellipsis,
                          ),
                        const SizedBox(height: 5),
                        AbsorbPointer(
                            child: Center(
                                child: FilledButton(
                                    onPressed: () {},
                                    child: const Text("BOOK NOW")))),

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     Text(
                        //       rupiahFormatter.format(processedHotel.rate),
                        //       style: Theme.of(context)
                        //               .textTheme
                        //               .titleMedium
                        //               ?.copyWith(
                        //                   fontWeight: FontWeight.w700,
                        //                   fontSize: 17,
                        //                   color: priceTextColor) ??
                        //           const TextStyle(
                        //               fontWeight: FontWeight.w700,
                        //               fontSize: 17),
                        //     ),
                        //   ],
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     Text(
                        //       "/room/night",
                        //       style: TextStyle(color: Colors.black54),
                        //     ),
                        //   ],
                        // ),
                        // const SizedBox(height: 3),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return const Card(
          child: SizedBox(
              height: 200,
              width: 200,
              child: Center(child: CircularProgressIndicator())),
        );
      },
    );
  }
}
