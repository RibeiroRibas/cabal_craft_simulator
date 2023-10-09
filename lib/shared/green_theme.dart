import 'package:cabal_craft_simulator/shared/i18n/messages.dart';
import 'package:cabal_craft_simulator/shared/theme_colors.dart';
import 'package:flutter/material.dart';

ThemeData greenTheme = ThemeData(
  useMaterial3: true,
  primaryColor: ThemeColors.primary,
  cardColor: ThemeColors.cardColor,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: ThemeColors.black,
    backgroundColor: ThemeColors.primary,
  ),
  scaffoldBackgroundColor: ThemeColors.backgroundColor,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: ThemeColors.backgroundColor,
  ),
  appBarTheme: const AppBarTheme(color: ThemeColors.backgroundColor),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: MaterialColor(ThemeColors.primary.value, shades),
    brightness: Brightness.dark,
  ),
  textTheme: const TextTheme(
    displaySmall: TextStyle(fontSize: 14, color: ThemeColors.white),
    displayMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: ThemeColors.white,
    ),
    displayLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: ThemeColors.white,
    ),
    labelMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: ThemeColors.primary,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 40),
      foregroundColor: Colors.black,
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: playFontFamily,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: 12,
        fontFamily: playFontFamily,
      ),
      side: const BorderSide(
        width: 2.0,
        color: ThemeColors.primary,
      ),
    ),
  ),
  fontFamily: playFontFamily,
);
