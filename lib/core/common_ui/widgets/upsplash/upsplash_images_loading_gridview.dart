import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/common_ui/widgets/upsplash/upsplash_images_gridview_builder.dart';

import '../../../../features/main_navigation/home/data/models/upsplash_image_model.dart';

class UpsplashImagesLoadingGridview extends StatelessWidget {
  const UpsplashImagesLoadingGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Skeletonizer(
        effect: ShimmerEffect(
          baseColor: context.theme.colorScheme.secondary.withOpacity(0.4),
          highlightColor: context.theme.colorScheme.secondary.withOpacity(0.5),
        ),
        child: UpsplashImagesGridViewBuilder(
            scrollController: ScrollController(),
            onRefresh: () async {},
            images: List.generate(
              6,
              (index) => UpsplashImageModel(id: index.toString()),
            )),
      ),
    );
  }
}
