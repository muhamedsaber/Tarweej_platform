import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/config/router/routes.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import '../../../../features/main_navigation/home/data/models/upsplash_image_model.dart';
import '../../../../features/main_navigation/home/presentation/widgets/home_view/upsplash_home_image_presenter.dart';

class UpsplashImagesGridViewBuilder extends ConsumerWidget {
  const UpsplashImagesGridViewBuilder(
      {super.key,
      required this.images,
      required this.scrollController,
      required this.onRefresh});
  final List<UpsplashImageModel> images;
  final ScrollController scrollController;
  final Future<void> Function() onRefresh;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: GridView.builder(
        key: const PageStorageKey('upsplash_images_gridview'),
        physics: const BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.fast),
        controller: scrollController,
        itemCount: images.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 280,
        ),
        itemBuilder: (context, index) {
          if (images[index].id == null) {
            return const SizedBox.shrink();
          }

          return GestureDetector(
            onTap: () => context.navigateTo(
              Routes.upSplashImageView,
              arguments: images[index],
            ),
            child: Hero(
              createRectTween: (begin, end) {
                return MaterialRectCenterArcTween(begin: begin, end: end);
              },
              tag: images[index].id!,
              child: UpsplashHomeImagePresenter(
                image: images[index],
                isOdd: index.isOdd,
              ),
            ),
          );
        },
      ),
    );
  }
}
