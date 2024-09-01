import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';

class SheetBody extends StatelessWidget {
  const SheetBody({super.key,  this.children, this.height,
  
   this.sheetBackgroundColor,
    this.borderRadius,
    this.draggbleSheetColor
   });
  final Widget? children;
  final double? height;
  final Color? sheetBackgroundColor ;
  final BorderRadius? borderRadius; 
  final Color? draggbleSheetColor;
  @override
  Widget build(BuildContext context) {

    return Container(
        height: height ?? 400.h,
        padding: AppPadding.screenHorizontal23,
        width:context.screenWidth,
        decoration: BoxDecoration(
          color:sheetBackgroundColor?? context.theme.colorScheme.surface,
          borderRadius:borderRadius?? BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 10.h),
            width: 50.w,
            height: 5.h,
            decoration: BoxDecoration(
              color:draggbleSheetColor?? context.theme.colorScheme.onSurface,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          verticalSpace(10),
          children??const SizedBox.shrink()
        ]));
  }
}
