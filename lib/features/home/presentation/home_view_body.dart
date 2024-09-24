import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/config/language/widgets/language_changer_menu_button.dart';
import 'package:tarweej_platform/config/language/widgets/language_menu_button.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/common_ui/widgets/custom_error.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/features/home/data/models/upsplash_image_model.dart';
import 'logic/upsplash_images_notifier.dart/upsplash_home_images.dart';
import 'logic/upsplash_images_notifier.dart/upsplash_images_state.dart';
import 'widgets/upsplash_images_gridview_builder.dart';
import 'widgets/upsplash_images_loading_gridview.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        UpSplashHomeImagesBuilder(),
      ],
    );
  }
}

class UpSplashHomeImagesBuilder extends ConsumerWidget {
  const UpSplashHomeImagesBuilder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(upsplashHomeImagesProvider);
    final notifier = ref.read(upsplashHomeImagesProvider.notifier);
    log("State: $state");
    if (state is UpsplashImagesLoaded ||
        state is UpsplashImagesPagginationLoading) {
      List<UpsplashImageModel> images = List.from(state is UpsplashImagesLoaded
          ? (state).images
          : (state as UpsplashImagesPagginationLoading).oldImages);

      return Expanded(
        child: Column(
          children: [
            Expanded(
                child: UpsplashImagesGridViewBuilder(
                    images: images,
                    isFetchingMore: state is UpsplashImagesPagginationLoading)),
          ],
        ),
      );
    } else if (state is UpsplashImagesLoading) {
      return const UpsplashImagesLoadingGridview();
    } else if (state is UpsplashImagesError) {
      return RefreshIndicator(
        onRefresh: () => notifier.fetchImages(isRefreshing: true),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: CustomError(
            error: state.error,
          ),
        ),
      );
    } else {
      return const Text("No Data");
    }
  }
}
