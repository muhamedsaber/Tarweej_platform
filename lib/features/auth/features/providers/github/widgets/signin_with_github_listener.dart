
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
import 'package:tarweej_platform/features/auth/features/providers/github/logic/signin_with_github_notifier.dart';

class SigninWithGitHubListener extends ConsumerWidget {
  const SigninWithGitHubListener({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SigninWithGitHubState>(
      signInWithGitHubProvider,
      (previous, state) {
        log(state.toString());
        if (state is SigninWithGitHubLoading) {
          if (previous is SigninWithGitHubLoading) {
            AppLoadingIndicator.hide(context);
          }
        } else if (state is SigninWithGitHubError) {
          if (previous is SigninWithGitHubLoading) {
            AppLoadingIndicator.hide(context);
          }
          _buildErrorDialog(context, state);
        } else if (state is SigninWithGitHubLoading) {
          AppLoadingIndicator.show(context);
        }
      },
    );
    return const SizedBox.shrink();
  }

  _buildErrorDialog(BuildContext context, SigninWithGitHubError state) {
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
