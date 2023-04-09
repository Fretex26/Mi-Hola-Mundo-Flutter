import 'package:flutter/material.dart';
import 'screens/countUpScreen.dart';
import 'screens/count_Down_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      routes: {
        'countUp' :(context) => const CountUpScreen(),
        'countDown' :(context) => const CountDownScreen()
      },
      home: const CountUpScreen(),
    );
  }
}

class Params{
  int count;
  bool isUsed;
  Params(this.count, {required this.isUsed});
}