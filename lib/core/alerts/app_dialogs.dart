import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/common_ui/widgets/app_text_button.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';

class AppDialogs {
  static void showAlertDialog({
    required BuildContext context,
    String? title,
    String? message,
    List<Widget>? actions,
    IconData? icon,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0,
          actionsOverflowButtonSpacing: 20.w,
          contentPadding:
              EdgeInsets.only(top: 0.h, left: 35.w, right: 35.w, bottom: 30.h),
          titlePadding: EdgeInsets.only(
              top: 40.h,
              left: 30.w,
              right: 30.w,
              bottom: message != null ? 20.h : 30.h),
          shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadius.circularAll13,
          ),
          icon: icon == null
              ? null
              : Icon(
                  icon,
                  size: 70,
                ),
          iconPadding:
              icon == null ? EdgeInsets.zero : EdgeInsets.only(top: 20.h),
          iconColor: Theme.of(context).colorScheme.onSurface,
          title: title != null
              ? Text(
                  title,
                  style: context.theme.font18OnSurfaceMedium,
                )
              : null,
          content: message != null
              ? Text(
                  message,
                  style: context.theme.font18OnSurfaceMedium,
                )
              : null,
          actions: actions,
        );
      },
    );
  }
  
  
}
