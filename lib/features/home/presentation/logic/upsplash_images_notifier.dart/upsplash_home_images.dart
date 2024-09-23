import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/core/networking/api/dio_interface.dart';
import 'package:tarweej_platform/features/home/data/models/upsplash_image_model.dart';
import 'package:tarweej_platform/features/home/data/repos/upsplash_repo.dart';
import 'package:tarweej_platform/features/home/data/services/upsplash_service.dart';

import '../../../../../core/di/dependency_injection.dart';
import 'upsplash_images_state.dart';

class UpsplashHomeImages extends StateNotifier<UpsplashImagesState> {
  final UpsplashRepo repo;

  UpsplashHomeImages({required this.repo}) : super(UpsplashImagesInitial());
  int page = 0;
  int perPage = 10;

  fetchImages() async {
    state = UpsplashImagesLoading();

    final result = await repo.getHomeImages(page: page, perPage: perPage);

    result.when(
      onSuccess: (data) {
        log("success");
        log(data.length.toString());
        state = UpsplashImagesLoaded(images: data);
      },
      onError: (e) {
        state = UpsplashImagesError(error: e);
      },
    );

    page++;
  }

  List<UpsplashImageModel> getExistingImages() {
    if (state is AsyncData) {
      return (state as AsyncData).value;
    }
    return [];
  }
}

final upsplashHomeImagesProvider =
    StateNotifierProvider<UpsplashHomeImages, UpsplashImagesState>((ref) =>
        UpsplashHomeImages(
            repo: UpsplashRepo(service: UpsplashService(getIt<DioConsumer>())))
          ..fetchImages());
