import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/config/router/routes.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/features/main_navigation/home/presentation/widgets/home_view/upsplash_images_loading_gridview.dart';
import '../../../data/models/upsplash_image_model.dart';
import '../../logic/upsplash_images_notifier/upsplash_home_images.dart';
import 'upsplash_home_image_presenter.dart';

class UpsplashImagesGridViewBuilder extends ConsumerWidget {
  const UpsplashImagesGridViewBuilder({super.key, required this.images, required this.scrollController});
  final List<UpsplashImageModel> images;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () {
        ref.read(upsplashHomeImagesProvider.notifier).fetchImages(page: 0);
        return Future.value();
      },
      child: GridView.builder(
        key: const PageStorageKey('upsplash_images_gridview'),
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.fast),
        controller: scrollController,
        // add 6 more items to the list to show the loading indicator at the end
        itemCount: images.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 280,
        ),
        itemBuilder: (context, index) {
          if (index >= images.length) {
            return const Center(child: UpsplashImagesLoadingGridview());
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
              tag: images[index].id.toString(),
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
