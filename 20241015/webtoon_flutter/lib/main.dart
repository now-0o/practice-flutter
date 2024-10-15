import 'package:flutter/material.dart';
import 'package:webtoon_flutter/services/api_service.dart';
import 'screens/home_screen.dart'; // HomeScreen 파일 import

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}