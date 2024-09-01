import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/config/router/routes.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/alerts/app_dialogs.dart';
import 'package:tarweej_platform/core/common_ui/widgets/app_text_button.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_error_codes.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_error_model.dart';

class FirebaseErrorDialog {
  static show(BuildContext context, FirebaseErrorModel model) {
    bool isAccountExist = model.code ==
        FirebaseErrorCodes.accountAlreadyExistWithDifferentCredentials;
    AppDialogs.showAlertDialog(
        context: context,
        icon: model.icon,
        title: model.message,
        message:
            isAccountExist ? context.translate.doYouWantToLoginInstead : null,
        actions: isAccountExist
            ? [
                Center(
                  child: AppTextButton(
                    title: context.translate.login,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
                    borderRadius: AppBorderRadius.circularAll6,
                    style: context.theme.font14OnSurfaceMedium,
                    onPressed: () {
                      Navigator.of(context).pop();
                      context.navigateTo(Routes.loginView);
                    },
                  ),
                ),
                Center(
                  child: AppTextButton(
                    title: context.translate.dismiss,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
                    borderRadius: AppBorderRadius.circularAll6,
                    style: context.theme.font14OnSurfaceMedium,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                )
              ]
            : [AppDialogs.okButton(context),]);
  }
}
