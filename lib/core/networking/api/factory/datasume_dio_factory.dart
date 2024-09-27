import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tarweej_platform/core/networking/api/endpoints.dart';

class DatasumeDioFactory {
  final Dio _dio;

  DatasumeDioFactory() : _dio = Dio() {
    _dio.options
      ..baseUrl = ApiConstants.datamuseApiBaseUrl
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