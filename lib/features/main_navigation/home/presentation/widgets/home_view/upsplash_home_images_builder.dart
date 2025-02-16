import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/common_ui/widgets/custom_error.dart';
import '../../../data/models/upsplash_image_model.dart';
import '../../logic/upsplash_images_notifier/upsplash_home_images.dart';
import '../../logic/upsplash_images_notifier/upsplash_images_state.dart';
import '../../../../../../core/common_ui/widgets/upsplash/upsplash_images_gridview_builder.dart';
import '../../../../../../core/common_ui/widgets/upsplash/upsplash_images_loading_gridview.dart';

class UpSplashHomeImagesBuilder extends ConsumerWidget {
  const UpSplashHomeImagesBuilder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(upsplashHomeImagesProvider);
    final notifier = ref.read(upsplashHomeImagesProvider.notifier);

    if (state is UpsplashImagesLoaded ||
        state is UpsplashImagesPagginationLoading) {
      List<UpsplashImageModel> images = List.from(state is UpsplashImagesLoaded
          ? (state).images
          : (state as UpsplashImagesPagginationLoading).oldImages);

      return Expanded(
        child: UpsplashImagesGridViewBuilder(
          images: images,
          onRefresh: () {
            ref.read(upsplashHomeImagesProvider.notifier).fetchImages(page: 0);
            return Future.value();
          },
          scrollController: notifier.scrollController,
        ),
      );
    } else if (state is UpsplashImagesLoading) {
      return const UpsplashImagesLoadingGridview();
    } else if (state is UpsplashImagesError) {
      return RefreshIndicator(
        onRefresh: () => notifier.fetchImages(page: 0),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: CustomError(
            error: state.error,
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
