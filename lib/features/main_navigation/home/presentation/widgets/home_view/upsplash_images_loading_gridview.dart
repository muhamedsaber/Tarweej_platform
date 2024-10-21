import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/features/main_navigation/home/presentation/widgets/home_view/upsplash_images_gridview_builder.dart';

import '../../../data/models/upsplash_image_model.dart';

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
            images: List.generate(
              6,
              (index) => UpsplashImageModel(),
            )),
      ),
    );
  }
}
