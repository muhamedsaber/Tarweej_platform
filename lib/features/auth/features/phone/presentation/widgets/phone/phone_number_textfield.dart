import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/helpers/app_regex.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';

import '../../logic/country/country_changer_notifier.dart';
import '../../logic/phone/phone_auth_notifier.dart';
import '../country/country_code.dart';

class PhoneNumberTextField extends ConsumerStatefulWidget {
  const PhoneNumberTextField({super.key});

  @override
  ConsumerState<PhoneNumberTextField> createState() =>
      _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends ConsumerState<PhoneNumberTextField> {
  late TextEditingController _controller;
  late int _maxPhoneLength;
  String _phoneLength = "0";

  @override
  void initState() {
    super.initState();
    _controller = ref.read(phoneAuthProvider.notifier).phoneController;
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    super.dispose();
  }

  // updating the phone length counter
  void _onTextChanged() {
    setState(() {
      _phoneLength = _controller.text.length.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    _maxPhoneLength =
        ref.watch(countryChangerProvider).country.phoneNumberLengthWithoutCode;

    /// Enforce LTR text [direction] for the phone number
    /// to avoid issues with the country code Ordering in the UI
    /// i already solved it in the [CountryModel] but since the ordering of phoneNumbers
    /// is from right to left it's better to make CountryCode comes before the phone number.
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Expanded(
        child: Padding(
          padding: AppPadding.syHorizontal14,
          child: Row(
            children: [
              // Country code widget
              const CountryCode(),
              horizontalSpace(10),
              // Vertical divider
              VerticalDivider(
                thickness: 0.7,
                width: 1,
                color: context.theme.colorScheme.secondary,
              ),
              horizontalSpace(10),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // TextField Counter for the phone number
                    Positioned(
                      right: 0,
                      child: Text(
                        '$_phoneLength / $_maxPhoneLength',
                        style: context.theme.font16SecondaryRegular,
                      ),
                    ),
                    // Phone number text field
                    TextFormField(
                      maxLength: _maxPhoneLength,
                      validator: _validatePhoneNumber,
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterText: "",
                        hintText: context.translate.PhoneNumber,
                        hintStyle: context.theme.font16SecondaryRegular,
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // phone number validation
  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return context.translate.thisFieldIsRequired;
    } else if (!value.contains(AppRegex.onlyNumbers)) {
      return context.translate.EnterValidPhoneNumber;
    } else if (value.length < _maxPhoneLength) {
      return '${context.translate.PhoneNumbersMustBeAtLeast} $_maxPhoneLength';
    }
    return null;
  }
}
