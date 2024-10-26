import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/features/main_navigation/home/data/models/upsplash_image_model.dart';
import 'package:tarweej_platform/features/main_navigation/home/data/repos/upsplash_repo.dart';
import 'package:tarweej_platform/features/main_navigation/home/data/services/upsplash_service.dart';

import '../../../../../../core/di/dependency_injection.dart';
import '../../../../../../core/di/di_constants.dart';
import '../../../../../../core/networking/api/dio_consumer.dart';
import 'upsplash_images_state.dart';

class UpsplashHomeImages extends StateNotifier<UpsplashImagesState> {
  final UpsplashHomeRepo repo;

  /// Track if a fetch is in progress to prevent multiple fetches at the same time
  bool isAlreadyLoadingMoreImages = false;

  /// page is used in pagination process
  /// page = 2 because the first page is already loaded when the provider is created
  /// so for preventing loading the first page again, i set the page to 2
  /// --hand on the page number--
  /// its possible to create a global variable to track the page number and increment it
  int page = 2;

  /// perPage is the number of images per page
  int perPage = 20;

  /// scroll controller to listen to the scroll events
  final ScrollController scrollController = ScrollController();

  UpsplashHomeImages({required this.repo}) : super(UpsplashImagesInitial()) {
    scrollController.addListener(_onScroll);
  }

  /// check if the user reached the bottom of the list
  /// if so, load more images
  _onScroll() {
    if (!isAlreadyLoadingMoreImages && _isReatchedBottom) {
      fetchImages(page: ++page);
    }
  }

  /// Check if the user reached the bottom of the list
  /// to load more images
  bool get _isReatchedBottom =>
      scrollController.position.pixels ==
      scrollController.position.maxScrollExtent;

  fetchImages({int page = 0}) async {
    // isAlreadyLoadingMoreImages is used to prevent multiple fetches at the same time
    // to minimize the number of requests sent to the server
    if (isAlreadyLoadingMoreImages) return;

    // getting the old images from the previous state if it was loaded
    final oldImages = _getExistingImages();

    // Set the loading states based on whether this is the initial load or a pagination load
    if (page == 1) {
      state = UpsplashImagesLoading();
    } else {
      // This is used to show a loading indicator at the bottom of the list
      // because i want to show the old images while loading the new ones
      // + Loading indicator at the bottom of the list
      state = UpsplashImagesPagginationLoading(oldImages: oldImages);
    }

    // assign isAlreadyLoadingMoreImages to true to prevent multiple fetches at the same time
    isAlreadyLoadingMoreImages = true;
    // Fetch the images
    final result = await repo.getHomeImages(page: page, perPage: perPage);

    result.when(
      onSuccess: (data) {
        // Append new data to old images
        state =
            UpsplashImagesLoaded(images: List.from(oldImages)..addAll(data));
      },
      onError: (e) {
        state = UpsplashImagesError(error: e);
      },
    );

    isAlreadyLoadingMoreImages = false;
  }

  /// Get the existing images from the previous state to append the new images to them
  /// if the state is not [UpsplashImagesLoaded], return an empty list
  List<UpsplashImageModel> _getExistingImages() {
    if (state is UpsplashImagesLoaded) {
      return (state as UpsplashImagesLoaded).images;
    }
    return [];
  }
}

final upsplashHomeImagesProvider =
    StateNotifierProvider<UpsplashHomeImages, UpsplashImagesState>(
        (ref) => UpsplashHomeImages(repo: getIt<UpsplashHomeRepo>()));
          // ..fetchImages(page: 1));
