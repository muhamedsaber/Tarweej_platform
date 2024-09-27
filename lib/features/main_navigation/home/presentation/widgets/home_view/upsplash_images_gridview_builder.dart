import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/config/router/routes.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import '../../../data/models/upsplash_image_model.dart';
import '../../logic/upsplash_images_notifier/upsplash_home_images.dart';
import 'upsplash_home_image_presenter.dart';

class UpsplashImagesGridViewBuilder extends ConsumerStatefulWidget {
  const UpsplashImagesGridViewBuilder(
      {super.key, required this.images, required this.isFetchingMore});
  final List<UpsplashImageModel> images;
  final bool isFetchingMore;

  @override
  ConsumerState<UpsplashImagesGridViewBuilder> createState() =>
      _UpsplashImagesGridViewBuilderState();
}

class _UpsplashImagesGridViewBuilderState
    extends ConsumerState<UpsplashImagesGridViewBuilder> {
  late ScrollController _scrollController;
  // Page number for fetching more images
  int pageNumber = 1;
  @override
  initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final notifier = ref.read(upsplashHomeImagesProvider.notifier);
        if (!notifier.isLoadingMore) {
          pageNumber++;
          // Check if it's already loading
          notifier.fetchImages(
            page: pageNumber,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return RefreshIndicator(
          onRefresh: () {
            ref
                .read(upsplashHomeImagesProvider.notifier)
                .fetchImages(isRefreshing: true);
            return Future.value();
          },
          child: GridView.builder(
            key: const PageStorageKey('upsplash_images_gridview'),
            padding: EdgeInsets.zero,
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _scrollController,
            itemCount: widget.isFetchingMore
                ? widget.images.length + 6
                : widget.images.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 280,
            ),
            itemBuilder: (context, index) {
              if (index >= widget.images.length) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return GestureDetector(
                onTap: () => context.navigateTo(Routes.upSplashImageView,
                    arguments: widget.images[index]),
                child: Hero(
                  createRectTween: (begin, end) {
                    return MaterialRectCenterArcTween(begin: begin, end: end);
                  },
                  tag: widget.images[index].id.toString(),
                  child: UpsplashHomeImagePresenter(
                    image: widget.images[index],
                    isOdd: index.isOdd,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
