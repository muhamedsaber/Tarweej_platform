
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';
import 'package:tarweej_platform/features/auth/features/login/presentation/notifier/reset_password.dart/reset_password_notifier.dart';

class CheckYourEmailBox extends ConsumerWidget {
  const CheckYourEmailBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(resetPasswordNotifierProvider.notifier);
    return Column(
      children: [
        verticalSpace(20),
        Icon(Icons.email,
            size: 80.h, color: context.theme.colorScheme.onSurface),
        Text(
          context.translate.CheckYourEmail,
          style: context.theme.font14OnSurfaceMedium.copyWith(
            color: context.theme.colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
        verticalSpace(4),
        Text(
          notifier.emailController.text,
          style: context.theme.font14OnSurfaceMedium,
        ),
      ],
    );
  }
}
