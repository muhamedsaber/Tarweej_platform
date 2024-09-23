import 'package:dio/dio.dart';
import 'package:tarweej_platform/core/networking/api/endpoints.dart';

import '../../../../core/networking/api/dio_interface.dart';

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
}
