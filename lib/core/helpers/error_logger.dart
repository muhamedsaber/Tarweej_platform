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
    log("╠═══ Error Message: $message");
    log("║");
    log("╚═════════════════════════════════════════╝");
    log("╔═══  Status Code: $statusCose");
    log("║");
    log("╚═════════════════════════════════════════╝");
    log("╔═══  Error Type: $errorType");
    log("║");
    log("╚═════════════════════════════════════════╝");
    log("╔═══  Stack Trace: $stackTrace");
    log("║");
    log("╚╣═════════════╣ Error End");
  }

  static logg(dynamic message) {
    log(message.toString());
  }
}
