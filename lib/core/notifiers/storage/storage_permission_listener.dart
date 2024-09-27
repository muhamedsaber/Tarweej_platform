import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/features/main_navigation/home/presentation/logic/download_upsplash_image/download_upsplash_image_notifier.dart';

import '../../alerts/app_dialogs.dart';
import '../../common_ui/widgets/app_text_button.dart';
import 'storage_permission_notifier.dart';

class StoragePermissionListener extends ConsumerWidget {
  const StoragePermissionListener({super.key, required this.imageDownloadUrl});
  final String imageDownloadUrl;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      storagePermissionProvider,
      (previous, next) {
        if (next is StoragePermissionGranted) {
          ref
              .watch(downloadUpsplashImageProvider.notifier)
              .downloadImage(url: imageDownloadUrl);
        } else if (next is StoragePermissionDenied) {
          AppDialogs.showAlertDialog(
            context: context,
            icon: Icons.storage_outlined,
            actions: [
              AppTextButton(
                onPressed: () {
                  context.navigateBack();
                  ref
                      .read(storagePermissionProvider.notifier)
                      .requestStoragePermission();
                },
                title: context.translate.givePermission,
              ),
            ],
            message: context
                .translate.toContinuetarweejNeedsAccessToTheStorageOnYourDevice,
            title: context.translate.noStorageAccess,
          );
        } else if (next is StoragePermissionPermanentlyDenied) {
          AppDialogs.showAlertDialog(
            context: context,
            icon: Icons.storage_outlined,
            actions: [
              AppTextButton(
                onPressed: () {
                  context.navigateBack();
                  ref.read(storagePermissionProvider.notifier).openSettings();
                },
                title: context.translate.openSettings,
              ),
            ],
            title:
                context.translate.youMustGoToSettingsAndGiveStoragePermission,
          );
        }
      },
    );
    return const SizedBox();
  }
}
