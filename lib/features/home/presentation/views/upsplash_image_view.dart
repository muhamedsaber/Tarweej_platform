import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tarweej_platform/config/language/widgets/language_changer_menu_button.dart';
import 'package:tarweej_platform/config/language/widgets/language_menu_button.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/alerts/app_toasts.dart';
import 'package:tarweej_platform/core/common_ui/widgets/app_icon_button.dart';
import 'package:tarweej_platform/core/common_ui/widgets/app_text_button.dart';
import 'package:tarweej_platform/core/helpers/app_assets.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import '../../../../config/router/routes.dart';
import '../../../../core/helpers/size.dart';
import '../../data/models/upsplash_image_model.dart';
import '../widgets/upsplash_image_view/account_publisher_details.dart';
import '../widgets/upsplash_image_view/open_upsplash_image_in_webview_button.dart';
import '../widgets/upsplash_image_view/share_upsplash_image_button.dart';

class UpsplashImageView extends StatelessWidget {
  const UpsplashImageView({super.key, required this.image});
  final UpsplashImageModel image;
  @override
  Widget build(BuildContext context) {
    log(image.height.toString());
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Stack(
              children: [
                // image
                Image.network(
                  image.urls?.small ?? "",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                // back button
                Positioned(
                  top: 35,
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
                  top: 35,
                  right: 12.w,
                  child: OpenUpsplashImageInWebViewButton(
                    url: image.links?.html,
                  ),
                ),
                // share the link of the image
                Positioned(
                  top: 35,
                  right: 55.w,
                  child: ShareUpsplashImageButton(image: image),
                ),
              ],
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  verticalSpace(20),
                  UpsplashPublisherDetails(
                    image: image,
                  ),
                  horizontalSpace(20),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        image.description ?? "",
                        style: context.theme.font18OnSurfaceMedium,
                      ),
                    ),
                  ),
                  UpsplashColorPresenter(
                    color: image.color ?? Colors.green,
                  )
                ],
              ),
            ),
          ),
          const Spacer(flex: 1)
        ],
      ),
    );
  }
}

class UpsplashColorPresenter extends StatelessWidget {
  const UpsplashColorPresenter({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          context.translate.colors,
          style: context.theme.font18OnSurfaceMedium,
        ),
        horizontalSpace(10),
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
                      children: [
                        Text(
                          "#${color.value.toRadixString(16).substring(2)}",
                          style: context.theme.font18OnSurfaceMedium,
                        ),
                        verticalSpace(10),
                        ElevatedButton(
                            onPressed: () {
                              final textToCopy =
                                  "#${color.value.toRadixString(16).substring(2)}";
                              Clipboard.setData(
                                  ClipboardData(text: textToCopy));
                            },
                            child: const Text("Copy")),
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

 
//  PhotoView(
//                   customSize: Size(context.screenWidth, context.screenHeight),
//                   semanticLabel: image.description ?? "",
//                   loadingBuilder: (context, event) => const Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                   maxScale: PhotoViewComputedScale.covered * 6.0,
//                   onScaleEnd: (context, details, controllerValue) {
//                     log(controllerValue.scale.toString());
//                   },
//                   heroAttributes:
//                       PhotoViewHeroAttributes(tag: image.id.toString()),
//                   backgroundDecoration: BoxDecoration(
//                     color: context.theme.scaffoldBackgroundColor,
//                   ),
//                   basePosition: Alignment.topCenter,
//                   imageProvider: NetworkImage(
//                     image.urls?.regular ?? "",
//                   ),
//                 ),
