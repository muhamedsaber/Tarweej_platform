import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/networking/api/api_error_model.dart';
import 'package:tarweej_platform/core/networking/api/local_status_code.dart';

import '../../helpers/size.dart';

class CustomError extends StatelessWidget {
  const CustomError(
      {super.key, required this.error, this.isFullScreen = false});
  final ApiErrorModel error;
  final bool isFullScreen;
  @override
  Widget build(BuildContext context) {
    IconData icon = Icons.error;
    if (error.statusCode != null) {
      switch (error.statusCode) {
        case LocalStatusCodes.noInternetConnection:
          icon = Icons.wifi_off;
          break;

        case LocalStatusCodes.badCertificate:
          icon = Icons.warning;
          break;
        case LocalStatusCodes.receiveTimeout:
          icon = Icons.timer;
          break;
        case LocalStatusCodes.sendTimeout:
          icon = Icons.timer;
          break;
        case LocalStatusCodes.connectTimeout:
          icon = Icons.timer;
          break;

        default:
          icon = Icons.error;
      }
    }
    return Container(
      height: isFullScreen ? context.screenHeight : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50.h,
              color: context.theme.colorScheme.secondary,
            ),
            verticalSpace(20),
            Text(
              error.errorMessage ?? "Error Occured",
              textAlign: TextAlign.center,
              style: context.theme.font20SecondaryRegular,
            ),
          ],
        ),
      ),
    );
  }
}
