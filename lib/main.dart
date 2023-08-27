import 'package:flutter/material.dart';
import 'package:tooncha/screens/home_screen.dart';

void main() {
  runApp(const App());
}

// Starting Point of Our App
// 모든 화면과 버튼 등 모든 것들이 App에서 온다.
// StatelessWidget은 아주 기초적인 Widget이다. 화면에 무언가를 띄워주는 것 말고는 하는 일이 없다. -> 반드시 build() 메소드를 구현해야 한다.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color(0xffe7626c),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
        cardColor: const Color(0xfff4eddb),
      ),
      home: const HomeScreen(),
    );
  }
}
