import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_error_handler.dart';

class FirebaseErrorLogger {
  FirebaseErrorLogger._();
  static logError(FirebaseException exception) {
    final error = FirebaseErrorHandler.handle(exception);
    log("----------------FirebaseException-----------------");
    log("code: ${exception.code}");
    log("message: ${exception.message}");
    log("plugin: ${exception.plugin}");
    log("stackTrace: ${exception.stackTrace}");
    log("-----------Error Presentation------------");
    log("code: ${error.message}");
    log("--------------------------------------------------");
  }
}
