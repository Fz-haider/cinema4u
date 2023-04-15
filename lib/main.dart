import 'package:cinema4u/Screen/home_page.dart';
import 'package:cinema4u/Screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:cinema4u/Screen/onBoarding_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinema4u',
      theme: ThemeData(
        fontFamily: GoogleFonts.openSans().fontFamily,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: OnboardingScreen(),
      routes: {
        'HomePage': (context) => const HomePage(),
        'SearchScreen': (context) => const SearchScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
