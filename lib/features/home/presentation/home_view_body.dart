import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/features/home/data/models/upsplash_image_model.dart';
import 'logic/upsplash_images_notifier.dart/upsplash_home_images.dart';
import 'logic/upsplash_images_notifier.dart/upsplash_images_state.dart';
import 'widgets/upsplash_home_image_presenter.dart';

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
    if (state is UpsplashImagesLoaded) {
      return Expanded(child: ImagesGridViewBuilder(images: state.images));
    } else if (state is UpsplashImagesLoading) {
      return Expanded(
        child: Skeletonizer(
          effect: ShimmerEffect(
            baseColor: context.theme.colorScheme.secondary.withOpacity(0.4),
            highlightColor:
                context.theme.colorScheme.secondary.withOpacity(0.5),
          ),
          child: ImagesGridViewBuilder(
            images: [
              UpsplashImageModel(),
              UpsplashImageModel(),
              UpsplashImageModel(),
              UpsplashImageModel(),
              UpsplashImageModel(),
              UpsplashImageModel(),
            ],
          ),
        ),
      );
    } else if (state is UpsplashImagesError) {
      return Text("Error: ${state.error}");
    } else {
      return const Text("No Data");
    }
  }
}

class ImagesGridViewBuilder extends StatelessWidget {
  const ImagesGridViewBuilder({super.key, required this.images});
  final List<UpsplashImageModel> images;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return RefreshIndicator(
          onRefresh: () {
            ref.read(upsplashHomeImagesProvider.notifier).fetchImages();
            return Future.value();
          },
          child: GridView.builder(
            itemCount: images.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 300),
            itemBuilder: (context, index) {
              return UpsplashHomeImagePresenter(
                image: images[index],
                isOdd: index.isOdd,
              );
            },
          ),
        );
      },
    );
  }
}
