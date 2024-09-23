import 'package:tarweej_platform/core/networking/api/api_error_model.dart';

 sealed  class ApiResult<T> {
   ApiResult._();
  factory ApiResult.success(T data) = ApiSuccess<T>;
  factory ApiResult.error(ApiErrorModel error) = ApiError<T>;
  ApiResult when({
    required Function(T data) onSuccess,
    required Function(ApiErrorModel error) onError,
  }) {
    if (this is ApiSuccess<T>) {
      onSuccess((this as ApiSuccess<T>).data);
    } else {
      onError((this as ApiError<T>).error);
    }
    return this;
  }
}

class ApiSuccess<T> extends ApiResult<T> {
  final T data;
  ApiSuccess(this.data) : super._();
}

class ApiError<T> extends ApiResult<T> {
  final ApiErrorModel error;
  ApiError(this.error) : super._();
}
