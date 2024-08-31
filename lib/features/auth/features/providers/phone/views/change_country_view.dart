import 'package:flutter/material.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';
import 'package:tarweej_platform/features/auth/features/providers/phone/widgets/country/search_for_countries_textfield.dart';

import '../widgets/country/countries_listview_builder.dart';

class ChangeCountryView extends StatelessWidget {
  const ChangeCountryView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: Text(
                context.translate.chooseYourCountry,
              ),
              leading: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  context.navigateBack();
                },
              )),
          body: Padding(
            padding: AppPadding.screenHorizontal23,
            child: Column(
              children: [
                verticalSpace(10),
                const SearchForCountryTextField(),
                verticalSpace(10),
                const CountriesListviewBuilder()
              ],
            ),
          ),
        ));
  }
}
