import 'dart:convert';

class ChatGptChatCompletionRequest {
  final List<Message>? messages;

  ChatGptChatCompletionRequest({
    this.messages,
  });

  factory ChatGptChatCompletionRequest.fromRawJson(String str) => ChatGptChatCompletionRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChatGptChatCompletionRequest.fromJson(Map<String, dynamic> json) => ChatGptChatCompletionRequest(
    messages: json["messages"] == null ? [] : List<Message>.from(json["messages"]!.map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "messages": messages == null ? [] : List<dynamic>.from(messages!.map((x) => x.toJson())),
  };
}

class Message {
  final String? role;
  final String? content;

  Message({
    this.role,
    this.content,
  });

  factory Message.fromRawJson(String str) => Message.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    role: json["role"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "role": role,
    "content": content,
  };
}
