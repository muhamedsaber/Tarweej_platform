import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/color_palette.dart';
import '../widgets/home_search_button.dart';
import '../widgets/upsplash_home_images_builder.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Stack(
        children: [
          const ColorPalette(),
          const HomeSearchButton(),
          Padding(
            padding: EdgeInsets.only(top: 135.h),
            child: const Column(
              children: [
                UpSplashHomeImagesBuilder(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
