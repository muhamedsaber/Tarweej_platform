import 'package:flutter/material.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';
import 'package:tarweej_platform/features/auth/features/providers/phone/widgets/phone_number_auth_listener.dart';
import 'package:tarweej_platform/features/auth/features/providers/phone/widgets/phone/phone_number_form.dart';

class PhoneAuthView extends StatelessWidget {
  const PhoneAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: AppPadding.screenHorizontal23,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.translate.enterPhoneNumber,
                style: context.theme.font25OnSurfaceMedium,
              ),
              verticalSpace(14),
              const PhoneNumberForm(),
              const PhoneNumberAuthListener()
            ],
          ),
        ),
      ),
    );
  }
}
