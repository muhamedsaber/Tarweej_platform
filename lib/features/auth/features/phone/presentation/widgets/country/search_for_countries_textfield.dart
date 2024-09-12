
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';

import '../../../../../../../../core/common_ui/widgets/app_text_field.dart';
import '../../logic/country/country_changer_notifier.dart';

class SearchForCountryTextField extends StatefulWidget {
  const SearchForCountryTextField({super.key});

  @override
  State<SearchForCountryTextField> createState() =>
      _SearchForCountryTextFieldState();
}

class _SearchForCountryTextFieldState extends State<SearchForCountryTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final notifier = ref.watch(countryChangerProvider.notifier);
        _controller.addListener(() {
          notifier.filterCountries(_controller.text);
        });

        return AppTextField(
          hintText: context.translate.search,
          prefixIcon: const Icon(Icons.search),
          controller: _controller,
        );
      },
    );
  }
}
