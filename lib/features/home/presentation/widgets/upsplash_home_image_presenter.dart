import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/core/common_ui/widgets/netwrok_image_previewer.dart';
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
    return NetwrokImagePreviewer(
      image: image.urls?.small ?? AppConstants.personNetwrokImagePlaceHolder,
      child: Padding(
        padding: getPaddingBasedOnIndex(isOdd),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(
              image: NetworkImage(image.urls?.small ??
                  AppConstants.personNetwrokImagePlaceHolder),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.0),
                  Colors.black.withOpacity(0.5),
                ],
              ),
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
      ),
    );
  }

  EdgeInsets getPaddingBasedOnIndex(bool isOdd) {
    return isOdd
        ? const EdgeInsets.only(left: 6.0, right: 12.0, bottom: 12.0)
        : const EdgeInsets.only(left: 12.0, right: 6.0, bottom: 12.0);
  }
}
