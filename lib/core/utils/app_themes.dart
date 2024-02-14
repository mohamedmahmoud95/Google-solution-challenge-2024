import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';

ThemeData ZaitonDarkTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFF2f3e46),
  primaryColorDark: const Color(0xFF354f52),
  primaryColorLight: const Color(0xFF52796f),
  cardColor: const Color(0xFF84a98c),
  highlightColor: const Color(0xFFcad2c5),

);


ThemeData ZaitonLightTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFFcad2c5),
  cardColor: const Color(0xFF84a98c),
  primaryColorLight: const Color(0xFF52796f),
  primaryColorDark: const Color(0xFF354f52),
  highlightColor: const Color(0xFF2f3e46),

  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.oliveGreen1
  )
);