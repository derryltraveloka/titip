// send ChatGptRequest (message + chat.dart history) and return ChatGptResponse

import 'dart:async';
import 'dart:convert';

import 'package:titip_itinerary_planner/data/models/chat_gpt_chat_completion_request.dart';
import 'package:titip_itinerary_planner/data/models/chat_gpt_chat_completion_response.dart';
import 'package:http/http.dart' as http;
import '../../common/constant.dart';
import '../../common/env_variable.dart';

abstract class ChatGptRemoteDataSource {
  Future<ChatGptChatCompletionResponse> getChatCompletions(
      ChatGptChatCompletionRequest chatGptChatCompletionRequest);
}

class ChatGptRemoteDataSourceImpl implements ChatGptRemoteDataSource{


  ChatGptRemoteDataSourceImpl();

  @override
  Future<ChatGptChatCompletionResponse> getChatCompletions(ChatGptChatCompletionRequest chatGptChatCompletionRequest) async {
    // TODO: implement getChatCompletions
    // String str = ";

    // ChatGptChatCompletionRequest(
    //   messages: Message.fromRawJson(str)
    // )

    final body = chatGptChatCompletionRequest.toRawJson();
    try{

      final url = Uri.parse(BASE_URL).replace(path: '/mock/chat/completions');

      final response = await http.post(
        url,
        headers: defaultHeader,
        // ..addEntries({"Authorization": "Bearer $token"}.entries),
        body: body,
      );

      final responseBody = json.decode(response.body);

      if (response.statusCode ~/ 100 == 2) {
        return ChatGptChatCompletionResponse.fromJson(responseBody["data"]);
      }

    } on Exception {
      rethrow;
    }



    throw UnimplementedError();
  }

}