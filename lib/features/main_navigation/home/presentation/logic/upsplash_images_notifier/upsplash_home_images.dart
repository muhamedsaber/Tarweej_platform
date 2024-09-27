import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/core/networking/api/dio_interface.dart';
import 'package:tarweej_platform/features/main_navigation/home/data/models/upsplash_image_model.dart';
import 'package:tarweej_platform/features/main_navigation/home/data/models/upsplash_search_request_model.dart';
import 'package:tarweej_platform/features/main_navigation/home/data/repos/upsplash_repo.dart';
import 'package:tarweej_platform/features/main_navigation/home/data/services/upsplash_service.dart';

import '../../../../../../core/di/dependency_injection.dart';
import 'upsplash_images_state.dart';

class UpsplashHomeImages extends StateNotifier<UpsplashImagesState> {
  final UpsplashRepo repo;
  bool isLoadingMore = false; // Track if a fetch is in progress

  UpsplashHomeImages({required this.repo}) : super(UpsplashImagesInitial());

  int perPage = 20;

  fetchImages({bool isRefreshing = false, int page = 0}) async {
    // isLoadingMore is used to prevent multiple fetches at the same time
    // to minimize the number of requests sent to the server
    if (isLoadingMore) return;

    // If refreshing, reset the page to 1 to prevent getting different data
    if (isRefreshing) page = 0;

    // getting the old images from the previous state if it was loaded
    final oldImages = getExistingImages();

    // Set the loading states based on whether this is the initial load or a pagination load
    if (page == 0) {
      state = UpsplashImagesLoading();
    } else {
      // This is used to show a loading indicator at the bottom of the list
      // because i want to show the old images while loading the new ones
      // + Loading indicator at the bottom of the list
      state = UpsplashImagesPagginationLoading(oldImages: oldImages);
    }

    // assign isLoadingMore to true to prevent multiple fetches at the same time
    isLoadingMore = true;
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
          );
