import 'package:flutter/material.dart';
import 'package:titip_itinerary_planner/presentation/utils/custom_color.dart';

class InputMessageBar extends StatelessWidget {
  const InputMessageBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: travelokaBlue,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
              ),
              margin: const EdgeInsets.all(10),
              child: const TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Type something...",
                    hintStyle: TextStyle(fontWeight: FontWeight.w400)),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.send,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
