import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';

import '../../../../core/common_ui/widgets/app_text_button.dart';
import '../../../../core/helpers/size.dart';
import '../../../../core/notifiers/media/media_permission_notifier.dart';

class MediaPermissionNotGranted extends StatelessWidget {
  const MediaPermissionNotGranted(
      {super.key, required this.status, required this.ref});
  final PermissionStatus status;
  final WidgetRef ref;
  @override
  Widget build(BuildContext context) {
    final String buttonTitle = status == PermissionStatus.denied
        ? context.translate.givePermission
        : context.translate.openSettings;

    return Container(
      padding: AppPadding.screenHorizontal23,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.translate.noPhotosAccess,
            style: context.theme.font18OnSurfaceMedium,
          ),
          verticalSpace(10),
          Text(
            context
                .translate.toContinuetarweejNeedsAccessToThePhotosOnYourDevice,
            style: context.theme.font16SecondaryRegular,
            textAlign: TextAlign.center,
          ),
          verticalSpace(10),
          AppTextButton(
            title: buttonTitle,
            onPressed: () {
              if (status == PermissionStatus.denied) {
                ref
                    .read(mediaPermissionProvider.notifier)
                    .requestMediaPermission();
              } else if (status == PermissionStatus.permanentlyDenied) {
                ref.read(mediaPermissionProvider.notifier).openSettings();
              }
            },
          )
        ],
      ),
    );
  }
}
