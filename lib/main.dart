import 'package:flutter/material.dart';
import 'package:record_player/screens/player_screen.dart';
import 'package:record_player/screens/songs_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PlayerScreen(title: 'Record Player'),
    );
  }

  
}
