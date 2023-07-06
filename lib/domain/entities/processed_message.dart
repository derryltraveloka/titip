import 'package:titip_itinerary_planner/data/models/chat_gpt_chat_completion_response.dart';

class ProcessedMessage {
  final String? role;
  final ChatGptChatCompletionResponse? content;

  ProcessedMessage({
    this.role,
    this.content,
  });
}