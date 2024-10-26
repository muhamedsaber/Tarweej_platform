import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  final Dio _dio;
  final Map<String, dynamic>? headers;
  final String baseUrl;
  DioFactory({
    this.headers,
    required this.baseUrl,
  }) : _dio = Dio() {
    _dio.options
      ..baseUrl = baseUrl
      ..connectTimeout = const Duration(seconds: 20)
      ..receiveTimeout = const Duration(seconds: 20)
      ..sendTimeout = const Duration(seconds: 20)
      ..headers = headers;
    _dio.interceptors.add(PrettyDioLogger(
      compact: false,
      requestHeader: true,
      requestBody: true,
      responseBody: false,
      responseHeader: true,
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
