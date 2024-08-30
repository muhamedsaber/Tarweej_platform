import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/config/router/routes.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/features/auth/features/providers/phone/logic/country/country_changer_notifier.dart';

class CountryCode extends StatelessWidget {
  const CountryCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(countryChangerProvider);
        return InkWell(
          onTap: () => context.navigateTo(Routes.changeCountryView),
          child: Text(
            state.country.getCountryCodeOrderd(context),
            style: context.theme.font16SecondaryRegular,
          ),
        );
      },
    );
  }
}
