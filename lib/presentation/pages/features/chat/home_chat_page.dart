import 'package:flutter/material.dart';
import 'package:titip_itinerary_planner/presentation/pages/features/chat/widget/chat_field.dart';
import 'package:titip_itinerary_planner/presentation/pages/features/chat/widget/input_message_bar.dart';
import 'package:titip_itinerary_planner/presentation/utils/custom_color.dart';

class HomeChatPage extends StatelessWidget {
  const HomeChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: travelokaBlue,
        leading: const SizedBox.shrink(),
        leadingWidth: 10,
        title: const Column(
          children: [
            Text(
              "Traveloka",
              style: TextStyle(color: Colors.white, height: 0.8),
            ),
            Text(
              "Itinerary Planner",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                "Clear Chat",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ChatField(),
          ),
          InputMessageBar()
        ],
      ),
    );
  }
}
