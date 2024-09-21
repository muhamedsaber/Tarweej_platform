import 'package:flutter/material.dart';
import 'package:tarweej_platform/config/theme/dark_theme/dark_theme_color.dart';
import 'package:tarweej_platform/config/language/localization_herlper.dart';

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
      appBarTheme: const AppBarTheme(
        backgroundColor: DarkThemeColors.scaffoldBackgroundColor,
        
      ),
      splashColor: Colors.transparent,
        highlightColor:DarkThemeColors.primaryColor,
         splashFactory: NoSplash.splashFactory,
        popupMenuTheme: const PopupMenuThemeData(),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
         
      ) ,
      fontFamily: LocalizationHelper.getFontFamily(context),
      textTheme: const TextTheme().apply(
        fontFamily: LocalizationHelper.getFontFamily(context),
      ));
      
}
