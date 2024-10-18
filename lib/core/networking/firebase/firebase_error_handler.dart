import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tarweej_platform/config/language/localization_herlper.dart';
import 'package:tarweej_platform/core/helpers/error_logger.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_error_codes.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_error_messages.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_error_model.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_errors_icons.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_mapper.dart';

class FirebaseErrorHandler {
  static FirebaseErrorModel handle(dynamic error) {
    if (error is FirebaseException) {
      Logger.logError(
        errorType: 'Firebase Error',
        message: error.message,
        statusCose: error.code,
      );
      return FirebaseErrorModel(
          code: error.code,
          message: _getErrorMessage(error.code),
          icon: _getErrorIcon(error.code));
    } else {
      
      return FirebaseErrorModel(
        code: defaultErrorCode,
        message: _getErrorMessage(defaultErrorCode),
        icon: _getErrorIcon(defaultErrorCode),
      );
    }
  }

  static String _getErrorMessage(String errorCode) {
    AppLanguage lang = LocalizationHelper.getCurrentLanguageByIntl();

    if (lang == AppLanguage.ar) {
      return FirebaseErrorMapper.firebaseErrorCodeToArabicMessage[errorCode] ??
          defaultArabicErrorMessage;
    } else {
      return FirebaseErrorMapper.firebaseErrorCodeToEnglishMessage[errorCode] ??
          defaultEnglishErrorMessage;
    }
  }

  static IconData _getErrorIcon(String errorCode) {
    return FirebaseErrorMapper.firebaseErrorCodeToIcon[errorCode] ??
        defaultErrorIcon;
  }

  static const String defaultErrorCode = FirebaseErrorCodes.unknown;
  static const String defaultEnglishErrorMessage =
      FirebaseEnglishErrorMessages.unknown;
  static const String defaultArabicErrorMessage =
      FirebaseArabicErrorMessages.unknown;
  static const IconData defaultErrorIcon = FirebaseErrorIcons.unknown;
}
