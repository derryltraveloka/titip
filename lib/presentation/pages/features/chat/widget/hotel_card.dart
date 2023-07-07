import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:titip_itinerary_planner/domain/entities/prcessed_hotel.dart';
import 'package:titip_itinerary_planner/presentation/utils/currency_formatter.dart';
import 'package:titip_itinerary_planner/presentation/utils/custom_color.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HotelCard extends StatelessWidget {
  final ProcessedHotel processedHotel;

  const HotelCard({super.key, required this.processedHotel});

  @override
  Widget build(BuildContext context) {
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
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: ShapeDecoration(
                    color: Color(0xFF335C9A),
                    shape: StadiumBorder(),
                  ),
                  child: Text(
                    "Available at Traveloka",
                    style: TextStyle(color: Colors.white, fontSize:  12),
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
                  const SizedBox(height: 3),
                  Builder(
                    builder: (context) {
                      if (processedHotel.star == null) {
                        return const SizedBox.shrink();
                      }

                      final count = processedHotel.star!.round();
                      final children = List.generate(
                        count,
                        (_) => const Icon(
                          Icons.star_rounded,
                          color: Color(0xFFFADC12),
                        ),
                      ).toList();
                      return Row(children: children);
                    },
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: Colors.black54,
                        size: 16,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "${processedHotel.regionName}",
                        style: TextStyle(color: Colors.black54),
                      )
                    ],
                  ),
                  Divider(thickness: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        rupiahFormatter.format(processedHotel.rate),
                        style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17,
                                    color: priceTextColor) ??
                            const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 17),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "/room/night",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
