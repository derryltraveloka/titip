// send ChatGptRequest (message + chat history) and return ChatGptResponse

import 'package:titip_itinerary_planner/data/models/chat_gpt_chat_completion_request.dart';
import 'package:titip_itinerary_planner/data/models/chat_gpt_chat_completion_response.dart';

abstract class ChatGptRemoteDataSource {
  Future<ChatGptChatCompletionResponse> getChatCompletions(
      ChatGptChatCompletionRequest chatGptChatCompletionRequest);
}

class ChatGptRemoteDataSourceImpl implements ChatGptRemoteDataSource{
  @override
  Future<ChatGptChatCompletionResponse> getChatCompletions(ChatGptChatCompletionRequest chatGptChatCompletionRequest) {
    // TODO: implement getChatCompletions
    

    throw UnimplementedError();
  }
  
}