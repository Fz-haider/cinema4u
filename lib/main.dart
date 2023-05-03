import 'package:cinema4u/Screen/home_screen.dart';
import 'package:cinema4u/Screen/search_screen/search_screen.dart';
import 'package:cinema4u/api/api_constant.dart';
import 'package:cinema4u/language_constants.dart';
import 'package:cinema4u/theme/my_themes.dart';
import 'package:flutter/material.dart';
import 'package:cinema4u/Screen/onBoarding_screen.dart';
import 'package:flutter_kurdish_localization/kurdish_material_localization_delegate.dart';
import 'package:flutter_kurdish_localization/kurdish_cupertino_localization_delegate.dart';
import 'package:flutter_kurdish_localization/kurdish_widget_localization_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool onBoardingScreen = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey(PREFS_ONBOARDING_SCREEN)) {
    onBoardingScreen = true;
  } else {
    prefs.setBool(PREFS_ONBOARDING_SCREEN, true);
  }

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
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, child) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: 'Cinema4u',
          themeMode: themeProvider.themeMode,
          darkTheme: MyThemes.darkTheme,
          theme: MyThemes.lightTheme,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            KurdishMaterialLocalizations.delegate,
            KurdishWidgetLocalizations.delegate,
            KurdishCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: const [Locale('ar'), Locale('en'), Locale('ku')],
          locale: _locale,
          home: onBoardingScreen ? const HomePage() : OnboardingScreen(),
          routes: {
            'HomePage': (context) => const HomePage(),
            'SearchScreen': (context) => const SearchScreen(),
          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
