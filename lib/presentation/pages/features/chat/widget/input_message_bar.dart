import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:titip_itinerary_planner/presentation/providers/chat_provider.dart';
import 'package:titip_itinerary_planner/presentation/utils/custom_color.dart';

class InputMessageBar extends StatefulWidget {
  const InputMessageBar({super.key});

  @override
  State<InputMessageBar> createState() => _InputMessageBarState();
}

class _InputMessageBarState extends State<InputMessageBar> {
  final _chatController = TextEditingController();

  Future<void> submitChat(BuildContext context) async {
    if (_chatController.text.isNotEmpty) {
      final String message = _chatController.text;
      _chatController.clear();
      FocusScope.of(context).unfocus();
      await Provider.of<ChatProvider>(context, listen: false)
          .getChatCompletions(message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, chatProvider, child) {
        if (chatProvider.rawChats == null || chatProvider.rawChats!.isEmpty)
          return SizedBox.shrink();

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
                  child: TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Type something...",
                      hintStyle: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    controller: _chatController,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () => submitChat(context),
              )
            ],
          ),
        );
      },
    );
  }
}
