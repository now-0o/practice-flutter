import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // HomeScreen 파일 import

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
