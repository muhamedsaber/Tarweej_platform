import 'package:flutter/material.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';

import '../../../../../config/router/routes.dart';
import '../../../../../core/alerts/app_toasts.dart';
import '../../../../../core/common_ui/widgets/app_icon_button.dart';

class OpenUpsplashImageInWebViewButton extends StatelessWidget {
  const OpenUpsplashImageInWebViewButton(
      {super.key, required this.url, this.onOpen});
  final String? url;
  final VoidCallback? onOpen;
  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      icon: Icons.language,
      onTap: () async {
        // This onOpen callback is used to perform any action before sharing the image
        // for Example: tracking the user action to close diaolg and then share the image
        if (onOpen != null) {
          onOpen!();
        }
        if (url == null) {
          if (context.mounted) {
            AppToasts.showToast(
                message: context.translate.theImageLinkIsExpiredOrNoMoreExist,
                context: context);
          }
        } else {
          if (context.mounted) {
            context.navigateTo(Routes.publisherProfileWebView, arguments: url);
          }
        }
      },
    );
  }
}
