import 'package:flutter/material.dart';
import 'package:titip_itinerary_planner/presentation/pages/features/chat/widget/bubbles/prompt_input_form.dart';
import 'package:titip_itinerary_planner/presentation/utils/custom_color.dart';

class InitialFormChatBubble extends StatelessWidget {

  const InitialFormChatBubble({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width*0.60),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: senderBubbleColor,
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
          child: const PromptInputForm(),
        ),
      ],
    );
  }
}
