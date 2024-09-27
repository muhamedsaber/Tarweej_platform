import 'dart:developer';

class ApiErrorModel {
  final int? statusCode;
  final String? errorMessage;

  ApiErrorModel({
    this.statusCode,
    this.errorMessage,
  });
  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      statusCode: json['code'] as int?,
      errorMessage: _parseErrorMessage(json),
    );
  }
  static String _parseErrorMessage(Map<String, dynamic> json) {
    try {
      if (json['errors'] != null && json['errors'] is List) {
        final errors = json['errors'];
        return errors.map((e) => e.toString()).join('\n');
      } else if (json['message'] != null) {
        return json['message'];
      } else {
        return 'Unknown error occurred';
      }
    } catch (e) {
      log('Error in parsing error message: $e');
      return 'Internal Server Error';
    }
  }
}
