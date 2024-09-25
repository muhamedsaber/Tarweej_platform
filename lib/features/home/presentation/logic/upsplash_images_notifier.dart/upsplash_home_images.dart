import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/core/networking/api/dio_interface.dart';
import 'package:tarweej_platform/features/home/data/models/upsplash_image_model.dart';
import 'package:tarweej_platform/features/home/data/repos/upsplash_repo.dart';
import 'package:tarweej_platform/features/home/data/services/upsplash_service.dart';

import '../../../../../core/di/dependency_injection.dart';
import 'upsplash_images_state.dart';

class UpsplashHomeImages extends StateNotifier<UpsplashImagesState> {
  final UpsplashRepo repo;
  bool isLoadingMore = false; // Track if a fetch is in progress

  UpsplashHomeImages({required this.repo}) : super(UpsplashImagesInitial());
  int page = 0;
  int perPage = 20;

  fetchImages({bool isRefreshing = false}) async {
    // Avoid triggering multiple fetches at once
    if (isLoadingMore) return;

    if (isRefreshing) {
      page = 1;
    }
    final oldImages = getExistingImages();

    // Set the loading states based on whether this is the initial load or a pagination load
    if (page == 0) {
      state = UpsplashImagesLoading();
    } else {
      state = UpsplashImagesPagginationLoading(oldImages: oldImages);
    }

    isLoadingMore = true;
    final result = await repo.getHomeImages(page: page, perPage: perPage);

    result.when(
      onSuccess: (data) {
        // Append new data to old images
        state =
            UpsplashImagesLoaded(images: List.from(oldImages)..addAll(data));
        page++; // Only increment page on success
      },
      onError: (e) {
        state = UpsplashImagesError(error: e);
      },
    );

    isLoadingMore = false;
  }

  List<UpsplashImageModel> getExistingImages() {
    if (state is UpsplashImagesLoaded) {
      return (state as UpsplashImagesLoaded).images;
    }
    return [];
  }
}

final upsplashHomeImagesProvider =
    StateNotifierProvider<UpsplashHomeImages, UpsplashImagesState>((ref) =>
        UpsplashHomeImages(
            repo: UpsplashRepo(service: UpsplashService(getIt<DioConsumer>())))
          ..fetchImages());
