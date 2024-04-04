import 'package:flutter/material.dart';
import 'package:news_app/style/App_colors.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      toolbarHeight: 80,
      backgroundColor: AppColors.primary,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      
      titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          color: AppColors.onPrimary),
      centerTitle: true,
      iconTheme: IconThemeData(size: 30, color: AppColors.onPrimary),
    ),
    iconTheme: const IconThemeData(size: 30, color: AppColors.textDrawerColor),
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary, primary: AppColors.primary),
    textTheme: const TextTheme(
        headlineLarge: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
        labelMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.textDrawerColor),
        titleLarge: TextStyle(
            color: AppColors.articleTitle,
            fontSize: 16,
            fontWeight: FontWeight.w500),
            titleSmall: TextStyle(color: Color(0xffA3A3A3),fontSize: 16,fontWeight: FontWeight.w600)),
  );
}
