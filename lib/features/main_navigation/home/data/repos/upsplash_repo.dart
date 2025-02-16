import 'dart:developer';

import 'package:tarweej_platform/core/networking/api/api_error_handler.dart';

import '../../../../../core/networking/api/api_result.dart';
import '../models/upsplash_image_model.dart';
import '../services/upsplash_service.dart';

class UpsplashHomeRepo {
  final UpsplashService service;

  UpsplashHomeRepo({required this.service});

  Future<ApiResult<List<UpsplashImageModel>>> getHomeImages({
    required int page,
    required int perPage,
  }) async {
    try {
      final response =
          await service.getHomeImages(page: page, perPage: perPage);
      List<UpsplashImageModel> models = (response.data as List).map((e) {
        return UpsplashImageModel.fromJson(e);
      }).toList();

      return ApiResult.success(models);
    } catch (e) {
      log(e.toString());
      return ApiResult.error(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<bool>> downloadImage(
      {required String url,
      dynamic Function(int, int)? onReceiveProgress,
      required String savePath}) async {
    try {
      await service.downloadImage(
          url: url, savePath: savePath, onReceiveProgress: onReceiveProgress);
      return ApiResult.success(true);
    } catch (e) {
      return ApiResult.error(ApiErrorHandler.handle(e));
    }
  }
}
