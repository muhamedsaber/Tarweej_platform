import 'package:dio/dio.dart';
import 'package:tarweej_platform/core/networking/api/endpoints.dart';

class UpsplashDioFactory {
  final Dio _dio;

  UpsplashDioFactory() : _dio = Dio() {
    _dio.options
      ..baseUrl = ApiConstants.updplashBaseUrl
      ..headers = {
        "Authorization": "Client-ID ${ApiConstants.upSplashAccessKey}"
      };
  }

  Dio get dio => _dio;
}
