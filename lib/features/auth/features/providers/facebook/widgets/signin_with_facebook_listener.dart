import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/alerts/app_alers.dart';
import 'package:tarweej_platform/core/alerts/app_dialogs.dart';
import 'package:tarweej_platform/core/common_ui/widgets/app_text_button.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';
import 'package:tarweej_platform/features/auth/features/providers/facebook/logic/signin_with_facebook_notifier.dart';

class SigninWithFacebookListener extends ConsumerWidget {
  const SigninWithFacebookListener({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SigninWithFacebookState>(
      signInWithFacebookProvider,
      (previous, state) {
        log(state.toString());
        if (state is SigninWithFacebookLoading) {
          if (previous is SigninWithFacebookLoading) {
            AppLoadingIndicator.hide(context);
          }
        } else if (state is SigninWithFacebookError) {
          if (previous is SigninWithFacebookLoading) {
            AppLoadingIndicator.hide(context);
          }
          _buildErrorDialog(context, state);
        } else if (state is SigninWithFacebookLoading) {
          AppLoadingIndicator.show(context);
        }
      },
    );
    return const SizedBox.shrink();
  }

  _buildErrorDialog(BuildContext context, SigninWithFacebookError state) {
    AppDialogs.showAlertDialog(
      context: context,
      icon: state.error.icon,
      title: state.error.message,
      actions: [
        Center(
          child: AppTextButton(
            title: context.translate.gotIt,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
            borderRadius: AppBorderRadius.circularAll6,
            style: context.theme.font14OnSurfaceMedium,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        )
      ],
    );
  }
}
