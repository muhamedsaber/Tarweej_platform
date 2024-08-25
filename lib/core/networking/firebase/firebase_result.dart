
import 'package:tarweej_platform/core/networking/firebase/firebase_error_model.dart';

class FirebaseResult<T> {
  final T? data;
  final FirebaseErrorModel? error;

  FirebaseResult({this.data, this.error});
  factory FirebaseResult.success(T? data) => FirebaseResult(data: data);
  factory FirebaseResult.error(FirebaseErrorModel? error) =>
      FirebaseResult(error: error);

  when({
    required Function(T? data) onSuccess,
    required Function(FirebaseErrorModel? error) onError,
  }) {
    if (data != null) {
      onSuccess(data);
    } else {
      onError(error);
    }
  }
}
