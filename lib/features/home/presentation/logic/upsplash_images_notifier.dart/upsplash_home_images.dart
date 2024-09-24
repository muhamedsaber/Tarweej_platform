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
  int perPage = 20;

  fetchImages({bool isRefreshing = false}) async {
    if (isRefreshing) page = 0;
    final oldImages = getExistingImages();

    if (page == 0) {
      state = UpsplashImagesLoading();
    } else {
      state = UpsplashImagesPagginationLoading(oldImages: oldImages);
    }

    final result = await repo.getHomeImages(page: page, perPage: perPage);

    result.when(
      onSuccess: (data) {
        state =
            UpsplashImagesLoaded(images: List.from(oldImages)..addAll(data));
      },
      onError: (e) {
        state = UpsplashImagesError(error: e);
      },
    );

    page++;
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
