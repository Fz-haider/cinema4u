import 'package:cinema4u/home_page.dart';
import 'package:flutter/material.dart';
import 'package:cinema4u/introduction_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinema4u',
      theme: ThemeData(),
      home: IntroductionScreen(),
      routes: {
        'HomePage': (context) => const HomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
