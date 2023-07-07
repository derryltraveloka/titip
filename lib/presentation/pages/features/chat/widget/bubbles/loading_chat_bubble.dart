import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:titip_itinerary_planner/presentation/utils/custom_color.dart';

class LoadingChatBubble extends StatelessWidget {
  final bool isSender = false;

  const LoadingChatBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * 0.75),
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
          child: Column(
            children: [
              DefaultTextStyle(
                style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.white) ??
                    const TextStyle(color: Colors.white),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText("Please wait..."),
                    TypewriterAnimatedText(
                        "I'm exploring the world to find the answer..."),
                    TypewriterAnimatedText(
                        "Well, I'm an AI model so I can't literally travel the world :')."),
                    TypewriterAnimatedText(
                        "I really want to travel like you do :("),
                    TypewriterAnimatedText("Of course with Traveloka :D"),
                    TypewriterAnimatedText("TRIVIA TIME! "),
                    TypewriterAnimatedText(
                        "Do you know what is the type of bird in Traveloka logo?"),
                    TypewriterAnimatedText("Do you have the answer?"),
                    TypewriterAnimatedText(
                      "It's Godwit bird! :D",
                    ),
                    TypewriterAnimatedText(
                      "Did you get it right? ;)",
                    ),
                    TypewriterAnimatedText(
                      "Well now you know :) ...",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
