import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/config/data/models/country_model.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/animation/custom_switcher_animation.dart';
import 'package:tarweej_platform/core/helpers/app_assets.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';
import 'package:tarweej_platform/features/auth/features/providers/phone/presentation/logic/country/country_changer_notifier.dart';

part 'country_selector_button.dart';

// consumer stateFullWidget
class CountriesListviewBuilder extends ConsumerStatefulWidget {
  const CountriesListviewBuilder({super.key});

  @override
  ConsumerState<CountriesListviewBuilder> createState() =>
      _CountriesListviewBuilderState();
}

class _CountriesListviewBuilderState
    extends ConsumerState<CountriesListviewBuilder> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // reset the countries list when the widget is built
    // to avoid the list to be filled with the previous search results
    // The docs of Riverpod do not recommend any changing of Provider during the build process

    // Microtask
    // Microtask is used to avoid the error of changing the state during the build process
    // It Make the widget stable and build asynchroniously ,then change the state
    Future.microtask(() {
      ref.read(countryChangerProvider.notifier).reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(countryChangerProvider);
    return Expanded(
      child: CustomSwitcherAnimation(
        firstChild: ListView.builder(
          itemCount: state.countries.length,
          itemBuilder: (context, index) {
            return InkWell(
                borderRadius: AppBorderRadius.circularAll13,
                onTap: () {
                  ref
                      .read(countryChangerProvider.notifier)
                      .changeCountry(state.countries[index]);
                  context.navigateBack();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: CountrySelectorButton(country: state.countries[index]),
                ));
          },
        ),
        secondChild: Center(
          child: Text(context.translate.noResults),
        ),
        isSwitched: state.countries.isNotEmpty,
      ),
    );
  }
}
