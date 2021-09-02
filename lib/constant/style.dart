import 'package:flutter/material.dart';

import 'color.dart';

class AppThemes {
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.black,
    colorScheme: ColorScheme.dark(
        brightness: Brightness.dark,
        primary: AppColors.purpleDark,
        secondary: AppColors.purpleDark,
        onPrimary: AppColors.white),
    shadowColor: AppColors.black.withOpacity(0.9),
    fontFamily: 'Montserrat',
    primaryColorDark: AppColors.white,
    textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
        bodyText2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400), // def
        subtitle1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
        subtitle2: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
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
      primaryColorDark: AppColors.black,
      textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
        bodyText2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400), // def
        subtitle1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
        subtitle2: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
        headline6: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.w700,
            color: AppColors.black),
      ),
  );
}
