import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPadding {
  static EdgeInsets syHorizontal23 = EdgeInsets.symmetric(horizontal: 23.w);
  
}

class AppMargin {
  static EdgeInsets syHorizontal23 = EdgeInsets.symmetric(horizontal: 23.w);
}
class AppBorderRadius{
  static  BorderRadius circularAll15=BorderRadius.all(Radius.circular(15.r));
  static  BorderRadius circularAll13=BorderRadius.all(Radius.circular(13.r));
  static  BorderRadius circularAll6=BorderRadius.all(Radius.circular(6.r));
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
