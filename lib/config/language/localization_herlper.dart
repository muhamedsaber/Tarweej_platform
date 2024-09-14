import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tarweej_platform/config/data/cache/cache_constants.dart';
import 'package:tarweej_platform/config/data/cache/cache_manager.dart';
import 'package:tarweej_platform/core/helpers/app_constants.dart';

class LocalizationHelper {
  static Future<String> loadLanguage() async {
    final lang = await CacheHelper.getString(key: CacheConstants.appLanguage);
    if (lang == "") {
      // if the lang is empty this mean that the app language is not set yet
      return getSystemLanguage();
    } else {
      return lang;
    }
  }

  /// READ THIS CAREFULLY
  /// Do not use this function to get the current language for [UI]
  /// because it's not reliable and will never update the UI when the language is changed
  static AppLanguage getCurrentLanguageByIntl() {
    String lang = Intl.getCurrentLocale();
    if (lang == AppConstants.ar) {
      return AppLanguage.ar;
    } else {
      return AppLanguage.en;
    }
  }

  /// This Function is used to get the current language of the app
  /// using [BuildContext] it's important to use this function in widgets
  /// to get the current language of the app and update the UI
  /// it's fast and reliable because it's use [dependOnInheritedWidgetOfExactType]
  /// to jump to the nearest [Localizations] widget and get the current language
  static AppLanguage getCurrentLanguageByContext(BuildContext context) {
    final local = Localizations.localeOf(context);

    if (local.languageCode == AppConstants.ar) {
      return AppLanguage.ar;
    } else {
      return AppLanguage.en;
    }
  }

  // This Function is used to get the current language of the app
  // based on the language code it will return proper font family
  static String getFontFamily(BuildContext context) {
    AppLanguage lang = getCurrentLanguageByContext(context);
    if (lang == AppLanguage.ar) {
      return AppConstants.lamaFont;
    } else {
      return AppConstants.tommyFont;
    }
  }

  static String getLanguageCode(BuildContext context) {
    AppLanguage lang = getCurrentLanguageByContext(context);
    if (lang == AppLanguage.ar) {
      return AppConstants.ar;
    } else {
      return AppConstants.en;
    }
  }
  /// This Function is used to get the current language of the system
  /// it's important to use this function to determine the initial language based on the [system] language
  /// when the user opens the app for the first time
  static String getSystemLanguage() {
    Locale locale = PlatformDispatcher.instance.locale;
    if (locale.languageCode == AppConstants.ar) {
      return AppConstants.ar;
    } else {
      return AppConstants.en;
    }
  }
}

// useless enum
// will be removed soon
enum AppLanguage { ar, en }
