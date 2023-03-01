import 'package:flutter/material.dart';
import 'package:cinema4u/IntroductionScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinema4u',
      theme: ThemeData(),
      home: const IntroductionScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
