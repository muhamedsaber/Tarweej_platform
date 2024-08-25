import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/alerts/app_alers.dart';
import 'package:tarweej_platform/core/alerts/app_dialogs.dart';
import 'package:tarweej_platform/core/common_ui/widgets/app_text_button.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';
import 'package:tarweej_platform/features/auth/features/providers/google/logic/signin_with_google_state.dart';
import 'package:tarweej_platform/features/auth/features/providers/google/logic/singin_with_google_notifier.dart';

class SigninWithGoogleListener extends ConsumerWidget {
  const SigninWithGoogleListener({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SigninWithGoogleState>(
      signInWithGoogleProvider,
      (previous, state) {
        log(state.toString());
        if (state is SigninWithGoogleSuccess) {
          if (previous is SigninWithGoogleLoading) {
            AppLoadingIndicator.hide(context);
          }
        } else if (state is SigninWithGoogleError) {
          if (previous is SigninWithGoogleLoading) {
            AppLoadingIndicator.hide(context);
          }
          _buildErrorDialog(context, state);
        } else if (state is SigninWithGoogleLoading) {
          AppLoadingIndicator.show(context);
        }
      },
    );
    return const SizedBox.shrink();
  }

  _buildErrorDialog(BuildContext context, SigninWithGoogleError state) {
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
