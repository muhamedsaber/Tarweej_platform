
import 'package:flutter/material.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/localization_herlper.dart';

class SignupHeadline extends StatelessWidget {
  const SignupHeadline({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

         Text(
             context.translate.welcome,
              style: context.theme.font32OnSurfaceMedium,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: context.translate.create,
                    style: context.theme.font24SecondaryRegular.copyWith(
                      fontFamily: LocalizationHelper.getFontFamily(context),
                    ),
                  ),
                  TextSpan(
                    text: context.translate.yourAccount,
                    style: context.theme.font24OnSurfaceRegular.copyWith(
                      fontFamily: LocalizationHelper.getFontFamily(context),
                    ),
                  )
                ],
              ),
            ),
            Text(
              context.translate.toContinue,
              style: context.theme.font24SecondaryRegular,
            )
      ],
    );
  }
}