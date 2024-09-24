import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/upsplash_image_model.dart';
import '../logic/upsplash_images_notifier.dart/upsplash_home_images.dart';
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
        ref.read(upsplashHomeImagesProvider.notifier).fetchImages();
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
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _scrollController,
            itemCount: widget.isFetchingMore
                ? widget.images.length + 6
                : widget.images.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 300,
            ),
            itemBuilder: (context, index) {
              if (index >= widget.images.length) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return UpsplashHomeImagePresenter(
                image: widget.images[index],
                isOdd: index.isOdd,
              );
            },
          ),
        );
      },
    );
  }
}
