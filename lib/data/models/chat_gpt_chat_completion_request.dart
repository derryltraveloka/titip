import 'dart:convert';

import 'messages_model.dart';

class ChatGptChatCompletionRequest{

  final String? id;
  final List<MessagesModel>? messages;


  const ChatGptChatCompletionRequest({
    required this.id,
    required this.messages,

  });



  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'messages': messages
    };
  }

  factory ChatGptChatCompletionRequest.fromMap(Map<String, dynamic> map) {
    return ChatGptChatCompletionRequest(
      id: map['_id'],
      messages: map["messages"] == null
          ? []
          : List<MessagesModel>.from(
          map["messages"]!.map((x) => MessagesModel.fromMap(x))),

    );
  }

  String toJson() => json.encode(toMap());

  factory ChatGptChatCompletionRequest.fromJson(String source) =>
      ChatGptChatCompletionRequest.fromMap(json.decode(source));


}