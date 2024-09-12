import 'package:tarweej_platform/core/networking/firebase/firebase_error_model.dart';

class FirebaseResult<T> {
  const FirebaseResult._(); // Private constructor

  const factory FirebaseResult.success(T data) = Success<T>;
  const factory FirebaseResult.error(FirebaseErrorModel error) = Error<T>;

  when({
    required Function(T data) onSuccess,
    required Function(FirebaseErrorModel error) onError,
  }) {
    if (this is Success<T>) {
      onSuccess((this as Success<T>).data);
    } else {
      onError((this as Error<T>).error);
    }
  }
}

class Success<T> extends FirebaseResult<T> {
  final T data;
  const Success(this.data) : super._();
}

class Error<T> extends FirebaseResult<T> {
  final FirebaseErrorModel error;
  const Error(this.error) : super._();
}
