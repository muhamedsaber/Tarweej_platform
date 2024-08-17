import 'package:flutter/material.dart';
import 'package:tarweej_platform/config/theme/dark_theme/dark_theme_color.dart';

class DarkTheme {
  ThemeData theme = ThemeData(
    scaffoldBackgroundColor: DarkThemeColors.scaffoldBackgroundColor,
    primaryColor: DarkThemeColors.primaryColor,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      error: DarkThemeColors.error,
      onError: DarkThemeColors.onError,
      primary: DarkThemeColors.primaryColor,
      secondary: DarkThemeColors.secondaryColor,
      surface: DarkThemeColors.surface,
      onSurface: DarkThemeColors.onSurface,
      onPrimary: DarkThemeColors.onPrimaryColor,
      onSecondary: DarkThemeColors.onSecondaryColor,
    ),
  );
}
