import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/features/home/presentation/widgets/upsplash_image_previewer.dart';
import 'package:tarweej_platform/core/helpers/app_assets.dart';
import 'package:tarweej_platform/core/helpers/app_constants.dart';
import '../../../../core/helpers/size.dart';
import '../../data/models/upsplash_image_model.dart';

class UpsplashHomeImagePresenter extends StatelessWidget {
  const UpsplashHomeImagePresenter(
      {super.key, required this.image, required this.isOdd});
  final UpsplashImageModel image;
  final bool isOdd;
  @override
  Widget build(BuildContext context) {
    return UpsplashImagePreviewer(
     image: image,
      child: Padding(
          padding: getPaddingBasedOnIndex(isOdd, context),
          child: SizedBox(
            height: image.height?.toDouble() ?? 200.h,
            child: Stack(
              children: [
                // Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Stack(
                    children: [
                      Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: image
                              .color // Replace with your desired placeholder color
                          ),
                      FadeInImage(
                        placeholder: const AssetImage(AppAssets
                            .trnsparentImage), // Transparent image as placeholder
                        image: NetworkImage(image.urls?.small ??
                            AppAssets.personNetwrokImagePlaceHolder),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                        fadeInDuration: const Duration(
                            milliseconds: 300), // Adjust the duration as needed
                        placeholderErrorBuilder: (context, error, stackTrace) =>
                            Container(),
                        imageErrorBuilder: (context, error, stackTrace) =>
                            Container(),
                      ),
                    ],
                  ),
                ),
                // inFormations
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                    ),
                    child: Column(
                      children: [
                        verticalSpace(10),
                        Text(
                          image.user?.name ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontFamily: AppConstants.tommyFont),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              size: 18.sp,
                              color: Colors.white,
                            ),
                            horizontalSpace(5),
                            Text(
                              image.likes.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(5),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  EdgeInsets getPaddingBasedOnIndex(bool isOdd, BuildContext context) {
    // This padding is applied based on the index of the image in the gridview
    // why?
    // because i want to make it symmetrical and more pleasant to the eye
    // so when the image is odd it will have more padding on the left side and less on the right side
    // and vice versa, Based also on the directionality of the app (LTR or RTL)
    final dir = Directionality.of(context);
    if (dir == TextDirection.ltr) {
      return !isOdd
          ? const EdgeInsets.only(right: 6.0, left: 12.0, bottom: 12.0)
          : const EdgeInsets.only(right: 12.0, left: 6.0, bottom: 12.0);
    } else {
      return !isOdd
          ? const EdgeInsets.only(left: 6.0, right: 12.0, bottom: 12.0)
          : const EdgeInsets.only(left: 12.0, right: 6.0, bottom: 12.0);
    }
  }
}
// CachedNetworkImage(
//                     fit: BoxFit.cover,
//                     imageBuilder: (context, imageProvider) {
//                       return Container(
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: imageProvider,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       );
//                     },
//                     imageUrl: image.urls?.small ??
//                         AppAssets.personNetwrokImagePlaceHolder,
//                     errorWidget: (context, url, error) => Container(),
//                     placeholder: (context, url) {
//                       return Container(
//                           color: image.color ??
//                               context.theme.colorScheme.secondary);
//                     },
//                   ),