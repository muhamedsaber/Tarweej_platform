import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton(
      {super.key,
      this.backgroundColor,
      this.padding,
      required this.title,
      this.style,
      this.width,
      this.borderRadius,
      required this.onPressed});
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final void Function()? onPressed;
  final String title;
  final TextStyle? style;
  final double? width;
  final BorderRadius? borderRadius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? context.theme.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius??AppBorderRadius.circularAll15,
            ),
            padding: padding ??
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 11.h)),
        child: Text(
          title,
          style: style ?? context.theme.font18OnSurfaceMedium,
        ),
      ),
    );
  }
}
