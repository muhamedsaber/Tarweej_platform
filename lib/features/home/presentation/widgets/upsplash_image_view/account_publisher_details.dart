
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';

import '../../../../../config/router/routes.dart';
import '../../../../../core/alerts/app_toasts.dart';
import '../../../../../core/common_ui/widgets/app_text_button.dart';
import '../../../../../core/helpers/app_assets.dart';
import '../../../../../core/helpers/size.dart';
import '../../../data/models/upsplash_image_model.dart';

class UpsplashPublisherDetails extends StatelessWidget {
  const UpsplashPublisherDetails({super.key, required this.image});
  final UpsplashImageModel image;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.r),
                  child: Image.network(
                    image.user?.profileImage?.small ??
                        AppAssets.personNetwrokImagePlaceHolder,
                    width: 50.w,
                    height: 50.h,
                    fit: BoxFit.cover,
                  ),
                ),
                horizontalSpace(10),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        image.user?.name ?? "",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: context.theme.font16OnSurfaceRegular,
                      ),
                      Text(
                        image.user?.username ?? "",
                        textAlign: TextAlign.start,
                        style: context.theme.font14OnSurfaceRegular,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AppTextButton(
            onPressed: () {
              if (image.user?.links?.html == null) {
                AppToasts.showToast(
                    message:
                        context.translate.theImageLinkIsExpiredOrNoMoreExist,
                    context: context);
              } else {
                context.navigateTo(Routes.publisherProfileWebView,
                    arguments: image.user?.links?.html);
              }
            },
            title: context.translate.more,
            style: context.theme.font16OnSurfaceRegular,
          ),
        ],
      ),
    );
  }
}