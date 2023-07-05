import 'dart:convert';

import 'package:titip_itinerary_planner/data/models/data_model.dart';

class ChatGptChatCompletionResponse{

  final DataModel data;

  const ChatGptChatCompletionResponse({
    required this.data
  });

  Map<String, dynamic> toMap() {
    return {
      'data': data
    };
  }

  factory ChatGptChatCompletionResponse.fromMap(Map<String, dynamic> map) {
    return ChatGptChatCompletionResponse(
      data: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatGptChatCompletionResponse.fromJson(String source) =>
      ChatGptChatCompletionResponse.fromMap(json.decode(source));

}