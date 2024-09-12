part of 'countries_listview_builder.dart';

class CountrySelectorButton extends StatelessWidget {
  const CountrySelectorButton({super.key, required this.country});
  final CountryModel country;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
      child: Row(
        children: [
          FadeInImage.assetNetwork(
            imageErrorBuilder: (context, error, stackTrace) {
              return SizedBox(
                width: 25.w,
                height: 25.h,
              );
            },
            placeholder: AppAssets.loadingGiff,
            image: country.flag,
            width: 25.w,
            height: 25.h,
          ),
          horizontalSpace(10),
          Text(
            country.getTranslatedCountryName(context),
            style: context.theme.font16SecondaryRegular,
          ),
          const Spacer(),
          Text(
            country.getCountryCodeOrderd(context),
            style: context.theme.font16SecondaryRegular,
          ),
        ],
      ),
    );
  }
}
