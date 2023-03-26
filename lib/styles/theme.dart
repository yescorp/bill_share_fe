import 'package:bill_share/styles/colors.dart';
import 'package:flutter/material.dart';

final brightTheme = ThemeData(
  colorScheme: const ColorScheme(
    background: AppColors.background,
    brightness: Brightness.light,
    error: Color(0xFFFF72B5),
    onBackground: Colors.black,
    onError: Colors.black,
    onPrimary: Colors.white,
    primary: Color(0xFF696FFF),
    onSecondary: Colors.white,
    onSurface: Colors.white,
    secondary: Color(0xFF6833FF),
    surface: Colors.white,
  ),
  fontFamily: 'Fenix',
);
