import 'package:flutter/material.dart';
import 'package:titip_itinerary_planner/presentation/utils/custom_color.dart';

class ChatBubble extends StatelessWidget {

  const ChatBubble({
    Key? key,
    required this.message,
    required this.isSender,
  }) : super(key: key);
  final String message;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Text("timestamp"),
        Container(
          constraints: BoxConstraints(maxWidth: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSender ? senderBubbleColor : systemBubbleColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1, 2), // changes position of shadow
              ),
            ],
          ),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment:
                isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              if (message.isNotEmpty)
                Text(
                  message,
                  style: TextStyle(color: isSender ? senderTextColor: systemTextColor),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
