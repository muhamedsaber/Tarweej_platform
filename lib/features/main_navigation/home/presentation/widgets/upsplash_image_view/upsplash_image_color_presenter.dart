import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/alerts/app_toasts.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';

class UpsplashImageColorPresenter extends StatelessWidget {
  const UpsplashImageColorPresenter({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    width: double.infinity,
                    height: 200.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
                      color: color,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "#${color.value.toRadixString(16).substring(2)}",
                          style: context.theme.font32OnSurfaceMedium,
                        ),
                        verticalSpace(10),
                        ElevatedButton(
                            onPressed: () {
                              final textToCopy =
                                  "#${color.value.toRadixString(16).substring(2)}";
                              Clipboard.setData(
                                  ClipboardData(text: textToCopy));
                              // show a toast message when the color is copied to tell user that the color is copied
                              AppToasts.showToast(
                                  message: context.translate.colorCopied,
                                  position: ToastPosition.top,
                                  context: context);
                            },
                            child: Text(
                              context.translate.copy,
                              style: context.theme.font16OnSurfaceRegular,
                            )),
                      ],
                    ),
                  );
                });
          },
          child: Container(
            height: 30.h,
            width: 30.h,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        )
      ],
    );
  }
}
