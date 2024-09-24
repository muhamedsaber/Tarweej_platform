import 'package:dio/dio.dart';

import '../../../config/language/localization_herlper.dart';
import 'api_error_model.dart';
import 'error_messages.dart';
import 'local_status_code.dart';

class ApiErrorFactory {
  static ApiErrorModel create(DioExceptionType e) {
    final lang = LocalizationHelper.getCurrentLanguageByIntl();
    if (lang == AppLanguage.ar) {
      return _handleErrorInArabic(e);
    } else {
      return _handleErrorInEnglish(e);
    }
  }

  static ApiErrorModel getDefaultError() {
    final lang = LocalizationHelper.getCurrentLanguageByIntl();
    if (lang == AppLanguage.ar) {
      return ApiErrorModel(
          errorMessage: ArabicApiErrorMessages.defaultError,
          statusCode: LocalStatusCodes.defaultCode);
    } else {
      return ApiErrorModel(
          errorMessage: EnglishApiErrorMessages.defaultError,
          statusCode: LocalStatusCodes.defaultCode);
    }
  }

  static ApiErrorModel _handleErrorInArabic(DioExceptionType error) {
    switch (error) {
      case DioExceptionType.connectionTimeout:
        return ApiErrorModel(
            errorMessage: ArabicApiErrorMessages.connectTimeout,
            statusCode: LocalStatusCodes.connectTimeout);
      case DioExceptionType.sendTimeout:
        return ApiErrorModel(
            errorMessage: ArabicApiErrorMessages.sendTimeout,
            statusCode: LocalStatusCodes.sendTimeout);
      case DioExceptionType.receiveTimeout:
        return ApiErrorModel(
            errorMessage: ArabicApiErrorMessages.receiveTimeout,
            statusCode: LocalStatusCodes.receiveTimeout);
      case DioExceptionType.connectionError:
        return ApiErrorModel(
            errorMessage: ArabicApiErrorMessages.noInternetConnection,
            statusCode: LocalStatusCodes.noInternetConnection);
      case DioExceptionType.cancel:
        return ApiErrorModel(
            errorMessage: ArabicApiErrorMessages.cancel,
            statusCode: LocalStatusCodes.cancel);

      default:
        return ApiErrorModel(
            errorMessage: ArabicApiErrorMessages.defaultError,
            statusCode: LocalStatusCodes.defaultCode);
    }
  }

  static ApiErrorModel _handleErrorInEnglish(DioExceptionType error) {
    switch (error) {
      case DioExceptionType.connectionTimeout:
        return ApiErrorModel(
            errorMessage: EnglishApiErrorMessages.connectTimeout,
            statusCode: LocalStatusCodes.connectTimeout);
      case DioExceptionType.sendTimeout:
        return ApiErrorModel(
            errorMessage: EnglishApiErrorMessages.sendTimeout,
            statusCode: LocalStatusCodes.sendTimeout);
      case DioExceptionType.receiveTimeout:
        return ApiErrorModel(
            errorMessage: EnglishApiErrorMessages.receiveTimeout,
            statusCode: LocalStatusCodes.receiveTimeout);
      case DioExceptionType.connectionError:
        return ApiErrorModel(
            errorMessage: EnglishApiErrorMessages.noInternetConnection,
            statusCode: LocalStatusCodes.noInternetConnection);
      case DioExceptionType.cancel:
        return ApiErrorModel(
            errorMessage: EnglishApiErrorMessages.cancel,
            statusCode: LocalStatusCodes.cancel);

      default:
        return ApiErrorModel(
            errorMessage: EnglishApiErrorMessages.defaultError,
            statusCode: LocalStatusCodes.defaultCode);
    }
  }
}
