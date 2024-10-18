import 'package:dio/dio.dart';
import 'package:tarweej_platform/core/networking/api/api_constants.dart';

import '../../../../../core/networking/api/dio_interface.dart';

class UpsplashService {
  final ApiInterface api;
  UpsplashService(this.api);

  Future<Response> getHomeImages({
    required int page,
    required int perPage,
  }) async {
    return await api
        .get(ApiConstants.upSplashListPhotosEndpoint, queryParameters: {
      "page": page,
      "per_page": perPage,
    });
  }

  Future<Response> downloadImage(
      {required String url,
      required String savePath,
      dynamic Function(int, int)? onReceiveProgress}) async {
    return await api.downloadFile(
        url: url, savePath: savePath, onReceiveProgress: onReceiveProgress);
  }
}
