import 'dart:developer';

class Logger {
  static logError({
    final String? message,
    final String? statusCose,
    final String? errorType,
    final StackTrace? stackTrace,
  }) {
    //shapes
    // ╠
    // ╚
    // ╔
    // ╣
    // ╗
    // ╝
    // ║
    // ═
    log("╔╠ Error Occured");
    log("║");
    log("╠═════════════════════════════════════════╝");
    if (message != null) {
      log("╠═══ Error Message: $message");
      log("║");
      log("╚═════════════════════════════════════════╝");
    }
    if (statusCose != null) {
      log("╔═══  Status Code: $statusCose");
      log("║");
      log("╚═════════════════════════════════════════╝");
    }
    if (errorType != null) {
      log("╔═══  Error Type: $errorType");
      log("║");
      log("╚═════════════════════════════════════════╝");
    }

    if (stackTrace != null) {
      log("╔═══  Stack Trace: $stackTrace");
      log("║");
      log("╚╣═════════════╣ Error End");
    }
    if (message == null && statusCose == null && errorType == null) {
      log("╔═══  There is no error message");
      log("║");
      log("╚╣═════════════╣ Error End");
    }
  }

  static logg(dynamic message) {
    log(message.toString());
  }
}
