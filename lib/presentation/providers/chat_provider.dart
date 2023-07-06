import 'package:flutter/foundation.dart';
import 'package:titip_itinerary_planner/data/models/chat_gpt_chat_completion_request.dart';
import 'package:titip_itinerary_planner/data/models/chat_gpt_chat_completion_response.dart';

class ProcessedMessage {
  final String? role;
  final ChatGptCompletionResponse? content;

  ProcessedMessage({
    this.role,
    this.content,
  });
}

class ChatProvider with ChangeNotifier {
  List<Message>? rawChats;
  List<ProcessedMessage>? processedChats;

  ChatProvider() {
    rawChats = [];
    processedChats = [];
  }

  Future<ProcessedMessage?> getChatCompletions(String newMessage) async {
    try {
      final newUserRawMessage = Message(role: "user", content: newMessage);
      final newUserProcessedMessage = ProcessedMessage(
        role: "user",
        content: ChatGptCompletionResponse(message: newMessage),
      );
      rawChats?.add(newUserRawMessage);
      processedChats?.add(newUserProcessedMessage);
      notifyListeners();

      // call remote data source with latest 10 raw chat
      final response = ChatGptCompletionResponse(
        message:
            "Great! Here's a suggested itinerary for your 7-day trip to Bandung:\n\nDay 1:\n- Arrive at Husein Sastranegara International Airport\n- Check-in at your hotel\n- Visit Tangkuban Perahu volcano to enjoy the scenic beauty of the active volcano\n- Try traditional Sundanese food for lunch at \"Kampung Daun\" restaurant\n- Visit Dago Pakar area for the amazing view of Bandung city from the hills\n\nDay 2:\n- Visit Kawah Putih, an impressive white crater lake located in Ciwidey area\n- Have a lunch at floating market in Lembang area\n- Visit the famous tea plantations in Ciwidey area\n- Back to hotel\n\nDay 3:\n- Visit the beautiful Maribaya waterfall and hot springs\n- Explore the amazing trees at Treetop Adventure Park\n- Have a lunch at a local restaurant near the area\n- Visit the stunning Glamping Lakeside in Situ Cileunca\n\nDay 4:\n- Visit the Tangkuban Parahu volcano again, but this time take a different route through Lembang\n- Have a lunch at \"The Peak\" restaurant with a panoramic view of Bandung city\n- Visit the Instagenic European-style Castle, \"Gedung Sate\"\n\nDay 5:\n- Visit the amazing Trans Studio Bandung, a theme park with indoor and outdoor rides\n- Have lunch at the theme park's restaurants\n- Visit the Paris Van Java shopping mall for a shopping spree\n\nDay 6:\n- Relax at the Jendela Alam Farm in Lembang and take photos with the farm animals\n- Have lunch at a local restaurant near the area\n- Visit the Rabbit town, a park with various types of rabbits\n\nDay 7:\n- Visit the Cihampelas Walk shopping street, famous for its jeans and fashion shops\n- Have lunch at a local restaurant near the area\n- Check-out from your hotel and head to the airport for your flight back home\n\nRecommended hotels:\n",
        recommendedHotels: [
          RecommendedHotel(
            city: "Bandung",
            hotels: [
              "Padma Hotel Bandung",
              "The Trans Luxury Hotel Bandung",
              "Aryaduta Bandung"
            ],
          ),
          RecommendedHotel(
            city: "Bandung2",
            hotels: [
              "Padma Hotel Bandung",
              "The Trans Luxury Hotel Bandung",
              "Aryaduta Bandung"
            ],
          ),
        ],
        trailingMessage: "I hope you enjoy your trip!",
      );

      if (response != null) {
        final newAssistantRawMessage = Message(
          role: "assistant",
          content: "${response?.toRawJson()}",
        );
        final newAssistantProcessedMessage = ProcessedMessage(
          role: "assistant",
          content: response,
        );

        rawChats?.add(newAssistantRawMessage);
        processedChats?.add(newAssistantProcessedMessage);
        notifyListeners();

        return newAssistantProcessedMessage;
      }
      throw Exception();
    } catch (e) {
      rawChats?.removeLast();
      processedChats?.removeLast();
      notifyListeners();
      rethrow;
    }
  }
}
