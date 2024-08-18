import 'package:intl/intl.dart';
import 'package:tarweej_platform/core/helpers/app_constants.dart';

class LocalizationHerlper {
 static AppLanguage getCurrentLanguageByIntl() {
    String lang = Intl.getCurrentLocale();
    if (lang == AppConstants.ar) {
      return AppLanguage.ar;
    } else {
      return AppLanguage.en;
    }
  }
}

enum AppLanguage { ar, en }
