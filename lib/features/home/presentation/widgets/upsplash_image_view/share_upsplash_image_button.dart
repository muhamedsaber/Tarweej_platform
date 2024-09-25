import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tarweej_platform/core/alerts/app_toasts.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';

import '../../../../../core/common_ui/widgets/app_icon_button.dart';
import '../../../data/models/upsplash_image_model.dart';

class ShareUpsplashImageButton extends StatelessWidget {
  const ShareUpsplashImageButton({
    super.key,
    required this.image,
    this.onShare,
  });
  final UpsplashImageModel image;
  final VoidCallback? onShare;
  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      icon: Icons.share,
      onTap: () async {
        // This onShare callback is used to perform any action before sharing the image
        // for Example: tracking the user action to close diaolg and then share the image
        if (onShare != null) {
          onShare!();
        }
        final status = await Share.share(image.links?.html ?? "");
        if (status.status == ShareResultStatus.success) {
          if (context.mounted) {
            AppToasts.showToast(
              message: context.translate.thanksForSharing,
              context: context,
            );
          }
        }
      },
    );
  }
}
