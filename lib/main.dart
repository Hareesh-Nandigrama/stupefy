import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify',
      theme: ThemeData(primaryColor: MaterialColor(0xFF1DB954, <int, Color>{})),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(title: 'Spotify - Splash Screen'),
    );
  }
}