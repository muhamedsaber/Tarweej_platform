import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/config/data/models/country_model.dart';

part 'country_changer_states.dart';

class CountryChangerNotifier extends StateNotifier<CountryChangerStates> {
  CountryChangerNotifier() : super(CountryChangerInitial());
  CountryModel defaultCountry =
      countriesList.where((country) => country.englishName == 'Egypt').first;

  // Searching for a country by its name in Arabic or English.
  void filterCountries(String query) {
    List<CountryModel> filteredCountries = List.from(countriesList
        .where((country) =>
            country.arabicName.toLowerCase().contains(query.toLowerCase()) ||
            country.englishName.toLowerCase().contains(query.toLowerCase()))
        .toList());
    state = CountryChangerSuccess(state.country, filteredCountries);
  }

  // After user select a country, this method will change the country.
  void changeCountry(CountryModel country) {
    state = CountryChangerSuccess(country, state.countries);
  }
  
  // After user Search for a country and select one, this method will reset the list to the original list.
  // But Why??
  // When user go out of the search screen and come back,
  // the list will be the carry old search result and that's bad because user will not see the original list.
  // This method will reset the list to the original list.
  // Every time user goes to the screen The Entire List will be shown. Not The Filtered List 'old search result'.
  // its required NOT OPTIONAL. For better user experience.
  reset() {
    state = CountryChangerSuccess(state.country, List.from(countriesList));
  }
}

final countryChangerProvider =
    StateNotifierProvider<CountryChangerNotifier, CountryChangerStates>(
        (ref) => CountryChangerNotifier());
