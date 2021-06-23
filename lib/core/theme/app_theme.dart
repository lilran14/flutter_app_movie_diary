import 'package:flutter/material.dart';
import 'package:flutter_app_movie_diary/core/theme/theme_config.dart';

class AppTheme {
  // Dark Theme Text Settings
  static final TextTheme _darkTextTheme = TextTheme(
    overline: TextStyle(
      color: ThemeColor.darkTextColor,
    ),
    headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
    headline5: TextStyle(
      fontSize: 18.0,
    ),
    headline6: TextStyle(
      fontSize: 16.0,
    ),
    bodyText1: TextStyle(
      fontSize: 12.0,
    ),
    bodyText2: TextStyle(
      fontSize: 10.0,
    ),
    button: TextStyle(
      fontSize: 14.0,
    ),
    subtitle1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
    subtitle2: TextStyle(
      fontSize: 12.0,
    ),
    caption: TextStyle(
      fontSize: 12.0,
    ),
  );

  // Dark Theme Settings
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      canvasColor: ThemeColor.darkBackgroundColor,
      scaffoldBackgroundColor: ThemeColor.darkBackgroundColor,
      backgroundColor: ThemeColor.darkBackgroundColor,
      primaryColor: ThemeColor.darkPrimaryColor,
      accentColor: ThemeColor.accentColor,
      appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          color: ThemeColor.darkPrimaryColor,
          iconTheme: IconThemeData(color: Colors.white)),
      colorScheme: ColorScheme.dark(
        primary: ThemeColor.darkPrimaryColor,
        primaryVariant: ThemeColor.darkPrimaryVariantColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ThemeColor.darkPrimaryColor,
          selectedItemColor: ThemeColor.accentColor),
      textTheme: _darkTextTheme);
}
