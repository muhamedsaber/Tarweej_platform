
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/core/alerts/app_dialogs.dart';
import 'package:tarweej_platform/core/alerts/app_toasts.dart';
import 'package:tarweej_platform/core/common_ui/widgets/app_text_button.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/features/main_navigation/home/presentation/logic/download_upsplash_image/download_upsplash_image_notifier.dart';
import 'package:tarweej_platform/features/main_navigation/home/presentation/logic/download_upsplash_image/download_upsplash_image_state.dart';

import '../../../../../../core/common_ui/widgets/app_icon_button.dart';
import '../../../data/models/upsplash_image_model.dart';

class DownloadUpsplashImageButton extends ConsumerWidget {
  const DownloadUpsplashImageButton({
    super.key,
    required this.image,
    this.onShare,
  });
  final UpsplashImageModel image;
  final VoidCallback? onShare;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier= ref.watch(downloadUpsplashImageProvider.notifier);
    return AppIconButton(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Container(
              decoration: BoxDecoration(
                color: context.theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              height: 200.h,
              width: context.screenWidth,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppTextButton(
                      width: 300.w,
                        backgroundColor: context.theme.colorScheme.surface,
                      onPressed: () {
                           context.navigateBack();
                        notifier.downloadImage(url: image.urls?.small?? "");
                      },
                      title: context.translate.smallSize,
                    ),
                    AppTextButton(
                      backgroundColor: context.theme.colorScheme.surface,
                      width: 300.w,
                      onPressed: () {
                        context.navigateBack();
                        notifier.downloadImage(url: image.urls?.regular?? "");
                      },
                      title: context.translate.mediumSize,
                    ),
                    AppTextButton(
                      width: 300.w,
                        backgroundColor: context.theme.colorScheme.surface,
                      onPressed: () {
                           context.navigateBack();
                        notifier.downloadImage(url: image.urls?.full?? "");
                      },
                      title: context.translate.largeSize,
                    )
                  ]),
            );
          },
        );
      },
      icon: Icons.download,
    );
  }
}

class DownloadUpsplashImageListener extends ConsumerWidget {
  const DownloadUpsplashImageListener({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      downloadUpsplashImageProvider,
      (previous, next) {
        if (next is DownloadUpsplashImageSucces) {
          AppToasts.showToast(
              message: context.translate.photoDownloaded, context: context);
        } else if (next is DownloadUpsplashImageLoading) {
          final String progress = next.progress.toString();
          final String progressMessage =
              progress.substring(0, progress.indexOf("."));
          AppToasts.showToast(
              message: "${context.translate.downloading} $progressMessage%",
              context: context);
        } else if (next is DownloadUpsplashImageFaliure) {
          AppDialogs.showAlertDialog(
            context: context,
            icon: Icons.error_outline,
            actions: [
              AppTextButton(
                onPressed: () {
                  context.navigateBack();
                },
                title: context.translate.gotIt,
              ),
            ],
            title: next.error.errorMessage,
          );
        }
      },
    );
    return const SizedBox();
  }
}
