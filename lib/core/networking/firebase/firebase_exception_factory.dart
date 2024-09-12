import 'package:firebase_auth/firebase_auth.dart';

// This class is responsible for creating FirebaseException with the plugin name
// This is useful when you want to throw an exception from a specific plugin
class FirebaseExceptionFactory {
  FirebaseExceptionFactory._();
  static FirebaseException create({
    required String code,
    String? message,
    required FirebasePluginType pluginType,
  }) {
    final String plugin = _getPlugin(pluginType);
    return FirebaseException(
      plugin: plugin,
      message: message,
      code: code,
    );
  }

  static _getPlugin(FirebasePluginType pluginType) {
    switch (pluginType) {
      case FirebasePluginType.auth:
        return "firebase_auth";
      case FirebasePluginType.firestore:
        return "cloud_firestore";
      case FirebasePluginType.storage:
        return "firebase_storage";
      case FirebasePluginType.messaging:
        return "firebase_messaging";
    }
  }
}

enum FirebasePluginType {
  auth,
  firestore,
  storage,
  messaging,
}
