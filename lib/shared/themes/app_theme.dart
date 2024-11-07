import 'package:flutter/material.dart';
import 'light_theme.dart';
import 'dark_theme.dart';

class AppTheme {
  static ThemeData light() => LightTheme.theme;
  static ThemeData dark() => DarkTheme.theme;
}
