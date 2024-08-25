import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';

class AppLoadingIndicator {
  static show(BuildContext context) {
    showAdaptiveDialog(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Container(
            height: 60.h,
            width: 60.h,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 6,
                )
              ],
              color: context.theme.primaryColor,
              borderRadius: AppBorderRadius.circularAll13,
            ),
            child: Center(
              child: CircularProgressIndicator(
                color: context.theme.colorScheme.onPrimary,
              ),
            ),
          ),
        );
      },
    );
  }

  static hide(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.of(context).pop();
    }
  }
}
