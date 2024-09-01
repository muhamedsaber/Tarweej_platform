part of "country_changer_notifier.dart";

// This file defines two states: Initial and Success.
abstract class CountryChangerStates {
  final List<CountryModel> countries;
  final CountryModel country;
  CountryChangerStates(this.countries, this.country);
}

// Initial State:
// - Contains the original list of countries.
// - with the default country "Egypt".
class CountryChangerInitial extends CountryChangerStates {
  CountryChangerInitial()
      : super(
            List.from(countriesList),
            countriesList
                .where((element) => element.englishName == "Egypt")
                .first);
}

// Success State:
// - Contains a list of countries that can either be:
//   1. The original list if the user only changes the country without applying any filters.
//   2. A new filtered list based on user selection.
// - The default country is set to Egypt or the country selected by the user.
class CountryChangerSuccess extends CountryChangerStates {
  CountryChangerSuccess(CountryModel country, List<CountryModel> countries)
      : super(countries, country);
}

// SORRY FOR MAKING INHERITANCE LIKE THIS.
// BUT AT THE END I WOULD LIKE TO KEEP UI PART CLEAN AND SEPARATED FROM THE LOGIC.
// FUCK IF AND ELSE STATEMENTS
// NOW IM ABLE TO ONLY LISTEN AND BUILD THE STATE WHATEVER THE STATE IS
// ALL OF THEM CARRY CONTRIES LIST AND CONTRY EITHER ITS INITIAL VALUE OR FILTERED VALUE