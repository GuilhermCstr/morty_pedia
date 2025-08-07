import 'package:flutter/material.dart';

final ThemeData rickAndMortyTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF00FFB3),
  scaffoldBackgroundColor: const Color(0xFF1A1A2E),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF00FFB3),
    brightness: Brightness.dark,
    primary: const Color(0xFF00FFB3),
    secondary: const Color(0xFF8B5CF6),
    surface: const Color(0xFF2E2E3E),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF2E2E3E),
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 255, 255)),
    headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
    bodyMedium: TextStyle(fontSize: 14, color: Colors.white70),
  ),
  cardTheme: CardThemeData(
    color: const Color(0xFF2E2E3E),
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF00FFB3),
    foregroundColor: Colors.black,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF8B5CF6),
      foregroundColor: Colors.white,
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(color: Color(0xFF00FFB3)),
);
