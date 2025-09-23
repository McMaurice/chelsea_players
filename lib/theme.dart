import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = const Color.fromRGBO(3, 70, 120, 1);
  static Color primaryAccent = const Color.fromRGBO(10, 100, 160, 1);
  static Color secondaryColor = const Color.fromRGBO(238, 36, 44, 1);
  static Color secondaryAccent = const Color.fromRGBO(255, 100, 110, 1);

  static Color titleColor = const Color.fromRGBO(255, 255, 255, 1);
  static Color textColor = const Color.fromRGBO(209, 211, 212, 1);
  static Color successColor = const Color.fromRGBO(9, 149, 110, 1);
  static Color highlightColor = const Color.fromRGBO(219, 161, 17, 1);
}

ThemeData primaryTheme = ThemeData(
  // seed
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),

  //Scaffold color
  scaffoldBackgroundColor: AppColors.secondaryColor,

  // AppBar Theme
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primaryAccent,
    foregroundColor: AppColors.titleColor,
  ),

  //Text Theme
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: AppColors.textColor,
      fontSize: 16,
      letterSpacing: 1,
    ),
    headlineMedium: TextStyle(
      color: AppColors.titleColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
    ),
    titleMedium: TextStyle(
      color: AppColors.titleColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
    ),
  ),

  // Card theme
  cardTheme: CardThemeData(
    color: AppColors.primaryColor.withAlpha((0.5 * 255).toInt()),
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(),
    shadowColor: Colors.transparent,
    margin: EdgeInsets.only(bottom: 16),
  ),
);
