import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/config/router/routes.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';
import 'package:tarweej_platform/features/auth/features/providers/phone/logic/country/country_changer_notifier.dart';
import 'package:tarweej_platform/features/auth/features/providers/phone/widgets/phone/phone_number_textfield.dart';
part '../country/country_changer_button.dart';

class PhoneNumberSection extends StatefulWidget {
  const PhoneNumberSection({super.key});

  @override
  State<PhoneNumberSection> createState() => _PhoneNumberSectionState();
}

class _PhoneNumberSectionState extends State<PhoneNumberSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    startAnimation();
    super.initState();
  }

  // Start animation for the phone number section
  startAnimation() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      fixedCrossAxisSizeFactor: 10,
      axisAlignment: -1,
      axis: Axis.vertical,
      sizeFactor: _controller,
      child: Container(
        alignment: Alignment.center,
        height: 100.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.theme.colorScheme.surface,
          borderRadius: AppBorderRadius.circularAll13,
          border: Border.all(
            color: context.theme.colorScheme.secondary,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CountryChangerButton(),
            Divider(
              thickness: 0.7,
              height: 1.h,
              color: context.theme.colorScheme.secondary,
            ),
            const PhoneNumberTextField()
          ],
        ),
      ),
    );
  }
}
