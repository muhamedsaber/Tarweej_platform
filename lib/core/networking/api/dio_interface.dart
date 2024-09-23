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
}

class DioConsumer<T> implements ApiInterface<T> {
  final Dio dio;
  DioConsumer(this.dio);

  @override
  Future<Response<dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
    Options? options,
  }) async {
    final response = await dio.get(endpoint,
        queryParameters: queryParameters, options: options, data: body);
    return response;
  }

  @override
  Future<Response<dynamic>> delete(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    body,
    Options? options,
  }) async {
    final response = await dio.delete(endpoint,
        queryParameters: queryParameters, options: options, data: body);
    return response;
  }

  @override
  Future<Response<dynamic>> patch(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    body,
    Options? options,
  }) async {
    final response = await dio.patch(endpoint,
        queryParameters: queryParameters, options: options, data: body);
    return response;
  }

  @override
  Future<Response<dynamic>> post(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    body,
    Options? options,
  }) async {
    final response = await dio.post(endpoint,
        queryParameters: queryParameters, options: options, data: body);
    return response;
  }
}
