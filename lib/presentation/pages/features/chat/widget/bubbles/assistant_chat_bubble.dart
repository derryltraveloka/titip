import 'package:flutter/material.dart';
import 'package:titip_itinerary_planner/domain/entities/processed_message.dart';
import 'package:titip_itinerary_planner/presentation/pages/features/chat/widget/bubbles/hotel_list.dart';
import 'package:titip_itinerary_planner/presentation/utils/custom_color.dart';

class AssistantChatBubble extends StatelessWidget {
  const AssistantChatBubble({Key? key, required this.message})
      : super(key: key);
  final ProcessedMessage message;
  final bool isSender = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * 0.7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSender ? senderBubbleColor : systemBubbleColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(1, 2), // changes position of shadow
              ),
            ],
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Builder(builder: (context) {
            if (message.content == null) return const SizedBox.shrink();
            final content = message.content!;

            return Column(
              crossAxisAlignment:
                  isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(
                  "${content.message}",
                  style: TextStyle(
                      color: isSender ? senderTextColor : systemTextColor),
                ),
                if (content.recommendedHotels != null &&
                    content.recommendedHotels!.isNotEmpty)
                  Builder(
                    builder: (context) {
                      final recommendedHotels = content.recommendedHotels!;
                      final children =
                          recommendedHotels.map((e) => HotelList(e)).toList();
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...children,
                          const SizedBox(
                            height: 8,
                          )
                        ],
                      );
                    },
                  ),
                Text(
                  "${content.trailingMessage}",
                  style: TextStyle(
                      color: isSender ? senderTextColor : systemTextColor),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}
