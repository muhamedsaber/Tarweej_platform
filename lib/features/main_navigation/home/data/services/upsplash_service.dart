import 'package:dio/dio.dart';
import 'package:tarweej_platform/core/networking/api/endpoints.dart';

import '../../../../../core/networking/api/dio_interface.dart';
import '../models/upsplash_search_request_model.dart';

class UpsplashService {
  final ApiInterface api;
  UpsplashService(this.api);

  Future<Response> getHomeImages({
    required int page,
    required int perPage,
  }) async {
    return await api.get(ApiConstants.upSplashListPhotosEndpoint,
        options: Options(
          headers: {
            "Authorization": "Client-ID ${ApiConstants.upSplashAccessKey}",
          },
        ),
        queryParameters: {
          "page": page,
          "per_page": perPage,
        });
  }

  Future<Response> searchImages(
      {required UpsplashSearchRequestModel request}) async {
    return await api.get(ApiConstants.upSplashSearchPhotos,
        options: Options(
          headers: {
            "Authorization": "Client-ID ${ApiConstants.upSplashAccessKey}",
          },
        ),
        queryParameters: {
          "page": request.page,
          "per_page": request.perPage,
          if (request.orderBy != null) "order_by": request.orderBy,
          if (request.color != null) "color": request.color,
          if (request.orientation != null) "orientation": request.orientation,
          if (request.contentFilter != null)
            "content_filter": request.contentFilter,
          if (request.query != null) "query": request.query,
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
