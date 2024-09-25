import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tarweej_platform/core/networking/api/endpoints.dart';

class UpsplashDioFactory {
  final Dio _dio;

  UpsplashDioFactory() : _dio = Dio() {
    _dio.options
      ..baseUrl = ApiConstants.updplashBaseUrl
      ..connectTimeout = const Duration(seconds: 20)
      ..receiveTimeout = const Duration(seconds: 20)
      ..sendTimeout = const Duration(seconds: 20)
      ..headers = {
        "Authorization": "Client-ID ${ApiConstants.upSplashAccessKey}"
      };
    _dio.interceptors.add(PrettyDioLogger(
      compact: false,
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      logPrint: (Object object) {
        debugPrint(object.toString());
      },
      enabled: true,
      request: true,
    ));
  }

  Dio get dio => _dio;
}
