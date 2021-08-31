import 'package:flutter/material.dart';

import 'color.dart';

class AppThemes {
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.black,
    colorScheme: ColorScheme.light(
        brightness: Brightness.dark,
        primary: AppColors.purpleDark,
        secondary: AppColors.purpleDark,
        onPrimary: AppColors.white),
    shadowColor: AppColors.black.withOpacity(0.9),
    fontFamily: 'Montserrat',
    textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
        headline6: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.w700,
            color: AppColors.white)),
  );

  static ThemeData lightTheme = ThemeData(
      primaryColor: AppColors.white,
      colorScheme: ColorScheme.light(
        brightness: Brightness.light,
        primary: AppColors.purpleLight,
        secondary: AppColors.purpleLight,
        onPrimary: AppColors.white,
      ),
      shadowColor: AppColors.black.withOpacity(0.12),
      fontFamily: 'Montserrat',
      textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
        headline6: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.w700,
            color: AppColors.black),
      ),
  );
}
