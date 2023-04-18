import 'package:cinema4u/Screen/home_screen.dart';
import 'package:cinema4u/Screen/search_screen.dart';
import 'package:cinema4u/language_constants.dart';
import 'package:flutter/material.dart';
import 'package:cinema4u/Screen/onBoarding_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((local) => setLocale(local));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinema4u',
      theme: ThemeData(
        fontFamily: GoogleFonts.openSans().fontFamily,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      home: OnboardingScreen(),
      routes: {
        'HomePage': (context) => const HomePage(),
        'SearchScreen': (context) => const SearchScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
