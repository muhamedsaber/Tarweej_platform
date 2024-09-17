import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/config/data/cache/cache_constants.dart';
import 'package:tarweej_platform/config/data/cache/cache_manager.dart';
import 'package:tarweej_platform/config/language/localization_herlper.dart';

class LanguageChanger extends StateNotifier<String> {
  // passing the initial state into super class
  // This is important to inject initial value outside the class 
  // But Why? 
  // to give initial state when creating the instance of the class
  // But Why? 
  // the problem is doing some async operation first and this operation will determine the initial state
  // by getting the language from the cache i cannot directly creating a new instance of the class with this async issue
  // so i do asynchronus operation first then injecting a brand new initial state to the class
  LanguageChanger(super.language);

  changeLanguage(String language) async {
    // if the selected language is the same as the current language
    // Then There is no need to update cache and changing the state with the same value
    // terminating using return; nothing will be executed after it.
    if (state == language) {
      // terminating the function
      return;
    }
    state = language;
    // updating the cache with new language
    await CacheHelper.setData(key: CacheConstants.appLanguage, value: language);
  }
}

final languageChangerProvider = StateNotifierProvider<LanguageChanger, String>(
  /// its important to get the System language at the first time user opening app
  /// but in my case [LanguageChanger] is being replaced by new instance with the cached language
  /// in the [ProviderScope] in the main.dart file
  /// keep in ming that this is redundant and can be removed but for the sake of the example i will keep it,
  /// Why it's redundant? because i will replace the instance of the class with the new instance in the main.dart file
  (ref) => LanguageChanger(LocalizationHelper.getSystemLanguage()),
);
