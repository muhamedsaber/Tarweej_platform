import 'package:dio/dio.dart';

abstract class ApiInterface<T> {
  Future<Response<dynamic>> get(String endpoint,
      {Map<String, dynamic>? queryParameters, dynamic body, Options? options});
  Future<Response<dynamic>> post(String endpoint,
      {Map<String, dynamic>? queryParameters, dynamic body, Options? options});
  Future<Response<dynamic>> delete(String endpoint,
      {Map<String, dynamic>? queryParameters, dynamic body, Options? options});
  Future<Response<dynamic>> patch(String endpoint,
      {Map<String, dynamic>? queryParameters, dynamic body, Options? options});

  Future<Response<dynamic>> downloadFile(
      {required String url,
      required String savePath,
      Function(int, int)? onReceiveProgress});
}
