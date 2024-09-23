import 'package:dio/dio.dart';
import 'package:tarweej_platform/core/networking/api/api_error_model.dart';

import 'api_error_factory.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic e) {
    if (e is DioException) {
      if (e.type == DioExceptionType.badResponse) {
        return ApiErrorModel(
            errorMessage: e.response?.data, statusCode: e.response?.statusCode);
      } else {
        return ApiErrorFactory.create(e.type);
      }
    } else {
      return ApiErrorFactory.getDefaultError();
    }
  }
}
