import 'package:flutter/material.dart';
import 'package:titip_itinerary_planner/data/models/chat_gpt_chat_completion_response.dart';
import 'package:titip_itinerary_planner/presentation/pages/features/chat/widget/hotel_card.dart';
import 'package:titip_itinerary_planner/presentation/utils/custom_color.dart';

class HotelList extends StatelessWidget {
  final RecommendedHotel recommendedHotel;

  const HotelList(this.recommendedHotel, {super.key});

  @override
  Widget build(BuildContext context) {
    if (recommendedHotel.hotels == null || recommendedHotel.hotels!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${recommendedHotel.city?.toUpperCase()}",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: systemTextColor,
              ),
        ),
        Builder(
          builder: (context) {
            final children = recommendedHotel.hotels!
                .map((e) => HotelCard(
                      hotelName: e,
                    ))
                .toList();
            return Column(
              children: children,
            );
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
