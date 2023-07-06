// send ChatGptRequest (message + chat.dart history) and return ChatGptResponse

import 'package:titip_itinerary_planner/data/models/chat_gpt_chat_completion_request.dart';
import 'package:titip_itinerary_planner/data/models/chat_gpt_chat_completion_response.dart';
import 'package:http/http.dart' as http;

abstract class ChatGptRemoteDataSource {
  Future<ChatGptChatCompletionResponse> getChatCompletions(
      ChatGptChatCompletionRequest chatGptChatCompletionRequest);
}

class ChatGptRemoteDataSourceImpl implements ChatGptRemoteDataSource {
  @override
  Future<ChatGptChatCompletionResponse> getChatCompletions(
      ChatGptChatCompletionRequest chatGptChatCompletionRequest) async {
    throw UnimplementedError();
  }
}
