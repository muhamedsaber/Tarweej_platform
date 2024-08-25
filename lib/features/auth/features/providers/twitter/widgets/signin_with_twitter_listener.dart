


import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/alerts/app_alers.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/features/auth/features/providers/twitter/logic/signin_with_twitter_notifier.dart';

import '../../../../../../core/alerts/app_dialogs.dart';
import '../../../../../../core/common_ui/widgets/app_text_button.dart';
import '../../../../../../core/helpers/size.dart';

class SigninWithTwitterListener extends ConsumerWidget {
  const SigninWithTwitterListener({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SigninWithTwitterState>(
      signInWithTwitterProvider ,
      (previous, state) {
        log(state.toString());
        if (state is SigninWithTwitterLoading) {
          if (previous is SigninWithTwitterLoading) {
            AppLoadingIndicator.hide(context);
          }
        } else if (state is SigninWithTwitterError) {
          if (previous is SigninWithTwitterLoading) {
            AppLoadingIndicator.hide(context);
          }
          _buildErrorDialog(context, state);
        } else if (state is SigninWithTwitterLoading) {
          AppLoadingIndicator.show(context);
        }
      },
    );
    return const SizedBox.shrink();
  }

  _buildErrorDialog(BuildContext context, SigninWithTwitterError state) {
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
