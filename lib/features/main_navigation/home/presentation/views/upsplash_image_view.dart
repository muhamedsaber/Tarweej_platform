import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/common_ui/widgets/app_icon_button.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/features/main_navigation/home/presentation/widgets/upsplash_image_view/download_upsplash_image_button.dart';
import 'package:tarweej_platform/features/main_navigation/home/presentation/widgets/upsplash_image_view/upsplash_image_color_extractor.dart';
import '../../../../../core/helpers/size.dart';
import '../../data/models/upsplash_image_model.dart';
import '../widgets/upsplash_image_view/account_publisher_details.dart';
import '../widgets/upsplash_image_view/open_upsplash_image_in_webview_button.dart';
import '../widgets/upsplash_image_view/share_upsplash_image_button.dart';

class UpsplashImageView extends StatelessWidget {
  const UpsplashImageView({super.key, required this.image});
  final UpsplashImageModel image;
  @override
  Widget build(BuildContext context) {
    final heroTag = image.id;
    log(image.height.toString());
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Stack(
              fit: StackFit.passthrough,
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                // image
                SizedBox(
                  width: context.screenWidth,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return PhotoView(
                        customSize:
                            Size(context.screenWidth, context.screenHeight),
                        semanticLabel: image.description ?? "",
                        loadingBuilder: (context, event) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        minScale: PhotoViewComputedScale.contained,
                        maxScale: PhotoViewComputedScale.contained,
                        tightMode: true,
                        filterQuality: FilterQuality.high,
                        heroAttributes: PhotoViewHeroAttributes(tag: heroTag!),
                        backgroundDecoration: BoxDecoration(
                          color: context.theme.scaffoldBackgroundColor,
                        ),
                        basePosition: Alignment.topCenter,
                        imageProvider: NetworkImage(
                          image.urls?.regular ?? "",
                        ),
                      );
                    },
                  ),
                ),
                // back button
                Positioned(
                  top: 40.h,
                  left: 12.w,
                  child: AppIconButton(
                    icon: Icons.arrow_back_ios_new,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                // open image in web view
                Positioned(
                  top: 40.h,
                  right: 12.w,
                  child: OpenUpsplashImageInWebViewButton(
                    url: image.links?.html,
                  ),
                ),
                // share the link of the image
                Positioned(
                  top: 40.h,
                  right: 55.w,
                  child: ShareUpsplashImageButton(image: image),
                ),
                Positioned(
                    top: 40.h,
                    right: 98.w,
                    child: DownloadUpsplashImageButton(
                      image: image,
                    )),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              children: [
                verticalSpace(30.h),
                UpsplashPublisherDetails(
                  image: image,
                ),
                verticalSpace(20),
                Text(
                  image.description ?? "",
                  style: context.theme.font18OnSurfaceMedium,
                ),
                verticalSpace(20),
                Row(
                  children: [
                    Text(
                      context.translate.colors,
                      style: context.theme.font18OnSurfaceMedium,
                    ),
                    horizontalSpace(20),
                    UpsplashImageColorExtractor(image: image),
                  ],
                ),
                verticalSpace(20),
                const DownloadUpsplashImageListener(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
