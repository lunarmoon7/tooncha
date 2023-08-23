import 'package:flutter/material.dart';
void main() {
  runApp(App());
}

// Starting Point of Our App
// 모든 화면과 버튼 등 모든 것들이 App에서 온다.
// StatelessWidget은 아주 기초적인 Widget이다. 화면에 무언가를 띄워주는 것 말고는 하는 일이 없다. -> 반드시 build() 메소드를 구현해야 한다.
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // Root Widget은 두 개의 옵션 중 하나를 return 해야 한다. 1. MaterialApp 2. CupertinoApp
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: const Text('Hello Flutter!'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
