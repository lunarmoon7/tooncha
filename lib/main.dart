import 'package:flutter/material.dart';
import 'package:tooncha/screens/home_screen.dart';
import 'package:tooncha/services/api_service.dart';

void main() {
  runApp(const App());
}

// Starting Point of Our App
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
