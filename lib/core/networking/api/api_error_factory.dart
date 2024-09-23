
import 'package:dio/dio.dart';

import '../../../config/language/localization_herlper.dart';
import 'api_error_model.dart';
import 'error_messages.dart';

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
          errorMessage: ArabicApiErrorMessages.defaultError, statusCode: 500);
    } else {
      return ApiErrorModel(
          errorMessage: EnglishApiErrorMessages.defaultError, statusCode: 500);
    }
  }

  static ApiErrorModel _handleErrorInArabic(DioExceptionType error) {
    switch (error) {
      case DioExceptionType.connectionTimeout:
        return ApiErrorModel(
            errorMessage: ArabicApiErrorMessages.connectTimeout);
      case DioExceptionType.sendTimeout:
        return ApiErrorModel(errorMessage: ArabicApiErrorMessages.sendTimeout);
      case DioExceptionType.receiveTimeout:
        return ApiErrorModel(
            errorMessage: ArabicApiErrorMessages.receiveTimeout);
      case DioExceptionType.connectionError:
        return ApiErrorModel(
            errorMessage: ArabicApiErrorMessages.noInternetConnection);
      case DioExceptionType.cancel:
        return ApiErrorModel(errorMessage: ArabicApiErrorMessages.cancel);

      default:
        return ApiErrorModel(errorMessage: ArabicApiErrorMessages.defaultError);
    }
  }

  static ApiErrorModel _handleErrorInEnglish(DioExceptionType error) {
    switch (error) {
      case DioExceptionType.connectionTimeout:
        return ApiErrorModel(
            errorMessage: EnglishApiErrorMessages.connectTimeout);
      case DioExceptionType.sendTimeout:
        return ApiErrorModel(errorMessage: EnglishApiErrorMessages.sendTimeout);
      case DioExceptionType.receiveTimeout:
        return ApiErrorModel(
            errorMessage: EnglishApiErrorMessages.receiveTimeout);
      case DioExceptionType.connectionError:
        return ApiErrorModel(
            errorMessage: EnglishApiErrorMessages.noInternetConnection);
      case DioExceptionType.cancel:
        return ApiErrorModel(errorMessage: EnglishApiErrorMessages.cancel);

      default:
        return ApiErrorModel(
            errorMessage: EnglishApiErrorMessages.defaultError);
    }
  }
}
