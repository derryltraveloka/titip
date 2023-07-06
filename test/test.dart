// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:titip_itinerary_planner/data/data_sources/chatgpt_remote_data_source.dart';
import 'package:titip_itinerary_planner/data/models/chat_gpt_chat_completion_request.dart';
import 'package:titip_itinerary_planner/data/models/chat_gpt_chat_completion_response.dart';

import 'package:titip_itinerary_planner/main.dart';

import 'package:http/http.dart' as http;

Future<void> main() async {
  // var headers = {
  //   'Content-Type': 'application/json'
  // };
  // var request = http.Request('POST', Uri.parse('http://54.251.64.29:3000/mock/chat/completions'));
  // request.body = json.encode({
  //   "messages": [
  //     {
  //       "role": "user",
  //       "content": "Please create itinerary for my trip to Japan with following details: Dates: 6 July 2023 to 13 July 2023 (7 days) Traveller: couple I prefer nature over cities"
  //     },
  //     {
  //       "role": "assistant",
  //       "content": "Great! Japan has a lot of natural beauty to offer, so this will be a fun trip. Here's a suggested itinerary:  Day 1: Arrival in Tokyo - Check into your hotel and relax after your flight - Explore the city's green spaces, such as Shinjuku Gyoen or Yoyogi Park - For dinner, try out Tsukiji Fish Market for some delicious seafood  Day 2: Tokyo - Visit the famous Tsukiji Fish Market and have a sushi breakfast - Spend the day in Asakusa, where you can see the Senso-ji Temple and Nakamise shopping street - For dinner, try out the delicious ramen at Ichiran Ramen or Ippudo Ramen  Day 3: Hakone - Take a morning train to Hakone, a beautiful mountain town - Visit the Hakone Open-Air Museum to see some incredible sculptures - Take a cable car to the top of Mount Hakone for stunning views of the surrounding area - For dinner, try out some local Japanese hot pot at Gora Hanaougi or Hakone-en Aquarium  Day 4: Kyoto - Take a train to Kyoto, one of Japan's most beautiful cities - Visit the Fushimi Inari Shrine, famous for its thousands of orange torii gates - Take a stroll through the traditional streets of Higashiyama and visit the Kiyomizu-dera Temple - For dinner, try out some of the local specialties like kaiseki or yudofu at Gion Karyo or Hyotei  Day 5: Kyoto - Visit the famous Bamboo Grove in Arashiyama - Visit the Tenryu-ji Temple and its beautiful gardens - Take a scenic boat ride down the Hozugawa River - For dinner, try out some delicious okonomiyaki at Hirokawa or Mizuno  Day 6: Hiroshima - Take a train to Hiroshima and visit the Hiroshima Peace Memorial Park and Museum - Visit Miyajima Island, home to the iconic Itsukushima Shrine and the famous floating torii gate - For dinner, try out the local specialty of Hiroshima-style okonomiyaki at Okonomimura or Nagataya  Day 7: Departure - Check out of your hotel and head back home  I hope you enjoy this itinerary! Let me know if you have any questions or if there's anything else I can help you with.  As for your hotel recommendations, here are three options for each city:  {   \"recommendedHotels\": [     {       \"city\": \"Tokyo\",       \"hotels\": [         \"The Tokyo Station Hotel\",         \"Park Hyatt Tokyo\",         \"Andaz Tokyo Toranomon Hills\"       ]     },     {       \"city\": \"Hakone\",       \"hotels\": [         \"Hakone Ginyu\",         \"The Prince Hakone Lake Ashinoko\",         \"Gora Kadan\"       ]     },     {       \"city\": \"Kyoto\",       \"hotels\": [         \"The Ritz-Carlton Kyoto\",         \"Hyatt Regency Kyoto\",         \"Hotel Granvia Kyoto\"       ]     },     {       \"city\": \"Hiroshima\",       \"hotels\": [         \"Sheraton Grand Hiroshima Hotel\",         \"ANA Crowne Plaza Hiroshima\",         \"Hotel Granvia Hiroshima\"       ]     }   ] }"
  //     },
  //     {
  //       "role": "user",
  //       "content": "I love doraemon. Can you recommend me something related to doraemon?"
  //     },
  //     {
  //       "role": "assistant",
  //       "content": "Yes, of course! If you're a fan of Doraemon, you can visit the Fujiko F. Fujio Museum in Kawasaki, which is dedicated to the work of the manga artist who created Doraemon. The museum features exhibits on Fujiko's life and work, as well as a recreation of his studio and a gift shop where you can buy Doraemon merchandise. It's a fun and interesting place to visit for fans of the popular cartoon character."
  //     },
  //     {
  //       "role": "user",
  //       "content": "Please put it in the itinerary"
  //     },
  //     {
  //       "role": "assistant",
  //       "content": "Sure, I can add it to your itinerary! Here's the updated plan:  Day 1: Arrival in Tokyo - Check into your hotel and relax after your flight - Explore the city's green spaces, such as Shinjuku Gyoen or Yoyogi Park - For dinner, try out Tsukiji Fish Market for some delicious seafood  Day 2: Tokyo - Visit the famous Tsukiji Fish Market and have a sushi breakfast - Spend the day in Asakusa, where you can see the Senso-ji Temple and Nakamise shopping street - For dinner, try out the delicious ramen at Ichiran Ramen or Ippudo Ramen  Day 3: Kawasaki - Take a morning train to Kawasaki and visit the Fujiko F. Fujio Museum - Head back to Tokyo in the afternoon for some shopping in Harajuku or Shibuya - For dinner, try out some local izakaya or yakitori at Torikizoku or Gonpachi  Day 4: Hakone - Take a morning train to Hakone, a beautiful mountain town - Visit the Hakone Open-Air Museum to see some incredible sculptures - Take a cable car to the top of Mount Hakone for stunning views of the surrounding area - For dinner, try out some local Japanese hot pot at Gora Hanaougi or Hakone-en Aquarium  Day 5: Kyoto - Visit the famous Bamboo Grove in Arashiyama - Visit the Tenryu-ji Temple and its beautiful gardens - Take a scenic boat ride down the Hozugawa River - For dinner, try out some delicious okonomiyaki at Hirokawa or Mizuno  Day 6: Hiroshima - Take a train to Hiroshima and visit the Hiroshima Peace Memorial Park and Museum - Visit Miyajima Island, home to the iconic Itsukushima Shrine and the famous floating torii gate - For dinner, try out the local specialty of Hiroshima-style okonomiyaki at Okonomimura or Nagataya  Day 7: Departure - Check out of your hotel and head back home  I hope you like the new plan and have fun visiting the Fujiko F. Fujio Museum!"
  //     }
  //   ]
  // });
  // request.headers.addAll(headers);
  //
  // var response = await request.send();
  //
  // // if (response.statusCode == 200) {
  // //   print(await response.stream.bytesToString());
  // // }
  // // else {
  // // print(response.reasonPhrase);
  // // }
  // print(response);


  final str = {
    "messages": [
      {
        "role": "user",
        "content": "Please create itinerary for my trip to Japan with following details: Dates: 6 July 2023 to 13 July 2023 (7 days) Traveller: couple I prefer nature over cities"
      },
      {
        "role": "assistant",
        "content": "Great! Japan has a lot of natural beauty to offer, so this will be a fun trip. Here's a suggested itinerary:  Day 1: Arrival in Tokyo - Check into your hotel and relax after your flight - Explore the city's green spaces, such as Shinjuku Gyoen or Yoyogi Park - For dinner, try out Tsukiji Fish Market for some delicious seafood  Day 2: Tokyo - Visit the famous Tsukiji Fish Market and have a sushi breakfast - Spend the day in Asakusa, where you can see the Senso-ji Temple and Nakamise shopping street - For dinner, try out the delicious ramen at Ichiran Ramen or Ippudo Ramen  Day 3: Hakone - Take a morning train to Hakone, a beautiful mountain town - Visit the Hakone Open-Air Museum to see some incredible sculptures - Take a cable car to the top of Mount Hakone for stunning views of the surrounding area - For dinner, try out some local Japanese hot pot at Gora Hanaougi or Hakone-en Aquarium  Day 4: Kyoto - Take a train to Kyoto, one of Japan's most beautiful cities - Visit the Fushimi Inari Shrine, famous for its thousands of orange torii gates - Take a stroll through the traditional streets of Higashiyama and visit the Kiyomizu-dera Temple - For dinner, try out some of the local specialties like kaiseki or yudofu at Gion Karyo or Hyotei  Day 5: Kyoto - Visit the famous Bamboo Grove in Arashiyama - Visit the Tenryu-ji Temple and its beautiful gardens - Take a scenic boat ride down the Hozugawa River - For dinner, try out some delicious okonomiyaki at Hirokawa or Mizuno  Day 6: Hiroshima - Take a train to Hiroshima and visit the Hiroshima Peace Memorial Park and Museum - Visit Miyajima Island, home to the iconic Itsukushima Shrine and the famous floating torii gate - For dinner, try out the local specialty of Hiroshima-style okonomiyaki at Okonomimura or Nagataya  Day 7: Departure - Check out of your hotel and head back home  I hope you enjoy this itinerary! Let me know if you have any questions or if there's anything else I can help you with.  As for your hotel recommendations, here are three options for each city:  {   \"recommendedHotels\": [     {       \"city\": \"Tokyo\",       \"hotels\": [         \"The Tokyo Station Hotel\",         \"Park Hyatt Tokyo\",         \"Andaz Tokyo Toranomon Hills\"       ]     },     {       \"city\": \"Hakone\",       \"hotels\": [         \"Hakone Ginyu\",         \"The Prince Hakone Lake Ashinoko\",         \"Gora Kadan\"       ]     },     {       \"city\": \"Kyoto\",       \"hotels\": [         \"The Ritz-Carlton Kyoto\",         \"Hyatt Regency Kyoto\",         \"Hotel Granvia Kyoto\"       ]     },     {       \"city\": \"Hiroshima\",       \"hotels\": [         \"Sheraton Grand Hiroshima Hotel\",         \"ANA Crowne Plaza Hiroshima\",         \"Hotel Granvia Hiroshima\"       ]     }   ] }"
      },
      {
        "role": "user",
        "content": "I love doraemon. Can you recommend me something related to doraemon?"
      },
      {
        "role": "assistant",
        "content": "Yes, of course! If you're a fan of Doraemon, you can visit the Fujiko F. Fujio Museum in Kawasaki, which is dedicated to the work of the manga artist who created Doraemon. The museum features exhibits on Fujiko's life and work, as well as a recreation of his studio and a gift shop where you can buy Doraemon merchandise. It's a fun and interesting place to visit for fans of the popular cartoon character."
      },
      {
        "role": "user",
        "content": "Please put it in the itinerary"
      },
      {
        "role": "assistant",
        "content": "Sure, I can add it to your itinerary! Here's the updated plan:  Day 1: Arrival in Tokyo - Check into your hotel and relax after your flight - Explore the city's green spaces, such as Shinjuku Gyoen or Yoyogi Park - For dinner, try out Tsukiji Fish Market for some delicious seafood  Day 2: Tokyo - Visit the famous Tsukiji Fish Market and have a sushi breakfast - Spend the day in Asakusa, where you can see the Senso-ji Temple and Nakamise shopping street - For dinner, try out the delicious ramen at Ichiran Ramen or Ippudo Ramen  Day 3: Kawasaki - Take a morning train to Kawasaki and visit the Fujiko F. Fujio Museum - Head back to Tokyo in the afternoon for some shopping in Harajuku or Shibuya - For dinner, try out some local izakaya or yakitori at Torikizoku or Gonpachi  Day 4: Hakone - Take a morning train to Hakone, a beautiful mountain town - Visit the Hakone Open-Air Museum to see some incredible sculptures - Take a cable car to the top of Mount Hakone for stunning views of the surrounding area - For dinner, try out some local Japanese hot pot at Gora Hanaougi or Hakone-en Aquarium  Day 5: Kyoto - Visit the famous Bamboo Grove in Arashiyama - Visit the Tenryu-ji Temple and its beautiful gardens - Take a scenic boat ride down the Hozugawa River - For dinner, try out some delicious okonomiyaki at Hirokawa or Mizuno  Day 6: Hiroshima - Take a train to Hiroshima and visit the Hiroshima Peace Memorial Park and Museum - Visit Miyajima Island, home to the iconic Itsukushima Shrine and the famous floating torii gate - For dinner, try out the local specialty of Hiroshima-style okonomiyaki at Okonomimura or Nagataya  Day 7: Departure - Check out of your hotel and head back home  I hope you like the new plan and have fun visiting the Fujiko F. Fujio Museum!"
      }
    ]
  };

  ChatGptChatCompletionRequest chatGptChatCompletionRequest
  = ChatGptChatCompletionRequest.fromJson(str);



  ChatGptChatCompletionResponse chatGptChatCompletionResponse =
  await ChatGptRemoteDataSourceImpl().getChatCompletions(chatGptChatCompletionRequest);

  print (chatGptChatCompletionResponse.message);



  expect(chatGptChatCompletionResponse, chatGptChatCompletionResponse);

}
