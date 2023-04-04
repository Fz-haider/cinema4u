import 'package:cinema4u/Screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:cinema4u/Screen/onBoarding_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinema4u',
      theme: ThemeData(
        fontFamily: GoogleFonts.openSans().fontFamily,
      ),
      home: OnboardingScreen(),
      routes: {
        'HomePage': (context) => const HomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
