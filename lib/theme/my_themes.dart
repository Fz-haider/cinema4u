import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cinema4u/theme/app_colors.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkMode => themeMode == ThemeMode.dark;
  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  //LightMode
  static final lightTheme = ThemeData(
    fontFamily: GoogleFonts.openSans().fontFamily,
    scaffoldBackgroundColor: AppColor.snow,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColor.vulcan),
      titleTextStyle: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: AppColor.vulcan),
    ),
    primaryColor: AppColor.snow,
    primaryColorDark: AppColor.vulcan,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColor.vulcan),
      bodyMedium: TextStyle(color: AppColor.vulcan),
      bodySmall: TextStyle(color: AppColor.vulcan),
      displayLarge: TextStyle(color: AppColor.vulcan),
      displayMedium: TextStyle(color: AppColor.vulcan),
      displaySmall: TextStyle(color: AppColor.vulcan),
    ),
    iconTheme: IconThemeData(color: AppColor.vulcan),
    colorScheme: const ColorScheme.light(),
  );

  //DarkMode
  static final darkTheme = ThemeData(
    fontFamily: GoogleFonts.openSans().fontFamily,
    scaffoldBackgroundColor: AppColor.vulcan,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: AppColor.snow),
    ),
    primaryColor: AppColor.vulcan,
    primaryColorDark: AppColor.snow,
    iconTheme: IconThemeData(color: AppColor.snow),
    colorScheme: const ColorScheme.dark(),
  );
}
