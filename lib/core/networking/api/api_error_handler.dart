import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tarweej_platform/core/helpers/error_logger.dart';
import 'package:tarweej_platform/core/networking/api/api_error_model.dart';

import 'api_error_factory.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic e) {
    if (e is DioException) {
      Logger.logError(
        message: e.message,
        statusCose: e.response?.statusCode.toString(),
        errorType: e.type.toString(),
      );
      if (e.type == DioExceptionType.badResponse) {
        return ApiErrorModel(
            errorMessage: e.response?.data, statusCode: e.response?.statusCode);
      } else {
        return ApiErrorFactory.create(e.type);
      }
    } else {
      Logger.logError(
        message: e.toString(),
        stackTrace: e.stackTrace,
      );

      return ApiErrorFactory.getDefaultError();
    }
  }
}
