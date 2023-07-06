class MessagesModel{

  final String? role;
  final String? content;


  const MessagesModel({
    required this.role,
    required this.content,

  });


  factory MessagesModel.fromMap(Map<String, dynamic> map) {
    return MessagesModel(
      role: map['role'],
      content: map['content']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'role': role,
      'content': content
    };
  }

}