import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tarweej_platform/core/helpers/app_constants.dart';

class LocalizationHelper {
  static AppLanguage getCurrentLanguageByIntl() {
    String lang = Intl.getCurrentLocale();
    if (lang == AppConstants.ar) {
      return AppLanguage.ar;
    } else {
      return AppLanguage.en;
    }
  }

  static AppLanguage getCurrentLanguageByContext(BuildContext context) {
    final local = Localizations.localeOf(context);
    if (local.languageCode == AppConstants.ar) {
      return AppLanguage.ar;
    } else {
      return AppLanguage.en;
    }
  }
  static String getFontFamily(BuildContext context) {
    AppLanguage lang =getCurrentLanguageByContext(context);
    if (lang == AppLanguage.ar) {
      return AppConstants.lamaFont;
    } else {
      return AppConstants.tommyFont;
    }
  }
}

enum AppLanguage { ar, en }
