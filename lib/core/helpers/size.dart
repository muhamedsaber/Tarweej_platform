import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPadding {
  static EdgeInsets syHorizontal23 = EdgeInsets.symmetric(horizontal: 23.w);
}

class AppMargin {
  static EdgeInsets syHorizontal23 = EdgeInsets.symmetric(horizontal: 23.w);
}

SizedBox horizontalSpace(double width) {
  return SizedBox(
    width: width.w,
  );
}
SizedBox verticalSpace(double height) {
  return SizedBox(
    height: height.h,
  );
}
