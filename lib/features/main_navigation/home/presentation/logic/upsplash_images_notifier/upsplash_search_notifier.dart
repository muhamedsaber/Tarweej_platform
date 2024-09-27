import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/features/main_navigation/home/data/repos/upsplash_repo.dart';
import 'package:tarweej_platform/features/main_navigation/home/presentation/logic/upsplash_images_notifier/upsplash_images_state.dart';

import '../../../../../../core/di/dependency_injection.dart';
import '../../../../../../core/networking/api/dio_interface.dart';
import '../../../data/models/upsplash_image_model.dart';
import '../../../data/models/upsplash_search_request_model.dart';
import '../../../data/services/upsplash_service.dart';

class UpsplashSearchNotifier extends StateNotifier<UpsplashImagesState> {
  UpsplashSearchNotifier({required this.repo}) : super(UpsplashImagesInitial());
  final UpsplashRepo repo;
  int perPage = 20;
  // searching
  UpsplashSearchRequestModel localSearchRequestModel =
      UpsplashSearchRequestModel();
  int searchPage = 0;

  final searchController = TextEditingController();

  searchImages() async {
    final oldImages = getExistingImages();
    if (searchPage == 0) {
      state = UpsplashImagesLoading();
    } else {
      // This is used to show a loading indicator at the bottom of the list
      // because i want to show the old images while loading the new ones
      // + Loading indicator at the bottom of the list
      state = UpsplashImagesPagginationLoading(oldImages: oldImages);
    }

    final result = await repo.searchImages(
        request: localSearchRequestModel.copyWith(
      query: searchController.text,
      page: searchPage,
      perPage: perPage,
      color: localSearchRequestModel.color,
      contentFilter: localSearchRequestModel.contentFilter,
      orderBy: localSearchRequestModel.orderBy,
      orientation: localSearchRequestModel.orientation,
    ));
    result.when(
      onError: (error) {
        state = UpsplashImagesError(error: error);
      },
      onSuccess: (data) {
        if (searchPage == 0) {
          // if search page is 0 then it's a new search so user switched to search mode so there
          // is no need to append the new data to the old data to prevent previewing the old data
          state = UpsplashImagesLoaded(images: data);
        } else {
          // if search page is not 0 then it's a pagination so we need to append the new data to the old data
          // This is important to show the old data while loading the new data
          state =
              UpsplashImagesLoaded(images: List.from(oldImages)..addAll(data));
        }

        // updating the search page
      },
    );
  }

  List<UpsplashImageModel> getExistingImages() {
    if (state is UpsplashImagesLoaded) {
      return (state as UpsplashImagesLoaded).images;
    }
    return [];
  }
}

final upsplashSearchNotifierNotifierProvider =
    StateNotifierProvider<UpsplashSearchNotifier, UpsplashImagesState>(
  (ref) => UpsplashSearchNotifier(
    repo: UpsplashRepo(
      service: UpsplashService(
        getIt<DioConsumer>(),
      ),
    ),
  ),
);
