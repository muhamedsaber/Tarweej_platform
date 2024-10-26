import 'package:dio/dio.dart';
import 'package:tarweej_platform/core/networking/api/dio_interface.dart';

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

  @override
  Future<Response<dynamic>> downloadFile(
      {required String url,
      required String savePath,
      Function(int, int)? onReceiveProgress}) async {
    final response = await dio.download(
      url,
      savePath,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }
}
