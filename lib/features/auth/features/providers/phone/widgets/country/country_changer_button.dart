part of "../phone/phone_number_section.dart";

class CountryChangerButton extends ConsumerWidget {
  const CountryChangerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(countryChangerProvider);
    return Expanded(
      child: InkWell(
        onTap: () => context.navigateTo(Routes.changeCountryView),
        child: Container(
          padding: AppPadding.syHorizontal14,
          child: Row(
            children: [
              Text(
                state.country.getTranslatedCountryName(context),
                style: context.theme.font16SecondaryRegular,
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: context.theme.colorScheme.secondary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
