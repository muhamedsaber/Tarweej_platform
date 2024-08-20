import 'package:flutter/material.dart';
import 'package:tarweej_platform/config/theme/dark_theme/dark_theme_color.dart';
import 'package:tarweej_platform/core/helpers/localization_herlper.dart';
import 'package:tarweej_platform/core/styles/font_weight_helper.dart';

class DarkTheme {
  
  static ThemeData theme(BuildContext context) => ThemeData(
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
  fontFamily:LocalizationHelper.getFontFamily(context),
    textTheme: const TextTheme(),
  );
}

extension TextStylesExtension on ThemeData {
  TextStyle get font18OnSurfaceBold {
    return TextStyle(
      fontSize: 18,
      color: colorScheme.onSurface,
      fontWeight: FontWeightHelper.bold,
    );
  }
}
