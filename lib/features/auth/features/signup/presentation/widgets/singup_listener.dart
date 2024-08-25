import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/alerts/app_alers.dart';
import 'package:tarweej_platform/core/alerts/app_dialogs.dart';
import 'package:tarweej_platform/core/common_ui/widgets/app_text_button.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';
import 'package:tarweej_platform/features/auth/features/signup/presentation/notifiers/signup/signup_state_notifier.dart';

class SignupListener extends ConsumerWidget {
  const SignupListener({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SignupState>(signupNotifierProvider, (previous, state) {
      if (state is SignupSuccess) {
        if (previous is SignupLoading) {
          AppLoadingIndicator.hide(context);
        }
      } else if (state is SignupError) {
        if (previous is SignupLoading) {
          AppLoadingIndicator.hide(context);
        }
        _buildErrorDialog(context, state);
      } else if (state is SignupLoading) {
        AppLoadingIndicator.show(context);
      }
    });
   
    return const SizedBox.shrink();
  }
  
  // Show error dialog when signup fails
  _buildErrorDialog(BuildContext context, SignupError state) {
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
