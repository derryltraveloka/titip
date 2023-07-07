import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:titip_itinerary_planner/presentation/pages/features/chat/widget/bubbles/assistant_chat_bubble.dart';
import 'package:titip_itinerary_planner/presentation/pages/features/chat/widget/bubbles/chat_bubble.dart';
import 'package:titip_itinerary_planner/presentation/pages/features/chat/widget/bubbles/initial_form_chat_bubble.dart';
import 'package:titip_itinerary_planner/presentation/pages/features/chat/widget/bubbles/loading_chat_bubble.dart';
import 'package:titip_itinerary_planner/presentation/providers/chat_provider.dart';
import 'package:titip_itinerary_planner/presentation/utils/provider_state.dart';

final initialBubbles = [
  ChatBubble.welcome(),
  InitialFormChatBubble(),
];

class ChatField extends StatefulWidget {
  const ChatField({Key? key}) : super(key: key);

  @override
  State<ChatField> createState() => _ChatFieldState();
}

class _ChatFieldState extends State<ChatField> {
  final ItemScrollController _controller = ItemScrollController();

  void _jumpTo(int index) {
    _controller.jumpTo(
      index: index,
      alignment: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Consumer<ChatProvider>(
        builder: (context, chatProvider, child) {
          final messages = chatProvider.processedChats;

          if (messages == null || messages.isEmpty) {
            return ListView(
              padding: const EdgeInsets.only(top: 10),
              children: initialBubbles,
            );
          }

          int count = messages.length + 1;

          final isLoading =
              chatProvider.getChatCompletionsState == ProviderState.loading;
          if (isLoading) count++;

          final returnWidget = ScrollablePositionedList.builder(
            itemScrollController: _controller,
            padding: const EdgeInsets.only(top: 10),
            itemCount: count,
            itemBuilder: (context, index) {
              if (index == 0) {
                return ChatBubble.welcome();
              }
              if (isLoading && index == count - 1) {
                return LoadingChatBubble();
              }
              index -= 1;

              final message = messages[index];
              final isSender = message.role == "user";
              if (isSender) {
                return ChatBubble(
                  message: "${message.content?.message}",
                  isSender: isSender,
                );
              } else {
                return AssistantChatBubble(
                  message: message,
                );
              }
            },
          );
          SchedulerBinding.instance.addPostFrameCallback((_) {
            _jumpTo(messages.length);
          });
          return returnWidget;
        },
      ),
    );
  }
}
