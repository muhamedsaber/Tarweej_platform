import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton(
      {super.key,
      this.icon,
      this.iconColor,
      this.iconSize,
      this.backgroundColor,
      this.borderRadius,
      this.shadowColor,
      this.onTap});
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final Color? shadowColor;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        //shadow

        alignment: Alignment.center,
        style: ElevatedButton.styleFrom(
          shadowColor: shadowColor ?? Colors.black.withOpacity(0.5),
          elevation: 6,
          alignment: Alignment.center ,
          // but the icon in the center
          
          backgroundColor: backgroundColor ?? Colors.white,
          shape: RoundedRectangleBorder(
            
            borderRadius: borderRadius ?? BorderRadius.circular(11.r),
          ),
        ),
        icon: Icon(icon ?? Icons.import_contacts,
        
            color: iconColor ?? context.theme.primaryColor, size: iconSize),
        onPressed: onTap);
  }
}
