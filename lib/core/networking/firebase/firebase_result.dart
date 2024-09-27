import 'package:tarweej_platform/core/networking/firebase/firebase_error_model.dart';

class FirebaseResult<T> {
  const FirebaseResult._(); // Private constructor

  const factory FirebaseResult.success(T data) = FirebaseSuccess<T>;
  const factory FirebaseResult.error(FirebaseErrorModel error) = FirebaseError<T>;

  when({
    required Function(T data) onSuccess,
    required Function(FirebaseErrorModel error) onError,
  }) {
    if (this is FirebaseSuccess<T>) {
      onSuccess((this as FirebaseSuccess<T>).data);
    } else {
      onError((this as FirebaseError<T>).error);
    }
  }
}

class FirebaseSuccess<T> extends FirebaseResult<T> {
  final T data;
  const FirebaseSuccess(this.data) : super._();
}

class FirebaseError<T> extends FirebaseResult<T> {
  final FirebaseErrorModel error;
  const FirebaseError(this.error) : super._();
}
