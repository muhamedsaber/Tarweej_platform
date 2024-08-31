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
      final String systemLanguage = getSystemLanguage();
      if (systemLanguage == AppConstants.ar) {
        return AppConstants.ar;
      } else {
        return AppConstants.en;
      }
    } else {
      return lang;
    }
  }

  // DO NOT USE THIS METHOD ON WIDGETS
  // BECAUSE IT WILL NOT UPDATE THE UI WHEN THE LANGUAGE CHANGES
  static AppLanguage getCurrentLanguageByIntl() {
    String lang = Intl.getCurrentLocale();
    if (lang == AppConstants.ar) {
      return AppLanguage.ar;
    } else {
      return AppLanguage.en;
    }
  }

  //
  static AppLanguage getCurrentLanguageByContext(BuildContext context) {
    final local = Localizations.localeOf(context);

    if (local.languageCode == AppConstants.ar) {
      return AppLanguage.ar;
    } else {
      return AppLanguage.en;
    }
  }

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
