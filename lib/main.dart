import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:titip_itinerary_planner/presentation/pages/features/chat/home_chat_page.dart';
import 'package:titip_itinerary_planner/presentation/providers/chat_provider.dart';
import 'package:titip_itinerary_planner/presentation/utils/custom_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: travelokaBlue),
          useMaterial3: true,
        ),
        home: const HomeChatPage(),
      ),
    );
  }
}
